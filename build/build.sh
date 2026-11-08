#!/usr/bin/env bash
# 分册 Markdown（src/*.md）
#   ->（逐份 pandoc）-> 每份一个 LaTeX 正文片段（无导言区）
#   ->（拼接）-> body.tex
#   ->（eisvogel 模板生成导言区/封面/目录的主文件，正文位置放 \input{body}）
#   ->（latexmk + lualatex）-> PDF
#
# 用法: build/build.sh [输出基名]
#   默认输出 out/signal-linear-review.pdf
#
# 为什么分两步而不是一次 pandoc：
#   pandoc 一次只能产出「一个完整文档」（自带 \begin{document}），多份 md 无法直接合并。
#   这里把每个 md 单独转成**正文片段**（不带导言区），再拼成 body.tex，由主文件 \input 进来。
#   代价是交叉引用过滤器按片段运行，因此正文一律不写 [@eq:] 这类跨文件引用；
#   编号（章/节/小节）全部由 LaTeX 在编译期统一分配。
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SRCDIR="${SRCDIR:-$ROOT/src}"
BASE="${1:-signal-linear-review}"
BASE="${BASE%.pdf}"

TMP="$ROOT/build/tmp"
OUTDIR="$ROOT/out"
STUB="$ROOT/build/stub-body.md"
mkdir -p "$TMP" "$OUTDIR"

# luaotfload 需要可写的字体缓存目录；HOME 下的默认缓存若不可写会导致
# "no writeable cache path" 致命错误，这里把它重定向到 build/tmp/ 内。
export TEXMFVAR="$TMP/texmfvar"
export TEXMFCACHE="$TMP/texmfvar"
mkdir -p "$TEXMFVAR" "$TEXMFCACHE"

# lualatex 的 jobname 不能含 CJK，输出基名含中文时统一映射成 ASCII
JOB="$(printf '%s' "$BASE" | LC_ALL=C sed 's/[^A-Za-z0-9._-]/-/g; s/^[.-]*//; s/[-.]*$//')"
[ -n "$JOB" ] || JOB="document"
TEX="$TMP/$JOB.tex"
LOG="$TMP/$JOB.log"

if ! compgen -G "$SRCDIR/*.md" > /dev/null; then
  echo "错误：$SRCDIR 下没有 .md 分册文件" >&2
  exit 1
fi

# --- [1/5] 逐份转换：每个 md -> 一个正文片段 ---------------------------------
echo "==> [1/5] pandoc: 逐份转换 $SRCDIR/*.md -> $TMP/frag-*.tex"
FRAGS=()
while IFS= read -r f; do
  [ -n "$f" ] || continue
  name="$(basename "$f" .md)"
  frag="$TMP/frag-$name.tex"
  printf '    %-38s -> %s\n' "$(basename "$f")" "$(basename "$frag")"
  pandoc "$f" \
    --from markdown+tex_math_dollars+pipe_tables+footnotes-auto_identifiers \
    --to latex \
    --resource-path="$SRCDIR:$ROOT:$ROOT/work/img" \
    --filter /home/chilly/.local/share/pandoc/filters/pandoc-crossref \
    -M eqnPrefix= -M figPrefix= -M tblPrefix= -M secPrefix= \
    -o "$frag"
  FRAGS+=("$frag")
done < <(find "$SRCDIR" -maxdepth 1 -name '*.md' | LC_ALL=C sort)

# --- [2/5] 拼接正文 ----------------------------------------------------------
BODY="$TMP/body.tex"
: > "$BODY"
for frag in "${FRAGS[@]}"; do
  cat "$frag" >> "$BODY"
  printf '\n\n' >> "$BODY"
done
echo "==> [2/5] 拼接 ${#FRAGS[@]} 个片段 -> build/tmp/body.tex ($(wc -l < "$BODY") 行)"

# --- [3/5] 模板生成主文件 ----------------------------------------------------
echo "==> [3/5] pandoc: 模板生成 $TEX (jobname=$JOB)"
pandoc "$STUB" \
  --metadata-file="$ROOT/work/header.yaml" \
  --from markdown \
  --to latex \
  --template eisvogel.latex \
  --standalone \
  --number-sections \
  --include-in-header "$ROOT/build/header.tex" \
  -V papersize=a4 -V linestretch=1.4 \
  -V titlepage -V toc -V toc-own-page -V numbersections -V colorlinks=true \
  -V tables=true \
  -V mainfont="Libertinus Serif" \
  -V sansfont="Libertinus Sans" \
  -V monofont="Libertinus Mono" \
  -V mathfont="Libertinus Math" \
  -V CJKmainfont="Noto Serif CJK SC" \
  -o "$TEX"

if ! grep -q '\\input{body}' "$TEX"; then
  echo "错误：主文件里没有 \\input{body}，模板未把正文占位写入" >&2
  exit 1
fi

# --- [4/5] 编译 --------------------------------------------------------------
echo "==> [4/5] latexmk -lualatex  (中间文件: build/tmp/)"
rm -f "$TMP/$JOB".{aux,fls,fdb_latexmk,log,toc,out,pdf}
# body.tex 与主文件同在 build/tmp；lualatex 的工作目录是 ROOT，用 TEXINPUTS 让它可被 \input 找到
export TEXINPUTS="$TMP:${TEXINPUTS:-}"
if ! latexmk -lualatex -interaction=nonstopmode -halt-on-error -file-line-error \
     -outdir="$TMP" "$JOB.tex" >"$TMP/$JOB.latexmk.out" 2>&1; then
  echo "!! 编译失败。$LOG 最后 40 行：" >&2
  [ -f "$LOG" ] && tail -n 40 "$LOG" >&2
  [ -f "$TMP/$JOB.latexmk.out" ] && tail -n 20 "$TMP/$JOB.latexmk.out" >&2
  exit 1
fi

echo "==> [5/5] 拷贝产物到 out/"
cp -f "$TEX" "$OUTDIR/$BASE.tex"
cp -f "$TMP/$JOB.pdf" "$OUTDIR/$BASE.pdf"

# --- 校验 --------------------------------------------------------------------
PAGES="$(pdfinfo "$OUTDIR/$BASE.pdf" | awk '/^Pages:/{print $2}')"
ERRS="$(grep -c '^!' "$LOG" || true)"
WARNS="$(grep -ci 'warning' "$LOG" || true)"
MISS="$(grep -c 'Missing character' "$LOG" || true)"
OVER="$(sed -n 's/.*Overfull \\hbox (\([0-9.]*\)pt too wide).*/\1/p' "$LOG" \
        | awk '$1+0 > 20 {n++} END {print n+0}')"

echo "    页数          : $PAGES"
echo "    error         : $ERRS"
echo "    warning       : $WARNS"
echo "    Missing char  : $MISS"
echo "    Overfull >20pt: $OVER"
echo "    输出          : $OUTDIR/$BASE.pdf"
echo "                    $OUTDIR/$BASE.tex"

if [ "$OVER" -gt 0 ]; then
  echo "    --- Overfull \\hbox > 20pt ---"
  grep 'Overfull \\hbox' "$LOG" | sed -n 's/.*(\([0-9.]*\)pt too wide).*/\1&/p' \
    | awk '$1+0 > 20' | cut -c1-160
fi
[ "$ERRS" -gt 0 ] && exit 1
exit 0
