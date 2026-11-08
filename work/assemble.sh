#!/usr/bin/env bash
# 把 work/draft/ 下的各分册按顺序拼成 src/SignalLinear-复习资料.md
# 用法: work/assemble.sh   然后  build/build.sh
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SRC="src/SignalLinear-复习资料.md"
mkdir -p src

cat work/header.yaml work/draft/part0.md > "$SRC"
for p in part1 part2 part3 part4; do
  [ -f "work/draft/$p.md" ] || continue
  printf '\n\n' >> "$SRC"
  cat "work/draft/$p.md" >> "$SRC"
done

echo "已生成 $SRC ($(wc -l < "$SRC") 行, $(grep -c '^# ' "$SRC") 个一级标题)"
