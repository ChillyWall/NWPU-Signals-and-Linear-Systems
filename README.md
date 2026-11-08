# 《信号与线性系统》期末复习资料 — 交付说明

## 交付物

| 文件 | 说明 |
|:---|:---|
| `out/信号与线性系统-复习资料.pdf` | 最终 PDF，A4，105 页（同一文件另存为 `out/signal-linear-review.pdf`） |
| `out/signal-linear-review.tex` | pandoc 生成的 LaTeX 源 |
| `src/SignalLinear-复习资料.md` | 唯一真源（Markdown），由 `work/draft/` 各分册拼接而成 |
| `work/draft/part0..part4.md` | 分册源码：前言 / 第 1-2 章 / 第 3-4 章 / 第 5-6 章 / 三个附录 |
| `work/draft/*.report.md` | 各撰写者的交付报告（含自检、视觉核对页码、遗留问题） |
| `build/build.sh` | 构建脚本 |
| `work/assemble.sh` | 分册拼接脚本 |
| `work/STYLE.md` | 撰写规范（术语、记号、结构契约） |
| `work/txt/` | 14 份原始 PDF 的文本抽取结果（备查） |

## 重建方法

```bash
cd /home/chilly/Projects/notes/SignalLinear
bash work/assemble.sh     # work/draft/*.md -> src/SignalLinear-复习资料.md
bash build/build.sh       # src/*.md -> out/signal-linear-review.{tex,pdf}
```

`build/build.sh` 内置两个必须的环境修正，手工敲 pandoc 时容易漏：

1. `TEXMFVAR` / `TEXMFCACHE` 必须指向可写目录（本机 `~/.texlive2026` 不可写，
   否则 luaotfload 报 `no writeable cache path` 直接失败）；
2. lualatex 的 jobname 不能含 CJK，脚本会把中文输出基名消毒成 ASCII 再编译。

## 排版规格

- 引擎：`latexmk` + `lualatex`（LuaTeX 1.24）
- 模板：`eisvogel.latex`
- 中文：`Noto Serif CJK SC`；西文：`Libertinus Serif` / `Sans` / `Mono`；数学：`Libertinus Math`
- 中文排版：`luatexja-fontspec` 分支，首行缩进 2 字符（`build/header.tex` 用 `\AtBeginDocument` 覆盖模板的 `\parindent=0pt`），行距 1.4，`\arraystretch=1.25`
- 交叉引用：`pandoc-crossref` 已接入（`-F ~/.local/share/pandoc/filters/pandoc-crossref`），编号前缀置空交给正文自行书写；正文实际**未使用** `[@eq:]` 引用，见"决策 3"

## 关键决策

**决策 1 — 编号全部交给 LaTeX。**
标题里不写节号，交叉引用不写节号。原草稿曾有两套问题：手写节号与 LaTeX 编号叠加成"1.2.1 1.1 信号的分类"；以及前言因用 `\section*` 使其子节被编成 0.1–0.5。现在的层级是：章 `1`–`6`（与课程章号一致）→ 节 `1.1 考点清单` 等 → 小节 `1.2.1` 等；前言与三个附录不编号。正文引用改成按小节名引用（"见'卷积积分限的确定'一节"），因此任何重编号都不会让引用失效。

**决策 2 — 响应符号统一为 $y(t)$。**
课本与作业原卷记作 $r(t)$，资料统一为 $y(t)$，并在前言记号表里明确写出这层对应关系。第 1、2 章初稿全篇用 $r(t)$，第 3–6 章用 $y(t)$，现已全篇收口（`r_{zi}`/`r_{zs}`/`r(t)` 在正文中的残留为 0，仅前言与附录 C 各保留一处刻意对照说明）。极点的虚部另用 $\omega_{i}$，与基频 $\omega_{0}$ 区分。

**决策 3 — 行间公式不编号。**
pandoc-crossref 保持启用（后续要加图表编号或公式引用时可直接用），但正文不引用公式编号，故未给公式打 `{#eq:}` 标签。理由：复习资料以"题型"为导航单元，公式编号的检索价值低于表格与题型编号。

**决策 4 — 波形题不插图。**
原题波形是位图，复习资料改用分段函数 + 关键点坐标 + 四界点判据描述（`$(t_k,x_k)\to(t_0+t_k/a,\,Ax_k)$`、卷积积分限的四界点 $a+c,a+d,b+c,b+d$），保证脱离原图也能照着算。

## 已知限制（如实记录）

1. **体量超出预估**：规划时估 60–80 页，实际 105 页。增量来自 33 个题型全部按"题型特征/解题步骤/例题完整精解/同类题"四块展开（正文 84 页）与附录 B 公式速查 9 页（原定 5–7 页）。
2. **部分题面仍依赖原卷位图**：附加作业 1 第 9、10 题的波形刻度标注、附加作业 2 第 2 题的 $x(t)$ 形状属图像内容，正文只给方法与该题已确认的解答数据，未虚构坐标。
3. **第 6 章课件是学生版**，正文对空缺处（罗斯判据递推、两个例题的完整表、一阶/高阶极点稳定条件、反馈系统一节）按标准教材补齐，逐条记在 `work/draft/part3.report.md`。
4. **信号流图与梅森公式**在课件中未涉及，故未收录。
5. 代码块无底色框（eisvogel 的 `Shaded` 为空环境），本文档不使用代码块，无影响。
6. 编译期 10 条 warning 无害：`scrlayer-scrpage \headheight too low`、`csquotes` 无中文样式、`microtype`/`luatexja` patch 提示等。

## 质量验收（实测数据）

| 项目 | 结果 |
|:---|:---|
| 页数 / 纸张 | 105 页 / A4 595.276×841.89 pt |
| 编译错误 | 0 |
| 缺字（Missing character） | 0（★ 151 处、①②③ 各 3 处全部正常渲染） |
| Overfull \hbox > 20pt | 0 |
| 字体嵌入 | `NotoSerifCJKsc-Regular/Bold`、`LibertinusSerif/Sans/Math` 全部 CID Type 0C 内嵌，非 Type3 |
| 标题结构 | 6 章 × 4 节 + 33 个题型，无被 pandoc 转义成 `\#\#\#` 的标题（该坑已专项检查） |
| 作业覆盖 | 附加作业 1（15 题中本册相关 15 处引用）、2、3、4、6 全部题号在文中出现，覆盖面 100% |
| 记号一致性 | `r_{zi}`/`r_{zs}` 残留 0；数字节引用残留 0（仅保留"课件 2.8/2.9 节"这类课件引用） |

## 验收抽查记录

- 与印刷解答逐项核对：附加作业 6 第 8 题稳定域 $0<K<16$（正文一致）、第 9 题 $G(s)=\dfrac{s}{(s+a)(s+3a)(s+4a)}$（正文一致）；附加作业 1 第 4 题方程 $\dfrac{\mathrm{d}^{2}y}{\mathrm{d}t^{2}}+2y\dfrac{\mathrm{d}y}{\mathrm{d}t}-3y=e$ 判定为"非线性 / 时不变"。
- 视觉抽检：封面、目录、考点清单表页、附录 A.2 对照表页、附录 C 页均无溢出、无未解析源码、无缺字。
