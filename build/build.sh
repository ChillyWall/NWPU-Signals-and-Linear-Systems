#!/usr/bin/env bash
# Markdown -> (pandoc + eisvogel) -> LaTeX -> (latexmk + lualatex) -> PDF
# 用法: build/build.sh [输入md] [输出基名]
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SRC="${1:-src/SignalLinear-复习资料.md}"
BASE="${2:-signal-linear-review}"
BASE="${BASE%.pdf}"

TMP="$ROOT/build/tmp"
OUTDIR="$ROOT/out"
mkdir -p "$TMP" "$OUTDIR"

# luaotfload 需要可写的字体缓存目录；HOME 下的默认缓存若不可写会导致
# "no writeable cache path" 致命错误，这里把它重定向到 build/tmp/ 内。
export TEXMFVAR="$TMP/texmfvar"
export TEXMFCACHE="$TMP/texmfvar"
mkdir -p "$TEXMFVAR" "$TEXMFCACHE"

if [ ! -f "$SRC" ]; then
  echo "错误：输入文件不存在：$SRC" >&2
  exit 1
fi

# lualatex 的 jobname 不能含 CJK，输入/输出名含中文时统一映射成 ASCII jobname
JOB="$(printf '%s' "$BASE" | LC_ALL=C sed 's/[^A-Za-z0-9._-]/-/g; s/^[.-]*//; s/[-.]*$//')"
[ -n "$JOB" ] || JOB="document"
TEX="$TMP/$JOB.tex"
LOG="$TMP/$JOB.log"
SRCDIR="$(cd -- "$(dirname -- "$SRC")" && pwd)"

echo "==> [1/4] pandoc: $SRC  ->  $TEX  (jobname=$JOB)"
pandoc "$SRC" \
  --from markdown+tex_math_dollars+pipe_tables+footnotes \
  --to latex \
  --template eisvogel.latex \
  --number-sections \
  --resource-path="$SRCDIR:$ROOT:$ROOT/work/img" \
  --filter /home/chilly/.local/share/pandoc/filters/pandoc-crossref \
  --include-in-header "$ROOT/build/header.tex" \
  -M eqnPrefix= -M figPrefix= -M tblPrefix= -M secPrefix= \
  -V papersize=a4 -V linestretch=1.4 \
  -V titlepage -V toc -V toc-own-page -V numbersections -V colorlinks=true \
  -V mainfont="Libertinus Serif" \
  -V sansfont="Libertinus Sans" \
  -V monofont="Libertinus Mono" \
  -V mathfont="Libertinus Math" \
  -V CJKmainfont="Noto Serif CJK SC" \
  -o "$TEX"

echo "==> [2/4] latexmk -lualatex  (中间文件: build/tmp/)"
# 清掉上一次的中间状态，否则 latexmk 会因 stale .fdb_latexmk 拒绝重跑
rm -f "$TMP/$JOB".{aux,fls,fdb_latexmk,log,toc,out,pdf}
if ! latexmk -lualatex -interaction=nonstopmode -halt-on-error -file-line-error \
     -outdir="$TMP" "$JOB.tex" >"$TMP/$JOB.latexmk.out" 2>&1; then
  echo "!! 编译失败。$LOG 最后 40 行：" >&2
  [ -f "$LOG" ] && tail -n 40 "$LOG" >&2
  [ -f "$TMP/$JOB.latexmk.out" ] && tail -n 20 "$TMP/$JOB.latexmk.out" >&2
  exit 1
fi

echo "==> [3/4] 拷贝产物到 out/"
cp -f "$TEX" "$OUTDIR/$BASE.tex"
cp -f "$TMP/$JOB.pdf" "$OUTDIR/$BASE.pdf"

echo "==> [4/4] 校验"
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
