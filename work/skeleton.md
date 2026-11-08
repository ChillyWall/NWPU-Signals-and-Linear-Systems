---
title: "信号与线性系统 · 复习资料"
subtitle: "构建管线验证骨架（SA5）"
author: "LaTeX 构建工程师 SA5"
date: "2025-11-08"
lang: zh-CN
titlepage: true
toc: true
toc-own-page: true
numbersections: true
documentclass: scrartcl
colorlinks: true
...

# 管线验证总览

本骨架文件的目的不是承载正文，而是把 Markdown → LaTeX → PDF 这条链路上每一种可能出问题的排版单元都真实走一遍：中文长段落、行内与行间公式、带标签的公式交叉引用、四列中文表格、有序列表、引用块，以及二级、三级标题所构成的目录层级。只要本文件能够以零缺字、无显著溢出、交叉引用编号正确的方式编译成 PDF，就可以认为构建管线已经可用，正文作者可以把精力全部放在内容上。这里特意写了一个长度超过两百字的中文段落，其中包含了逗号、句号、顿号、分号、冒号、问号与感叹号，也包含了中文引号“双引号”和‘单引号’，以及圆括号（用于补充说明）、方括号［用于标注引用编号］与全角破折号——这些标点在传统的 LaTeX 里常常引发缺字或断行异常，因此必须在骨架阶段就确认它们能被正确渲染；此外还混入了英文单词 signal、linear 与缩写字 LTI，用来检验中西文混排时的自动间距是否自然，以及两端对齐时是否会出现难看的拉伸。

## 行内公式与数学环境

设连续时间线性时不变系统的冲激响应为 $h(t)$，其频率响应记为 $H(\mathrm{j}\omega)$，则由傅里叶变换的性质可知，卷积运算在频域退化为乘法。对一般的复指数输入 $x(t)=e^{\mathrm{j}\omega_0 t}$，输出为 $y(t)=H(\mathrm{j}\omega_0)e^{\mathrm{j}\omega_0 t}$，这正是“特征函数”一词的由来。下面用三个不同的数学环境分别验证多行对齐、分段函数与矩阵排版能力。

首先是 `aligned` 环境，用来检验等号对齐与多行公式的行距：

$$
\begin{aligned}
y(t) &= \int_{-\infty}^{+\infty} x(\tau) h(t-\tau)\,\mathrm{d}\tau \\
     &= \mathcal{F}^{-1}\bigl\{ \mathcal{F}\{x(t)\} \cdot H(\mathrm{j}\omega) \bigr\}.
\end{aligned}
$$

其次是 `cases` 环境，用来检验左大括号与条件分支的排版：

$$
h_{\mathrm{LP}}(t)=
\begin{cases}
\dfrac{\sin(\omega_c t)}{\pi t}, & t \neq 0,\\[4pt]
\dfrac{\omega_c}{\pi},           & t = 0.
\end{cases}
$$

再次是 `pmatrix` 与 `bmatrix` 环境，用来检验矩阵的括号尺寸与列间距：

$$
\mathbf{A}=\begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix},
\qquad
\mathbf{B}=\begin{bmatrix} 1 & 0 \\ 0 & \mathrm{j} \end{bmatrix}.
$$

## 带标签的公式与交叉引用

下面这条公式带有 `{#eq:test}` 标签，其编号必须由 `pandoc-crossref` 正确接管，正文中对它的引用也必须解析成同一个编号。由式 [@eq:test] 可知，系统的能量可以由频域积分给出；若把式 [@eq:test] 与帕塞瓦尔定理对照，还可以验证 `\mathcal{L}`、`\mathcal{F}`、`\mathrm{j}` 等符号的渲染是否正常。

$$
E=\int_{-\infty}^{+\infty}\bigl|x(t)\bigr|^{2}\,\mathrm{d}t
 =\frac{1}{2\pi}\int_{-\infty}^{+\infty}\bigl|X(\mathrm{j}\omega)\bigr|^{2}\,\mathrm{d}\omega
$$ {#eq:test}

### 表格与中文表头

下表包含中文表头与数学符号，列宽由 Markdown 分隔行的短横数量决定，过长的单元格内容应当自动换行而不是溢出到页边距之外：

| 系统类型 | 时域关系 | 频域关系 | 说明 |
|:---------|:-----------------|:-------------------|:------------------------------|
| 连续 LTI | $y(t)=x(t)*h(t)$ | $Y(\mathrm{j}\omega)=X(\mathrm{j}\omega)H(\mathrm{j}\omega)$ | 卷积定理，适用于绝对可积的输入信号 |
| 离散 LTI | $y[n]=x[n]*h[n]$ | $Y(e^{\mathrm{j}\Omega})=X(e^{\mathrm{j}\Omega})H(e^{\mathrm{j}\Omega})$ | 需注意单位圆上的收敛性 |
| 无失真传输 | $y(t)=K x(t-t_d)$ | $H(\mathrm{j}\omega)=Ke^{-\mathrm{j}\omega t_d}$ | 幅频为常数，相频为线性 |
| 理想低通 | $h(t)=\frac{\omega_c}{\pi}\mathrm{sinc}(\omega_c t)$ | $\lvert H\rvert=1,\ \lvert\omega\rvert\le\omega_c$ | 非因果，物理不可实现 |

### 列表与引用块

有序列表用于检验编号与悬挂缩进的配合，其中的行内公式不应破坏行距：

1. 先求系统的冲激响应 $h(t)$，判断其是否绝对可积；
2. 再做拉普拉斯变换，得到 $H(s)=\mathcal{L}\{h(t)\}$ 并标注收敛域；
3. 最后在虚轴上取 $s=\mathrm{j}\omega$，得到频率响应并画出幅频、相频特性。

下面是一个引用块，用来检验左侧竖线与段首缩进的相互作用：

> 一个系统是因果的，当且仅当其冲激响应满足 $h(t)=0$ 对一切 $t<0$ 成立；
> 一个系统是有界的（BIBO 稳定），当且仅当 $\int_{-\infty}^{+\infty}\lvert h(t)\rvert\,\mathrm{d}t<\infty$。
> 这两条判据在离散情形下有完全平行的形式，只需把积分换成求和。

### 代码块缩进检查

下面这段代码块用于确认代码块内部不会继承中文段落的 2em 首行缩进：

```python
def impulse_response(t, omega_c=1.0):
    """理想低通滤波器的冲激响应（非因果，仅作演示）"""
    if t == 0.0:
        return omega_c / 3.141592653589793
    return math.sin(omega_c * t) / (math.pi * t)
```
