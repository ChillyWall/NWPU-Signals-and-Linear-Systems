# build/ 使用说明

```bash
build/build.sh                       # 默认: src/*.md -> out/signal-linear-review.pdf
build/build.sh my-notes              # 自定义输出基名 -> out/my-notes.pdf
SRCDIR=/tmp/md build/build.sh        # 换分册目录
```

输出基名可含中文：脚本把它消毒成 ASCII latex jobname，中间文件全部落在 `build/tmp/`。

## 流水线（五步，分册构建）

```
src/00-前言.md ┐
src/01-绪论.md ├─ pandoc（逐份）→ build/tmp/frag-*.tex   ← 每份只产出“正文片段”
      ...      │
src/09-附录C.md┘
        ↓ 按文件名排序拼接
   build/tmp/body.tex
        ↓ 与模板生成的主文件合并（主文件正文位置是 \input{body}）
   build/tmp/<job>.tex   ← 导言区 + 封面 + 目录 + \input{body} + \end{document}
        ↓ latexmk -lualatex
   out/<base>.pdf
```

为什么分两步：pandoc 一次只能产出**一个完整文档**（自带 `\begin{document}`），多份 md 无法直接合并。
所以每份 md 单独转成不带导言区的正文片段，拼成 `body.tex`，再由模板生成的主文件 `\input` 进来。

三个必须知道的坑（都已在本脚本里处理）：

| 坑 | 处理 |
|:--|:--|
| 片段模式没有导言区，`longtable` 等由 pandoc 按"文档含表"条件注入的宏包会缺失，编译报 `Environment longtable undefined` | 生成主文件时加 `-V tables=true`，让模板的 `$if(tables)$` 两份代码块（pandoc 表格宏包 + eisvogel 表格线样式）都生效 |
| `\input{body}` 需要能被找到，而 lualatex 的工作目录是仓库根 | `export TEXINPUTS=build/tmp:` 后再跑 latexmk |
| 分册各自生成标题锚点，六章同名的"考点清单""易错点"会产生重复 `\label`，TOC 链接指向错页 | 片段转换用 `-f markdown-auto_identifiers` 关掉自动标识符；本文档不使用任何 `\label` 交叉引用 |

## 关键参数（在 build.sh 内）

| 参数 | 作用 |
|:--|:--|
| `--template eisvogel.latex` | KOMA-scrartcl 模板，封面/目录/页眉页脚由 `work/header.yaml` 或 `-V` 开关控制 |
| `--metadata-file=work/header.yaml` | 文档元数据（标题/副标题/作者/日期/语言/纸张/行距）只有这一处定义 |
| `--filter .../pandoc-crossref` | 交叉引用；`-M eqnPrefix=` 等前缀置空，编号前缀由正文自己写。**按片段运行**，故正文不写跨文件 `[@eq:]` 引用 |
| `-V tables=true` | 见上表第一行 |
| `-V CJKmainfont=Noto Serif CJK SC` | 触发 eisvogel 的 lualatex 分支（`luatexja-fontspec` + `\setmainjfont`）；**仅 CJKmainfont 对 LuaTeX 生效**，CJKsansfont/CJKmonofont 只走 xelatex 分支 |
| `-V mainfont/sansfont/monofont/mathfont` | Libertinus Serif/Sans/Mono/Math |
| `--include-in-header build/header.tex` | 中文首行缩进 2em（必须用 `\AtBeginDocument`，模板末尾会把 `\parindent` 清零）、`\arraystretch{1.25}`、luatexja 中文断行 |
| `export TEXMFVAR=build/tmp/texmfvar` | luaotfload 字体缓存重定向；HOME 下缓存不可写会致命报错 |

## 注意

- `build/stub-body.md` 只有一行 `\input{body}`，是正文占位符，**不要删**；脚本会校验主文件里确实出现了它。
- 分册文件名以数字前缀排序（`00-`…`09-`），新增章节请沿用该约定，排序即目录顺序。
- 不要启用 `filters/table-rules.lua`：它加竖线，与 booktabs 风格冲突。
- 代码块用 pandoc 默认 fancyvrb（无底色框）；需要底色请改 `--listings`，但会与当前竖排参数冲突。
- 编译失败时脚本打印 `<job>.log` 最后 40 行，并统计 error/warning/缺字/Overfull>20pt。
