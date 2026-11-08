# build/ 使用说明

```bash
build/build.sh work/skeleton.md skeleton        # 骨架自检
build/build.sh                                  # 默认: src/SignalLinear-复习资料.md -> out/signal-linear-review.pdf
```

输入 md 与输出基名可含中文：脚本把输出基名消毒成 ASCII latex jobname，中间文件全部落在 `build/tmp/`。

## 关键参数（在 build.sh 内）

| 参数 | 作用 |
|:--|:--|
| `--template eisvogel.latex` | KOMA-scrartcl 模板，封面/目录/页眉页脚由 YAML 或 `-V` 开关控制 |
| `--filter .../pandoc-crossref` | 交叉引用；`-M eqnPrefix=` 等置空，编号前缀由正文自己写（"由式 [@eq:test]" → "由式 1"） |
| `-V CJKmainfont=Noto Serif CJK SC` | 触发 eisvogel 的 lualatex 分支（`luatexja-fontspec` + `\setmainjfont`）；**仅 CJKmainfont 对 LuaTeX 生效**，CJKsansfont/CJKmonofont 只走 xelatex 分支 |
| `-V mainfont/sansfont/monofont/mathfont` | Libertinus Serif/Sans/Mono/Math |
| `-V linestretch=1.4` | 行距 |
| `--include-in-header build/header.tex` | 中文首行缩进 2em（必须用 `\AtBeginDocument`，模板末尾会把 `\parindent` 清零）、`\arraystretch{1.25}`、luatexja 中文断行 |
| `export TEXMFVAR=build/tmp/texmfvar` | luaotfload 字体缓存重定向；HOME 下缓存不可写会致命报错 |

## 注意

- 不要启用 `filters/table-rules.lua`：它加竖线，与 booktabs 风格冲突。
- 代码块用 pandoc 默认 fancyvrb（无底色框）；需要底色请改 `--listings`，但会与当前竖排参数冲突。
- 编译失败时脚本打印 `build/tmp/<job>.log` 最后 40 行，并统计 error/warning/缺字/Overfull>20pt。
