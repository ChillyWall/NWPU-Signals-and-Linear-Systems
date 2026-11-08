# 连续信号的正交分解

## 考点清单

| 考点 | 常见考法 | 重要度 |
|:-----|:---------|:------:|
| 正交函数与正交函数集 | 判断两函数在给定区间上是否正交 | ★★ |
| 正交分解的最佳系数 | 要求方均误差最小，求近似式的系数 | ★★★ |
| 完备正交函数集 | 归一化、正交化、完备性三条含义判断 | ★★ |
| 三角形式傅里叶级数 | 给波形或表达式求 $a_0$、$a_n$、$b_n$ | ★★★ |
| 指数形式傅里叶级数 | 与三角形式互化，写出 $c_n$ 与负频率项 | ★★★ |
| 周期信号的频谱 | 画单边/双边频谱，读谱得幅度与相位 | ★★★ |
| 频谱的离散性、谐波性、收敛性 | 判断频谱图形是否合法、估计包络衰减 | ★★ |
| 周期信号的功率与帕塞瓦尔定理 | 求平均功率、有效值、方均误差 | ★★★ |
| 周期信号的频带宽度 | 按三种定义求 $B$，判断脉宽与带宽关系 | ★★ |
| 函数的奇偶性与级数成分 | 判断级数只含正弦项、余弦项还是二者皆有 | ★★★ |

## 核心概念与公式

### 正交函数与正交函数集

**正交**：在区间 $(t_1,t_2)$ 上若

$$
\int_{t_1}^{t_2} f_1(t)f_2(t)\,\mathrm{d}t = 0
$$

则称 $f_1(t)$ 与 $f_2(t)$ 在该区间上正交。复函数的内积取共轭：

$$
\int_{t_1}^{t_2} f_1(t)f_2^{*}(t)\,\mathrm{d}t = 0
$$

什么时候用：题目给两个函数和一个区间，问"是否正交"，
只需算定积分看是否为零；零则正交，非零则不正交。

**正交函数集**：若 $n$ 个函数 $\{f_1,f_2,\cdots,f_n\}$ 在区间 $(t_1,t_2)$
上两两正交，则称为正交函数集；若还满足每个函数自身内积为 $1$，
则称为归一化正交函数集。

**易混点**："正交"只在**指定的区间**上成立。同一对函数换了区间，
结论可以完全相反，所以答题时区间必须与题目一致。

### 信号的正交分解与最佳系数

用单个函数近似：设 $f(t)\approx c_1f_1(t)$，方均误差定义为

$$
\overline{\varepsilon^{2}(t)}
=\frac{1}{t_2-t_1}\int_{t_1}^{t_2}\bigl[f(t)-c_1f_1(t)\bigr]^{2}\,\mathrm{d}t
$$

对 $c_1$ 求极小（令导数 $\frac{\mathrm{d}}{\mathrm{d}c_1}\overline{\varepsilon^{2}}=0$），
得方均误差最小的**最佳系数**

$$
c_1=\frac{\int_{t_1}^{t_2} f(t)f_1(t)\,\mathrm{d}t}
{\int_{t_1}^{t_2} f_1^{2}(t)\,\mathrm{d}t}
$$

成立条件：$f_1(t)$ 在区间上平方可积且不恒为零。

用 $n$ 个正交函数近似：$f(t)\approx\sum_{i=1}^{n}c_if_i(t)$，各系数
**互不影响**，每个都按上式单独求：

$$
c_i=\frac{\int_{t_1}^{t_2} f(t)f_i(t)\,\mathrm{d}t}
{\int_{t_1}^{t_2} f_i^{2}(t)\,\mathrm{d}t},\qquad i=1,2,\cdots,n
$$

此时最小方均误差为

$$
\overline{\varepsilon^{2}(t)}
=\frac{1}{t_2-t_1}\left[\int_{t_1}^{t_2} f^{2}(t)\,\mathrm{d}t
-\sum_{i=1}^{n}c_i^{2}\int_{t_1}^{t_2} f_i^{2}(t)\,\mathrm{d}t\right]\ge 0
$$

最后这个"$\ge 0$"就是**贝塞尔不等式**，它给了一个上界：
任何有限项正交展开都不可能比原信号能量还大。

什么时候用：凡是出现"方均误差最小""最佳近似""正弦信号近似表示"
字样，一律用"内积除以自内积"，不要去解微分方程。

### 完备正交函数集

| 条件 | 数学表述 | 作用 |
|:-----|:---------|:-----|
| 归一化 | $\int_{t_1}^{t_2} f_i f_i^{*}\,\mathrm{d}t=1$ | 系数公式分母化为 $1$ |
| 正交化 | $\int_{t_1}^{t_2} f_i f_j^{*}\,\mathrm{d}t=0,\ i\ne j$ | 各系数可独立求解 |
| 完备性 | 可用其线性组合表示任意信号 | 展开无残差 |

**完备性**的准确含义：不存在与集合中每个函数都正交的非零函数。
若集合不完备，则再多项也无法把方均误差压到零。

什么时候用：问"为什么傅里叶级数能表示任意周期信号"——因为三角函数集
与复指数函数集都是完备正交函数集。

### 三角形式傅里叶级数

设 $f(t)$ 周期为 $T$，基频 $\omega_{0}=\frac{2\pi}{T}$（课件记作 $\Omega$，
同一个量；本资料全篇统一用 $\omega_{0}$），则

$$
f(t)=\frac{a_0}{2}+\sum_{n=1}^{+\infty}\bigl(a_n\cos n\omega_{0} t
+b_n\sin n\omega_{0} t\bigr)
$$

系数由"内积除以自内积"直接得出（这就是 3.2 的最佳系数）：

$$
a_n=\frac{2}{t_2-t_1}\int_{t_1}^{t_2} f(t)\cos n\omega_{0} t\,\mathrm{d}t,
\qquad n=0,1,2,\cdots
$$

$$
b_n=\frac{2}{t_2-t_1}\int_{t_1}^{t_2} f(t)\sin n\omega_{0} t\,\mathrm{d}t,
\qquad n=1,2,\cdots
$$

其中 $t_2-t_1=T$；若取主值区间 $(-\frac{T}{2},\frac{T}{2})$，
系数就是 $\frac{2}{T}\int_{-T/2}^{T/2}\cdots\mathrm{d}t$。
注意 $a_0$ 是把 $n=0$ 代入 $a_n$ 的公式得到的，所以
**直流分量是 $\frac{a_0}{2}$ 而不是 $a_0$**。

**成立条件（狄利克雷条件）**，三条缺一不可：

1. 在一周期内连续，或只有有限个第一类间断点；
2. 在一周期内极大值与极小值的数目有限；
3. 在一周期内绝对可积，即 $\int_{t_1}^{t_1+T}|f(t)|\,\mathrm{d}t<\infty$。

在间断点 $t_0$ 处，级数收敛到左右极限的平均值
$\frac{f(t_0^{+})+f(t_0^{-})}{2}$，不等于 $f(t_0)$ 本身。

**另一种等价写法（幅度-相角形式）**：

$$
f(t)=\frac{A_0}{2}+\sum_{n=1}^{+\infty}A_n\cos(n\omega_{0} t+\varphi_n),
\qquad A_n=\sqrt{a_n^{2}+b_n^{2}}
$$

其中 $a_n=A_n\cos\varphi_n$，$b_n=-A_n\sin\varphi_n$，
$\varphi_n=-\arctan\frac{b_n}{a_n}$，且 $\varphi_n$ 的象限由
$(a_n,-b_n)$ 所在象限决定，不能只看反正切主值。

### 指数形式傅里叶级数及三种形式换算

$$
f(t)=\sum_{n=-\infty}^{+\infty}c_ne^{\mathrm{j}n\omega_{0} t},
\qquad
c_n=\frac{1}{T}\int_{t_1}^{t_1+T} f(t)e^{-\mathrm{j}n\omega_{0} t}\,\mathrm{d}t
$$

由于 $e^{\mathrm{j}n\omega_{0} t}$ 与 $e^{-\mathrm{j}n\omega_{0} t}$ 成对出现，
复指数形式一定含**负频率**。负频率没有物理意义，只是数学上的配对项，
但画双边频谱时必须画出来。

对实信号 $f(t)$，三种形式之间的换算是固定的：

$$
c_n=\frac{1}{2}\left(a_n-\mathrm{j}b_n\right),
\qquad
c_{-n}=\frac{1}{2}\left(a_n+\mathrm{j}b_n\right)=c_n^{*},
\qquad
c_0=\frac{a_0}{2}
$$

| 形式 | 直流项 | 第 $n$ 次谐波项 | 系数范围 |
|:-----|:-------|:----------------|:---------|
| 三角（正弦余弦） | $\frac{a_0}{2}$ | $a_n\cos n\omega_{0} t+b_n\sin n\omega_{0} t$ | $n\ge 1$ |
| 三角（幅度相角） | $\frac{A_0}{2}$ | $A_n\cos(n\omega_{0} t+\varphi_n)$ | $n\ge 1$ |
| 复指数 | $c_0=\frac{a_0}{2}$ | 成对出现 $c_n$ 与 $c_{-n}$ 两项 | 全部整数 |

三条换算口诀：$c_0=\frac{a_0}{2}=\frac{A_0}{2}$；$|c_n|=\frac{A_n}{2}$（$n\ge1$），
且 $|c_{-n}|=|c_n|$；$c_n$ 的辐角就是 $+\varphi_n$，而 $c_{-n}$ 的辐角是 $-\varphi_n$。

### 周期信号的频谱

**频谱**是把各频率分量的系数画在"频率轴"上得到的图形，
横坐标是 $\omega$（或 $n\omega_{0}$），纵坐标是幅度或相位。

**单边频谱**：只画 $\omega\ge 0$，纵坐标为 $A_n$ 与 $\varphi_n$，
$n=0$ 处的值是 $\frac{A_0}{2}$（即直流分量）。

**双边频谱**：画 $\omega$ 全部取值，纵坐标为 $|c_n|$ 与 $\arg c_n$。
实信号的双边幅度谱关于纵轴**偶对称**，相位谱**奇对称**，
所以只画 $\omega\ge 0$ 一半也能还原全部信息。

**幅度换算**：$n\ge 1$ 时单边幅度是双边幅度的两倍，$A_n=2|c_n|$；
$n=0$ 时单边画 $\frac{A_0}{2}=c_0$，双边画 $|c_0|$，二者相等。

**三条特点**（判断频谱图是否合法的三条标尺）：

- 离散性：谱线是一条条不连续的线，不是连续曲线；
- 谐波性：谱线只出现在基频 $\omega_{0}$ 的整数倍处，间隔恒为 $\omega_{0}$；
- 收敛性：$n\to\infty$ 时 $|c_n|\to 0$，包络随频率衰减。

**周期矩形脉冲**（幅度 $E$、脉宽 $\tau$、周期 $T$）是必背模型：

$$
c_n=\frac{E\tau}{T}\,\mathrm{Sa}\!\left(\frac{n\omega_{0}\tau}{2}\right)
=\frac{E\tau}{T}\cdot\frac{\sin(n\omega_{0}\tau/2)}{n\omega_{0}\tau/2}
$$

其中抽样函数 $\mathrm{Sa}(x)=\frac{\sin x}{x}$（与 $\mathrm{sinc}$ 定义相差
一个 $\pi$ 因子，本资料统一用 $\mathrm{Sa}$），且 $\mathrm{Sa}(0)=1$。
包络的第一个零点在 $\frac{n\omega_{0}\tau}{2}=\pi$，即 $f=\frac{1}{\tau}$。

### 周期信号的功率与帕塞瓦尔定理

周期信号功率有限、能量无限，所以只谈**平均功率**。设周期为 $T$：

$$
P=\frac{1}{T}\int_{t_1}^{t_1+T} f^{2}(t)\,\mathrm{d}t
=\frac{a_0^{2}}{4}+\sum_{n=1}^{+\infty}\frac{a_n^{2}+b_n^{2}}{2}
=\frac{A_0^{2}}{4}+\sum_{n=1}^{+\infty}\frac{A_n^{2}}{2}
=\sum_{n=-\infty}^{+\infty}|c_n|^{2}
$$

成立条件：$f(t)$ 周期且在一个周期内平方可积（功率有限）。

**帕塞瓦尔定理**说的就是上式最后一步的等式：时域平均功率等于
各次谐波平均功率之和，功率可以"按频率分配"。由此得到有效值

$$
f_{\mathrm{rms}}=\sqrt{P}
=\sqrt{\frac{A_0^{2}}{4}+\sum_{n=1}^{+\infty}\frac{A_n^{2}}{2}}
$$

注意有效值**不能**逐项相加，只有功率能相加。

对非周期信号改谈能量，对应式是
$$
E=\int_{-\infty}^{+\infty}f^{2}(t)\,\mathrm{d}t
=\frac{1}{2\pi}\int_{-\infty}^{+\infty}|F(\mathrm{j}\omega)|^{2}\,\mathrm{d}\omega
$$
（成立条件：$f(t)$ 能量有限，也就是平方可积。这里要区分两个条件：
"平方可积"与"绝对可积"是两回事，不能互推。平方可积不一定绝对可积，
反例 $f(t)=t^{-3/4}u(t-1)$ 满足 $\int|f|^{2}\mathrm{d}t<\infty$ 但
$\int|f|\mathrm{d}t=\infty$；绝对可积也不一定平方可积，反例
$f(t)=t^{-1/2}$ 在 $(0,1)$ 上。傅里叶**变换的存在条件**用的是绝对可积
（见“傅里叶变换的定义与存在条件”一节），而帕塞瓦尔等式只要求信号能量有限。）

### 周期信号的频带宽度

由于收敛性，可以只保留主要分量、丢掉高频尾巴，被保留的频率区间
就是**频带**。三种定义必须在题目中认准是哪一种：

1. 以最大幅度的 $\frac{1}{10}$ 为限；
2. 以幅度谱的**第一个过零点**为限（最常用）；
3. 以包含总能量（功率）的 $90\%$ 为限。

按第 2 种定义，周期矩形脉冲的频带宽度为

$$
B_{\omega}=\frac{2\pi}{\tau}\ \mathrm{rad/s},
\qquad B_{f}=\frac{1}{\tau}\ \mathrm{Hz}
$$

即 $B_{\omega}\tau=2\pi$、$B_{f}\tau=1$：**脉宽越窄，带宽越宽**。
更一般的结论是"边沿变化越快（跳变越陡），频带越宽"，
所以三角波的频带比方波窄、正弦波最窄。

## 典型题型与解法

### 题型 3-1 用方均误差最小求正交分解系数并验证正交性

**题型特征**：给一个区间和一个具体波形（方波、三角波等），
要求"用某正弦/余弦信号近似，方均误差最小"，或"证明与某函数正交"。

**解题步骤**：

1. 写清区间 $(t_1,t_2)$，把近似式写成 $f(t)\approx c_1f_1(t)$；
2. 套最佳系数公式：分子算 $\int_{t_1}^{t_2} f(t)f_1(t)\,\mathrm{d}t$，
   分母算 $\int_{t_1}^{t_2} f_1^{2}(t)\,\mathrm{d}t$，分段函数按段积分；
3. 分母常用半角公式 $\sin^{2}\theta=\frac{1-\cos 2\theta}{2}$ 化简；
4. 验证正交只算 $\int_{t_1}^{t_2} f(t)g(t)\,\mathrm{d}t$，
   分段代入后看是否为零，**不要**去算系数。

**例题**（【附加作业3 第1题】）：已知

$$
f(t)=\begin{cases}
1, & 0<t<\pi\\
-1, & \pi<t<2\pi
\end{cases}
$$

(1) 在同一区间上用正弦信号近似 $f(t)$，要求方均误差最小，
写出该正弦信号的表达式；(2) 证明 $f(t)$ 与同一区间上的
$\cos nt$（$n$ 为整数）正交。

解 (1)：区间为 $(0,2\pi)$，取 $f_1(t)=\sin t$，设近似式为
$f(t)\approx c_{12}\sin t$。由最佳系数公式

$$
c_{12}=\frac{\int_{0}^{2\pi} f(t)\sin t\,\mathrm{d}t}
{\int_{0}^{2\pi}\sin^{2}t\,\mathrm{d}t}
$$

分子分段积分：

$$
\int_{0}^{2\pi} f(t)\sin t\,\mathrm{d}t
=\int_{0}^{\pi}\sin t\,\mathrm{d}t-\int_{\pi}^{2\pi}\sin t\,\mathrm{d}t
=2-(-2)=4
$$

其中 $-\cos t\big|_{0}^{\pi}=2$，$-\cos t\big|_{\pi}^{2\pi}=-2$。
分母用半角公式：

$$
\int_{0}^{2\pi}\sin^{2}t\,\mathrm{d}t
=\int_{0}^{2\pi}\frac{1-\cos 2t}{2}\,\mathrm{d}t
=\frac{1}{2}\cdot 2\pi-\frac{1}{4}\sin 2t\Big|_{0}^{2\pi}=\pi
$$

所以 $c_{12}=\frac{4}{\pi}\approx 1.273$，即近似正弦信号为

$$
f(t)\approx\frac{4}{\pi}\sin t
$$

（这里 $f_1=\sin t$ 未归一化，分母 $\pi\ne 1$，所以系数不是 $\frac{4}{\pi}$ 之外
的别的值；若改写成归一化基 $\frac{\sin t}{\sqrt{\pi}}$，系数才变成 $\frac{4}{\sqrt{\pi}}$，
两者给出的近似信号完全一样。）

解 (2)：$n$ 为整数，直接算内积：

$$
\int_{0}^{2\pi} f(t)\cos nt\,\mathrm{d}t
=\int_{0}^{\pi}\cos nt\,\mathrm{d}t-\int_{\pi}^{2\pi}\cos nt\,\mathrm{d}t
$$

当 $n\ne 0$ 时，

$$
=\frac{1}{n}\sin nt\Big|_{0}^{\pi}-\frac{1}{n}\sin nt\Big|_{\pi}^{2\pi}
=\frac{\sin n\pi}{n}-\frac{\sin 2n\pi-\sin n\pi}{n}=0
$$

当 $n=0$ 时 $\cos 0=1$，积分为 $\pi-\pi=0$。故对所有整数 $n$ 内积为零，
$f(t)$ 与 $\cos nt$ 在 $(0,2\pi)$ 上正交。

**同类题**：

- 【附加作业3 第3题】判断级数只含正弦项还是余弦项，关键是看
  "在一个完整周期上延拓后的奇偶性"，而不是看区间内的表达式。

### 题型 3-2 由波形展开三角形式傅里叶级数并控制方均误差

**题型特征**：给波形图（三角波、方波、锯齿波），要求在指定区间
展开为有限项三角级数，并使方均误差小于总能量的某个百分比。

**解题步骤**：

1. 写出分段表达式，读出周期 $T$ 与基频 $\omega_{0}=\frac{2\pi}{T}$；
2. 判断奇偶性：偶函数 $b_n=0$，奇函数 $a_n=0$、$a_0=0$，
   可省一半积分；
3. 算 $a_0$（或 $a_n$）：分段积分，含 $t\cos nt$ 的项用分部积分，
   注意 $\cos n\pi=(-1)^{n}$；
4. 算总能量 $E=\int_{t_1}^{t_2} f^{2}(t)\,\mathrm{d}t$；
5. 用 $\overline{\varepsilon^{2}}=\frac{1}{t_2-t_1}\bigl[E-\sum c_i^{2}k_i\bigr]$
   逐项累加，比较 $\frac{\overline{\varepsilon^{2}}}{E}$ 与题目给的百分比，
   取到刚好满足为止；
6. 写出有限项级数并注明 $n$ 的取值范围。

**例题**（【附加作业3 第2题】）：三角信号在 $(-\pi,\pi)$ 上为
关键点 $(-\pi,0)$、$(0,A)$、$(\pi,0)$ 连成的折线，即

$$
f(t)=\begin{cases}
A\left(1+\dfrac{t}{\pi}\right), & -\pi\le t\le 0\\[4pt]
A\left(1-\dfrac{t}{\pi}\right), & 0\le t\le\pi
\end{cases}
$$

要求有限项三角级数与实际信号的方均误差小于 $f(t)$ 总能量的 $1\%$。

解：$f(t)$ 在 $(-\pi,\pi)$ 上是偶函数，故 $b_n=0$；又 $T=2\pi$，
$\omega_{0}=\frac{2\pi}{T}=1$。

$$
a_0=\frac{2}{T}\int_{0}^{T} f(t)\,\mathrm{d}t
=\frac{1}{\pi}\left[\int_{-\pi}^{0}A\left(1+\frac{t}{\pi}\right)\mathrm{d}t
+\int_{0}^{\pi}A\left(1-\frac{t}{\pi}\right)\mathrm{d}t\right]
$$

两个积分都等于 $\frac{A\pi}{2}$（三角形面积除以底），故

$$
a_0=\frac{1}{\pi}\left(\frac{A\pi}{2}+\frac{A\pi}{2}\right)=A
$$

于是直流分量为 $\frac{a_0}{2}=\frac{A}{2}$。再算余弦系数：

$$
a_n=\frac{2}{T}\int_{-\pi}^{\pi} f(t)\cos nt\,\mathrm{d}t
=\frac{1}{\pi}\cdot 2\int_{0}^{\pi}A\left(1-\frac{t}{\pi}\right)\cos nt\,\mathrm{d}t
$$

括号里第一项 $\int_{0}^{\pi}\cos nt\,\mathrm{d}t=0$（$n\ge 1$），第二项

$$
\int_{0}^{\pi}t\cos nt\,\mathrm{d}t
=\frac{t\sin nt}{n}\Big|_{0}^{\pi}+\frac{\cos nt}{n^{2}}\Big|_{0}^{\pi}
=\frac{\cos n\pi-1}{n^{2}}
$$

所以

$$
a_n=\frac{2A}{\pi}\cdot\left(-\frac{1}{\pi}\right)
\cdot\frac{\cos n\pi-1}{n^{2}}=\frac{2A}{n^{2}\pi^{2}}\bigl(1-\cos n\pi\bigr)
=\begin{cases}
\dfrac{4A}{n^{2}\pi^{2}}, & n=1,3,5,\cdots\\[6pt]
0, & n=2,4,6,\cdots
\end{cases}
$$

于是

$$
f(t)=A\left[\frac{1}{2}+\frac{4}{\pi^{2}}\left(\cos t+\frac{1}{3^{2}}\cos 3t
+\frac{1}{5^{2}}\cos 5t+\cdots\right)\right]
$$

总能量

$$
E=\int_{-\pi}^{\pi}f^{2}(t)\,\mathrm{d}t
=2\int_{0}^{\pi}A^{2}\left(1-\frac{t}{\pi}\right)^{2}\mathrm{d}t
=\frac{2A^{2}\pi}{3}
$$

只取直流一项（$c_1=\frac{A}{2}$、$k_1=2\pi$）时

$$
\overline{\varepsilon_0^{2}}
=\frac{1}{2\pi}\left(\frac{2\pi A^{2}}{3}-\frac{A^{2}}{4}\cdot 2\pi\right)
=\frac{A^{2}}{12}
$$

$$
\frac{\overline{\varepsilon_0^{2}}}{E}=\frac{A^{2}/12}{2\pi A^{2}/3}
=\frac{1}{8\pi}\approx 3.98\%>1\%
$$

不满足。再取直流加基波（$c_2=\frac{4A}{\pi^{2}}$、$k_2=\pi$）：

$$
\overline{\varepsilon_1^{2}}
=\frac{1}{2\pi}\left[\frac{2\pi A^{2}}{3}-\frac{A^{2}}{4}\cdot 2\pi
-\frac{16A^{2}}{\pi^{4}}\cdot\pi\right]
=\frac{A^{2}}{12}-\frac{8A^{2}}{\pi^{4}}
$$

$$
\frac{\overline{\varepsilon_1^{2}}}{E}
=\frac{0.08333A^{2}-0.08213A^{2}}{2.0944A^{2}}\approx 0.0575\%<1\%
$$

满足要求。故至少取两项（直流加基波）：

$$
f(t)\approx A\left(\frac{1}{2}+\frac{4}{\pi^{2}}\cos t\right)
$$

**同类题**：

- 【附加作业3 第5题】求 $(\cos\omega_c t)^{2}$ 的直流分量：先用
  $\cos^{2}\theta=\frac{1+\cos 2\theta}{2}$ 展开，直流分量即为常数项 $0.5$。

### 题型 3-3 判断傅里叶级数只含正弦项还是余弦项

**题型特征**：给一个函数和**指定区间**（常为 $\left(0,\frac{T}{2}\right)$），
问"仅有余弦项、仅有正弦项、还是二者均有"。

**解题步骤**：

1. 在指定区间之外做**周期延拓**，得到整周期的波形；
2. 看延拓后的波形关于纵轴是否对称（偶 → 只有余弦和直流；
   奇 → 只有正弦）；
3. 再看是否满足 $f(t+\frac{T}{2})=-f(t)$（奇谐 → 只有奇次谐波）
   或 $f(t+\frac{T}{2})=f(t)$（偶谐 → 只有偶次谐波与直流）；
4. 结论一句话写清"延拓后为奇函数，故仅有正弦项"。

**例题**：已知周期为 $T$ 的信号在 $\left(0,\frac{T}{2}\right)$ 内
$f(t)=E$，在 $\left(\frac{T}{2},T\right)$ 内 $f(t)=-E$，
判断其三角级数含哪些成分。

解：取主值区间 $\left(-\frac{T}{2},\frac{T}{2}\right)$，波形为
$\left(-\frac{T}{2},0\right)$ 上 $-E$、$\left(0,\frac{T}{2}\right)$ 上 $+E$。
由于 $f(-t)=-f(t)$，是奇函数，故 $a_0=0$、$a_n=0$，只含正弦项。
又 $f\left(t+\frac{T}{2}\right)=-f(t)$，是奇谐函数，故只含奇次谐波。
其系数为 $b_n=\frac{4E}{n\pi}$（$n$ 为奇数）$0$（$n$ 为偶数），即

$$
f(t)=\frac{4E}{\pi}\left(\sin\omega_{0} t+\frac{1}{3}\sin 3\omega_{0} t
+\frac{1}{5}\sin 5\omega_{0} t+\cdots\right)
$$

**同类题**：

- 【附加作业3 第3题】$f(t)=A\cos\frac{2\pi}{T}t$ 在
  $\left(0,\frac{T}{2}\right)$ 上延拓后为奇函数，故**仅含正弦项**；
  陷阱在于 $f(t)$ 本身是余弦表达式，但看的是延拓波形的奇偶性。

### 题型 3-4 非正弦周期信号的三种级数形式换算

**题型特征**：给几个不同频率的正弦/余弦项相加（常含相移 $\frac{\pi}{2}$），
要求周期与基频、余弦形式三角级数、指数形式级数。

**解题步骤**：

1. 把每一项写成 $\cos(\omega_i t+\theta_i)$ 的标准形式，
   利用 $\sin\alpha=\cos\left(\alpha-\frac{\pi}{2}\right)$；
2. 各 $\omega_i$ 除以最小角频率得到谐波次数，最小角频率即 $\omega_{0}$；
3. 周期取各分量周期的最小公倍数：$T=\mathrm{lcm}(T_1,T_2)$，
   再由 $\omega_{0}=\frac{2\pi}{T}$ 核对；
4. 套 $c_n=\frac{A_n}{2}e^{\mathrm{j}\varphi_n}$、$c_{-n}=c_n^{*}$ 逐项写，
   漏掉负频率项是最常见失分点。

**例题**（【附加作业3 第4题】）：已知

$$
f(t)=\sin 4\pi t+3\cos\left(0.5\pi t+\frac{\pi}{2}\right)
$$

求周期与基频、余弦形式三角级数、指数形式级数。

解 1)：两项角频率为 $4\pi\ \mathrm{rad/s}$ 与 $0.5\pi\ \mathrm{rad/s}$，
对应周期 $T_1=\frac{2\pi}{4\pi}=0.5\ \mathrm{s}$、
$T_2=\frac{2\pi}{0.5\pi}=4\ \mathrm{s}$。取最小公倍数

$$
T=4\ \mathrm{s},\qquad \omega_{0}=\frac{2\pi}{T}=0.5\pi\ \mathrm{rad/s}
$$

且 $\frac{4\pi}{0.5\pi}=8$，故第二项是 8 次谐波，第一项是基波。

解 2)：先把两项统一成余弦形式。由
$\sin\alpha=\cos\left(\alpha-\frac{\pi}{2}\right)$ 得

$$
\sin 4\pi t=\cos\left(4\pi t-\frac{\pi}{2}\right)
=\cos\left(8\omega_{0} t-\frac{\pi}{2}\right)
$$

第二项已是余弦形式，即 $3\cos\left(\omega_{0} t+\frac{\pi}{2}\right)$。故

$$
f(t)=\cos\left(8\omega_{0} t-\frac{\pi}{2}\right)
+3\cos\left(\omega_{0} t+\frac{\pi}{2}\right)
$$

对照 $f(t)=\frac{A_0}{2}+\sum A_n\cos(n\omega_{0} t+\varphi_n)$：
$A_0=0$；$A_1=3$、$\varphi_1=\frac{\pi}{2}$；$A_8=1$、$\varphi_8=-\frac{\pi}{2}$；
其余 $A_n=0$。即 1 次与 8 次谐波存在，2 至 7 次谐波为零。

解 3)：由 $c_n=\frac{A_n}{2}e^{\mathrm{j}\varphi_n}$ 得

$$
c_1=\frac{3}{2}e^{\mathrm{j}\pi/2}=\mathrm{j}1.5,\qquad
c_{-1}=c_1^{*}=-\mathrm{j}1.5
$$

$$
c_8=\frac{1}{2}e^{-\mathrm{j}\pi/2}=-\mathrm{j}0.5,\qquad
c_{-8}=c_8^{*}=\mathrm{j}0.5
$$

于是指数形式级数为

$$
f(t)=\mathrm{j}1.5\,e^{\mathrm{j}\omega_{0} t}-\mathrm{j}1.5\,e^{-\mathrm{j}\omega_{0} t}
-\mathrm{j}0.5\,e^{\mathrm{j}8\omega_{0} t}+\mathrm{j}0.5\,e^{-\mathrm{j}8\omega_{0} t}
$$

校验：平均功率 $P=\frac{A_1^{2}}{2}+\frac{A_8^{2}}{2}=4.5+0.5=5$，
与 $P=\sum|c_n|^{2}=1.5^{2}+1.5^{2}+0.5^{2}+0.5^{2}=5$ 一致。

**同类题**：

- 【附加作业3 第2题】的偶对称三角波只需算 $a_0$ 与 $a_n$，
  $b_n\equiv 0$，这就是"先判奇偶、再动笔积分"的收益。

### 题型 3-5 求周期信号的平均功率、有效值与直流分量

**题型特征**：给周期波形或级数，要求平均功率、有效值，
或只问"波形中的直流分量"。

**解题步骤**：

1. 直流分量 = 一个周期内的平均值 = $\frac{a_0}{2}=c_0$；
2. 平均功率用帕塞瓦尔定理：频域式 $P=\frac{A_0^{2}}{4}+\sum_{n\ge1}\frac{A_n^{2}}{2}$，
   时域式 $P=\frac{1}{T}\int_{T}f^{2}\,\mathrm{d}t$，两法互相校验；
3. 有效值 $f_{\mathrm{rms}}=\sqrt{P}$，只能对功率开方，不能逐项开方；
4. 若只给 $c_n$，直接用 $P=\sum_{n}|c_n|^{2}$，含负频率项。

**例题**：幅度为 $\pm E$、周期为 $T$ 的对称方波，求平均功率与有效值。

解：时域法

$$
\begin{aligned}
P&=\frac{1}{T}\int_{0}^{T}f^{2}(t)\,\mathrm{d}t
=\frac{1}{T}\int_{0}^{T}E^{2}\,\mathrm{d}t=E^{2}
\end{aligned}
$$

故有效值为 $E$。频域法校验：由题型 3-3 的例题，
$b_n=\frac{4E}{n\pi}$（$n$ 为奇数），

$$
P=\sum_{n=1,3,5,\cdots}\frac{b_n^{2}}{2}
=\frac{8E^{2}}{\pi^{2}}\sum_{n=1,3,5,\cdots}\frac{1}{n^{2}}
=\frac{8E^{2}}{\pi^{2}}\cdot\frac{\pi^{2}}{8}=E^{2}
$$

两法一致（用到了 $\sum_{n=1,3,5,\cdots}\frac{1}{n^{2}}=\frac{\pi^{2}}{8}$）。

**同类题**：

- 【附加作业3 第5题】$(\cos\omega_c t)^{2}=0.5+0.5\cos 2\omega_c t$，
  常数项就是直流分量 $0.5$；同时可知其平均功率为
  $0.5^{2}+\frac{0.5^{2}}{2}=0.375$，与直接积分 $\frac{3}{8}$ 相同。

## 易错点

1. **最佳系数忘记除以自内积** → 必须用
   $c_i=\frac{\int f f_i\,\mathrm{d}t}{\int f_i^{2}\,\mathrm{d}t}$ →
   正交分解的系数是"投影"，基函数未归一化时分母不为 $1$。
2. **把 $a_0$ 当直流分量** → 直流分量是 $\frac{a_0}{2}=c_0$ →
   展开式写的是 $\frac{a_0}{2}+\sum$，$a_0$ 前面自带 $\frac{1}{2}$。
3. **双边频谱把 $|c_n|$ 当单边幅度用** → $n\ge 1$ 时 $A_n=2|c_n|$ →
   单边频谱把负频率那一半的能量"折叠"到了正频率上。
4. **复指数级数漏写负频率项** → 每一项都要成对写
   $c_ne^{\mathrm{j}n\omega_{0} t}+c_{-n}e^{-\mathrm{j}n\omega_{0} t}$ →
   实信号必然成对出现，漏项会丢掉一半幅度。
5. **把方均误差与总能量混为一谈** → 方均误差带 $\frac{1}{t_2-t_1}$
   的平均因子，比的是"平均功率"级别的量 →
   题目说"小于总能量的 $1\%$"时，两边量纲都要先摆清楚再比。
6. **区间不是 $\left(-\frac{T}{2},\frac{T}{2}\right)$ 时仍用 $\frac{2}{T}$**
   → 一般区间用 $\frac{2}{t_2-t_1}$ → 系数公式因子来自基函数的自内积。
7. **判断级数成分时看函数表达式而不看延拓波形** →
   必须在整个周期上判断奇偶性 → 半周期的表达式奇偶与整周期延拓的
   奇偶可以完全不同。
8. **奇谐函数与偶谐函数混淆** → 奇谐 $f(t+\frac{T}{2})=-f(t)$
   只含奇次谐波；偶谐只含偶次谐波与直流 → 记"负号对应奇次"。
9. **周期矩形脉冲 $c_n$ 漏 $\frac{\tau}{T}$ 或漏 $\frac{1}{2}$** →
   $c_n=\frac{E\tau}{T}\mathrm{Sa}\left(\frac{n\omega_{0}\tau}{2}\right)$ →
   直接由 $\frac{1}{T}\int_{-\tau/2}^{\tau/2}E e^{-\mathrm{j}n\omega_{0} t}\mathrm{d}t$
   现推一遍最稳。
10. **认为取有限项后级数处处等于原信号** → 只在连续点相等，
    间断点收敛到左右极限平均值，且跳变附近有吉布斯振荡 →
    方均误差可趋于零，但逐点误差不为零。

# 连续时间系统的频域分析

## 考点清单

| 考点 | 常见考法 | 重要度 |
|:-----|:---------|:------:|
| 傅里叶变换的定义与存在条件 | 写出正反变换式，说明充分条件 | ★★★ |
| 常用信号的傅里叶变换对 | 门函数、指数、阶跃、冲激、抽样函数 | ★★★ |
| 傅里叶变换的性质 | 时移、频移、尺度、卷积、微积分、对称 | ★★★ |
| 周期信号的傅里叶变换 | 把级数与冲激串对应起来，写冲激序列的谱 | ★★★ |
| 频率响应 $H(\mathrm{j}\omega)$ | 由微分方程写 $H(\mathrm{j}\omega)$，画幅频相频 | ★★★ |
| 零状态响应的频域求解 | $R=HE$ 再逆变换，含部分分式展开 | ★★★ |
| 无失真传输条件 | 判断给定 $H(\mathrm{j}\omega)$ 是否无失真 | ★★ |
| 理想低通滤波器 | 求 $h(t)$、阶跃响应、上升时间与带宽 | ★★ |
| 物理可实现性（佩利-维纳准则） | 判断给定幅频特性能否用实际网络实现 | ★★ |
| 抽样定理与信号恢复 | 求最低抽样率、恢复滤波器带宽、判断混叠 | ★★★ |

## 核心概念与公式

### 傅里叶变换的定义与存在条件

正变换与反变换（把非周期信号分解为连续频率的复正弦之和）：

$$
F(\mathrm{j}\omega)=\int_{-\infty}^{+\infty}f(t)e^{-\mathrm{j}\omega t}\,\mathrm{d}t
$$

$$
f(t)=\frac{1}{2\pi}\int_{-\infty}^{+\infty}F(\mathrm{j}\omega)
e^{\mathrm{j}\omega t}\,\mathrm{d}\omega
$$

记作 $F(\mathrm{j}\omega)=\mathcal{F}[f(t)]$，$f(t)=\mathcal{F}^{-1}[F(\mathrm{j}\omega)]$。

**存在条件（充分条件）**：$f(t)$ 在 $(-\infty,+\infty)$ 上满足狄利克雷条件，
即绝对可积 $\int_{-\infty}^{+\infty}|f(t)|\,\mathrm{d}t<\infty$，
且只有有限个第一类间断点与有限个极值点。
注意这里的时间区间是整条实轴，不再是"一个周期"。

**放宽**：引入冲激函数后可定义**广义傅里叶变换**，
阶跃、直流、正弦等不满足绝对可积的信号也有变换式，
代价是频谱中出现 $\delta(\omega)$。

什么时候用：题目问"为什么可以用频域法"，答"满足狄利克雷条件"；
题目给了不绝对可积的信号，答"在广义函数意义下存在傅里叶变换"。

### 常用信号的傅里叶变换对

| 序号 | $f(t)$ | $F(\mathrm{j}\omega)$ | 条件 |
|:-----|:-------|:----------------------|:-----|
| 1 | $\delta(t)$ | $1$ | 广义 |
| 2 | $\delta(t-t_0)$ | $e^{-\mathrm{j}\omega t_0}$ | 广义 |
| 3 | $e^{-\alpha t}u(t)$ | $\dfrac{1}{\alpha+\mathrm{j}\omega}$ | $\alpha>0$ |
| 4 | $e^{-\alpha|t|}$ | $\dfrac{2\alpha}{\alpha^{2}+\omega^{2}}$ | $\alpha>0$ |
| 5 | $G_{\tau}(t)$ | $\tau\,\mathrm{Sa}\left(\dfrac{\omega\tau}{2}\right)$ | 门函数 |
| 6 | $\mathrm{Sa}(t)=\dfrac{\sin t}{t}$ | $\pi G_{2}(\omega)$ | 广义 |
| 7 | $u(t)$ | $\pi\delta(\omega)+\dfrac{1}{\mathrm{j}\omega}$ | 广义 |
| 8 | $1$ | $2\pi\delta(\omega)$ | 广义 |
| 9 | $e^{\mathrm{j}\omega_c t}$ | $2\pi\delta(\omega-\omega_c)$ | 广义 |
| 10 | $\cos\omega_c t$ | $\pi\bigl[\delta(\omega+\omega_c)+\delta(\omega-\omega_c)\bigr]$ | 广义 |

说明两点：门函数 $G_{\tau}(t)$ 在 $|t|<\frac{\tau}{2}$ 内为 $1$、其余为 $0$；
序号 3、7、8 这类不绝对可积的信号，其变换式只在广义函数意义下成立，
答题时要写"借助冲激函数"。

### 傅里叶变换的性质

| 性质 | 时域 | 频域 |
|:-----|:-----|:-----|
| 线性 | $af_1+bf_2$ | $aF_1+bF_2$ |
| 时移 | $f(t-t_0)$ | $F(\mathrm{j}\omega)e^{-\mathrm{j}\omega t_0}$ |
| 频移 | $f(t)e^{\mathrm{j}\omega_c t}$ | $F\bigl(\mathrm{j}(\omega-\omega_c)\bigr)$ |
| 尺度 | $f(at)$ | $\dfrac{1}{|a|}F\left(\mathrm{j}\dfrac{\omega}{a}\right)$ |
| 对称 | $F(\mathrm{j}t)$ | $2\pi f(-\omega)$ |
| 微分 | $\dfrac{\mathrm{d}^{n}f}{\mathrm{d}t^{n}}$ | $(\mathrm{j}\omega)^{n}F(\mathrm{j}\omega)$ |
| 积分 | $\int_{-\infty}^{t}f(\tau)\,\mathrm{d}\tau$ | $\frac{F(\mathrm{j}\omega)}{\mathrm{j}\omega}+\pi F(0)\delta(\omega)$ |
| 卷积 | $f_1(t)*f_2(t)$ | $F_1(\mathrm{j}\omega)F_2(\mathrm{j}\omega)$ |
| 相乘 | $f_1(t)f_2(t)$ | $\dfrac{1}{2\pi}F_1(\mathrm{j}\omega)*F_2(\mathrm{j}\omega)$ |

成立条件与常用推论：

- 微分性质要求 $f(t)$ 连续且 $\frac{\mathrm{d}^{n}f}{\mathrm{d}t^{n}}$
  存在傅里叶变换；若 $f(t)$ 有跳变，跳变点产生冲激，须逐个写出。
- 积分性质中的 $\pi F(0)\delta(\omega)$ 项只在 $F(0)\ne 0$ 时需要保留，
  即 $f(t)$ 有非零直流分量时才有这一项。
- 频移性质的常用推论（调制定理）：时域乘一个余弦，频谱被搬移并减半：

$$
f(t)\cos\omega_c t\longleftrightarrow
\frac{1}{2}\bigl[F(\mathrm{j}(\omega+\omega_c))
+F(\mathrm{j}(\omega-\omega_c))\bigr]
$$
- 尺度性质推论：时域压缩 $a$ 倍，频域展宽 $a$ 倍，即
  "脉宽与带宽成反比"，与“周期信号的频带宽度”一节的结论一致。
- 相乘性质（频域卷积定理）必须带 $\frac{1}{2\pi}$ 因子，
  这是与卷积定理最容易搞混的地方。

### 周期信号的傅里叶变换

周期信号不满足绝对可积，但把它展开成指数级数后逐项变换，
再用 $e^{\mathrm{j}n\omega_{0} t}\leftrightarrow 2\pi\delta(\omega-n\omega_{0})$，得

$$
F(\mathrm{j}\omega)=2\pi\sum_{n=-\infty}^{+\infty}c_n\,\delta(\omega-n\omega_{0}),
\qquad \omega_{0}=\frac{2\pi}{T}
$$

即**周期信号的频谱是冲激串**，冲激的位置在 $n\omega_{0}$，
强度是 $2\pi c_n$。这正好对应"周期信号的频谱是离散谱"。

**均匀冲激序列**（最重要的一个）：

$$
\delta_T(t)=\sum_{k=-\infty}^{+\infty}\delta(t-kT)
\;\longleftrightarrow\;
\omega_{0}\sum_{n=-\infty}^{+\infty}\delta(\omega-n\omega_{0}),
\qquad \omega_{0}=\frac{2\pi}{T}
$$

推导思路三步：① $\delta_T(t)$ 是周期信号，$c_n=\frac{1}{T}$；
② 代入冲激串公式得 $F(\mathrm{j}\omega)=\frac{2\pi}{T}\sum_n\delta(\omega-n\omega_{0})$；
③ 注意 $\frac{2\pi}{T}=\omega_{0}$，所以时域冲激间隔 $T$ 与频域冲激间隔
$\omega_{0}$ 成反比。

**单脉冲与周期化的关系**：设 $f_0(t)$ 是 $f(t)$ 的一个周期（其余补零），
其变换为 $F_0(\mathrm{j}\omega)$，则周期化后

$$
c_n=\frac{1}{T}F_0(\mathrm{j}n\omega_{0})
$$

这条式子把"查表得的单脉冲变换"与"级数系数"直接连起来，很好用。

### 系统的频率响应与零状态响应的频域求解

对由微分方程描述的系统

$$
\sum_{k=0}^{n}a_ky^{(k)}(t)=\sum_{k=0}^{m}b_kf^{(k)}(t)
$$

定义**频率响应**（传输函数）

$$
H(\mathrm{j}\omega)=
\frac{b_m(\mathrm{j}\omega)^{m}+b_{m-1}(\mathrm{j}\omega)^{m-1}
+\cdots+b_1(\mathrm{j}\omega)+b_0}
{(\mathrm{j}\omega)^{n}+a_{n-1}(\mathrm{j}\omega)^{n-1}
+\cdots+a_1(\mathrm{j}\omega)+a_0}
$$

它与转移算子 $H(p)$ 形式相同，只需把 $p$ 换成 $\mathrm{j}\omega$；
但 $H(\mathrm{j}\omega)$ 是代数式，可以自由做代数运算（约分、通分、部分分式）。

写成极坐标形式：

$$
H(\mathrm{j}\omega)=|H(\mathrm{j}\omega)|e^{\mathrm{j}\varphi(\omega)}
$$

$|H(\mathrm{j}\omega)|$ 称**幅频特性**，$\varphi(\omega)$ 称**相频特性**，
合称系统的频率特性。物理含义：系统对频率为 $\omega$ 的复正弦
只改变幅度与相位，不改变频率。

**零状态响应**：设激励频谱 $E(\mathrm{j}\omega)=\mathcal{F}[e(t)]$，则

$$
R_{zs}(\mathrm{j}\omega)=H(\mathrm{j}\omega)E(\mathrm{j}\omega),
\qquad
y_{zs}(t)=\mathcal{F}^{-1}\bigl[H(\mathrm{j}\omega)E(\mathrm{j}\omega)\bigr]
=\frac{1}{2\pi}\int_{-\infty}^{+\infty}H(\mathrm{j}\omega)E(\mathrm{j}\omega)
e^{\mathrm{j}\omega t}\,\mathrm{d}\omega
$$

成立条件：系统线性时不变、零状态（初始储能为零），
且 $H(\mathrm{j}\omega)$ 存在，即 $H(s)$ 的收敛域包含虚轴，
等价于极点全在左半平面（系统稳定）。若系统不稳定（存在右半平面极点），
收敛域不含虚轴，$H(\mathrm{j}\omega)$ 根本不存在，此时只能用
拉普拉斯变换求解（见第 5 章）。

**周期信号**激励时不必做积分，逐项加权即可：

$$
e(t)=\sum_n c_ne^{\mathrm{j}n\omega_{0} t}
\;\Longrightarrow\;
y_{zs}(t)=\sum_n c_nH(\mathrm{j}n\omega_{0})e^{\mathrm{j}n\omega_{0} t}
$$

对实正弦激励 $A\cos(\omega t+\theta)$，响应为

$$
A|H(\mathrm{j}\omega)|\cos\bigl(\omega t+\theta+\varphi(\omega)\bigr)
$$

即"幅度乘幅频、相位加相频"。

三种求 $H(\mathrm{j}\omega)$ 的途径（结果相同，按题目条件选）：
① 由微分方程系数直接写出；② 由 $h(t)$ 做傅里叶变换；
③ 由电路做相量稳态分析（阻抗法）求输出与输入之比。

### 无失真传输条件

**无失真**指输出波形与输入波形形状完全相同，只允许幅度放大和整体延时：

$$
y(t)=Kf(t-t_d),\qquad K>0,\ t_d>0
$$

两边取傅里叶变换得 $Y(\mathrm{j}\omega)=K e^{-\mathrm{j}\omega t_d}F(\mathrm{j}\omega)$，
故无失真传输的**充要条件**是

$$
H(\mathrm{j}\omega)=Ke^{-\mathrm{j}\omega t_d}
$$

拆成幅频与相频两条：

1. 幅频特性为常数：$|H(\mathrm{j}\omega)|=K$，对所有频率一视同仁；
2. 相频特性为过原点的直线：$\varphi(\omega)=-\omega t_d$，
   群延时 $\tau_g=-\frac{\mathrm{d}\varphi}{\mathrm{d}\omega}=t_d$ 为常数。

两条必须同时满足。幅度不失真但相位非线性，会产生**相位失真**
（波形畸变但频谱幅度不变）；相位线性但幅度不平坦，会产生
**幅度失真**。实际系统只要在信号频带内近似满足这两条即可。

### 理想低通滤波器

**幅频**在 $|\omega|\le\omega_c$ 内为 $1$、其余为 $0$，**相频**线性，
即

$$
H(\mathrm{j}\omega)=G_{2\omega_c}(\omega)e^{-\mathrm{j}\omega t_d}
$$

**冲激响应**：由对称性，$G_{2\omega_c}(\omega)$ 的逆变换为
$\frac{\omega_c}{\pi}\mathrm{Sa}(\omega_c t)$，加时移得

$$
h(t)=\frac{\omega_c}{\pi}\,\mathrm{Sa}\bigl[\omega_c(t-t_d)\bigr]
=\frac{\sin\omega_c(t-t_d)}{\pi(t-t_d)}
$$

它在 $t<0$ 就有非零值，说明理想低通**非因果**。

**阶跃响应**：把 $u(t)$ 与 $h(t)$ 卷积，得

$$
g(t)=\frac{1}{2}+\frac{1}{\pi}\mathrm{Si}\bigl[\omega_c(t-t_d)\bigr],
\qquad
\mathrm{Si}(y)=\int_{0}^{y}\frac{\sin x}{x}\,\mathrm{d}x
$$

$\mathrm{Si}(\pm\infty)=\pm\frac{\pi}{2}$，故 $g(-\infty)=0$、$g(+\infty)=1$。
波形有**过冲**（约 $9\%$，吉布斯现象）与振铃，且 $g(t)$ 在 $t<t_d$
时已有非零值，同样非因果。

**上升时间与带宽的矛盾**：由主瓣估算，$g(t)$ 从近似 $0$ 升到近似 $1$
的时间约

$$
t_r\approx\frac{\pi}{\omega_c}=\frac{1}{2B_f},\qquad B_f=\frac{\omega_c}{2\pi}
$$

即 $t_rB_f\approx 0.5$：通带越宽，上升越快、越能跟上快速变化；
通带越窄，响应越迟缓。这就是"带宽与响应速度成反比"。

### 物理可实现性：佩利-维纳准则

时域判据：因果系统的冲激响应必须满足 $h(t)=0$（$t<0$）。
频域判据（佩利-维纳准则，必要且几乎充分）：

$$
\int_{-\infty}^{+\infty}
\frac{\bigl|\ln|H(\mathrm{j}\omega)|\bigr|}{1+\omega^{2}}\,\mathrm{d}\omega<\infty
$$

三条推论，考试常直接考这三条：

1. $|H(\mathrm{j}\omega)|$ 可以在某些孤立频率点上为零，但不能在
   一段频带内恒为零（否则积分发散）；
2. $|H(\mathrm{j}\omega)|$ 的衰减速度不能快于指数型，
   所以"矩形幅频""高斯型幅频"都不可实现；
3. 理想低通、理想高通、理想带通均**不可实现**；实际滤波器只能
   逼近它，允许过渡带与一定的幅频起伏。

允许的幅频形状：只要 $|H(\mathrm{j}\omega)|$ 不为零且衰减不过快，
总能用有理函数（由 $R$、$L$、$C$ 与受控源构成的网络）逼近实现。

### 抽样定理与信号恢复

设 $f(t)$ 是**带限信号**，最高频率为 $f_m$（对应 $\omega_m=2\pi f_m$），
用周期 $T_s$ 的冲激串抽样：

$$
f_s(t)=f(t)\delta_T(t)=\sum_{k}f(kT_s)\delta(t-kT_s)
$$

两边取傅里叶变换（用相乘性质或直接展开）得

$$
F_s(\mathrm{j}\omega)=\frac{1}{T_s}\sum_{k=-\infty}^{+\infty}
F\bigl(\mathrm{j}(\omega-k\omega_s)\bigr),\qquad \omega_s=\frac{2\pi}{T_s}
$$

即抽样后频谱是原频谱以 $\omega_s$ 为周期**平移复制**。

**抽样定理（奈奎斯特）**：若 $f(t)$ 带限于 $f_m$，则当

$$
f_s=\frac{1}{T_s}\ge 2f_m
\quad\Longleftrightarrow\quad
\omega_s\ge 2\omega_m
$$

时，$F_s(\mathrm{j}\omega)$ 的各次复制不重叠，可用一个理想低通
完整恢复 $f(t)$。$2f_m$ 称奈奎斯特率，$\frac{1}{2f_m}$ 称奈奎斯特间隔。

**恢复**：取理想低通 $H(\mathrm{j}\omega)=T_sG_{2\omega_c}(\omega)$，
截止频率满足

$$
\omega_m<\omega_c<\omega_s-\omega_m
$$

则 $F_s(\mathrm{j}\omega)H(\mathrm{j}\omega)=F(\mathrm{j}\omega)$，时域上即

$$
f(t)=\sum_{k=-\infty}^{+\infty}f(kT_s)\,
\mathrm{Sa}\bigl[\omega_c(t-kT_s)\bigr]
$$

当 $\omega_c=\frac{\omega_s}{2}$ 时就是标准的
$\mathrm{Sa}\left[\frac{\omega_s}{2}(t-kT_s)\right]$ 内插公式。

**混叠**：若 $f_s<2f_m$，复制谱相互重叠，高频成分被"折叠"到低频，
无法用线性滤波去除，称为混叠失真。工程上要么提高 $f_s$，
要么在抽样前加**抗混叠前置低通**把 $f_m$ 压下来。

## 典型题型与解法

### 题型 4-1 由时域表达式或波形直接积分求傅里叶变换

**题型特征**：给分段常数波形（单个或成对的矩形脉冲）或含 $u(t)$ 的
表达式，要求 $F(\mathrm{j}\omega)$。

**解题步骤**：

1. 把波形写成门函数之和（用平移），或写成阶跃函数之差；
2. 套 $G_{\tau}(t)\leftrightarrow\tau\mathrm{Sa}\left(\frac{\omega\tau}{2}\right)$
   与时移性质，逐项变换；
3. 用和差化积把结果整理成实函数，如
   $2\sin\alpha\cos\beta=\sin(\alpha+\beta)+\sin(\alpha-\beta)$；
4. 校验：奇对称波形其 $F(\mathrm{j}\omega)$ 应为纯虚或纯实且奇，
   偶对称波形应为实偶函数。

**例题**（【附加作业4 第4题】）：$f(t)$ 在 $[-3,-1]$ 与 $[1,3]$ 上为 $1$、
其余为 $0$（两个宽 $2$、高 $1$ 的矩形脉冲），求 $F(\mathrm{j}\omega)$。

解（方法一，门函数叠加）：两个脉冲可写成一个门函数向左、向右各平移 $2$：

$$
f(t)=G_2(t+2)+G_2(t-2)
$$

由 $G_{\tau}(t)\leftrightarrow\tau\mathrm{Sa}\left(\frac{\omega\tau}{2}\right)$，
取 $\tau=2$ 得 $G_2(t)\leftrightarrow 2\mathrm{Sa}(\omega)$。再用时移性质

$$
G_2(t+2)\leftrightarrow 2\mathrm{Sa}(\omega)e^{\mathrm{j}2\omega},\qquad
G_2(t-2)\leftrightarrow 2\mathrm{Sa}(\omega)e^{-\mathrm{j}2\omega}
$$

相加并用欧拉公式 $e^{\mathrm{j}\theta}+e^{-\mathrm{j}\theta}=2\cos\theta$：

$$
F(\mathrm{j}\omega)=2\mathrm{Sa}(\omega)\left(e^{\mathrm{j}2\omega}
+e^{-\mathrm{j}2\omega}\right)=4\mathrm{Sa}(\omega)\cos 2\omega
$$

再把 $\mathrm{Sa}(\omega)=\frac{\sin\omega}{\omega}$ 代入并和差化积：

$$
F(\mathrm{j}\omega)=\frac{4\sin\omega\cos 2\omega}{\omega}
=\frac{2}{\omega}\bigl[\sin 3\omega-\sin\omega\bigr]
$$

结果在 $\omega=0$ 处取极限 $F(0)=4$（等于波形面积 $2+2$），与
$\frac{2}{\omega}(\sin3\omega-\sin\omega)\to 2\cdot(3-1)=4$ 一致，
可作校验。

解（方法二，阶跃叠加）：$f(t)=u(t+3)-u(t+1)+u(t-1)-u(t-3)$，
代入定义式逐项积分亦可，结果相同。

**同类题**：

- 【附加作业4 第1题】概念题：充分条件是狄利克雷条件，变换对为
  $F(\mathrm{j}\omega)=\int f(t)e^{-\mathrm{j}\omega t}\mathrm{d}t$ 与
  $f(t)=\frac{1}{2\pi}\int F(\mathrm{j}\omega)e^{\mathrm{j}\omega t}\mathrm{d}\omega$，
  注意反变换的 $\frac{1}{2\pi}$ 不能丢。
- 【附加作业4 第6题】$e(t)=\frac{\sin 2\pi t}{2\pi t}$：先由
  $G_{\tau}(t)\leftrightarrow\tau\mathrm{Sa}\left(\frac{\omega\tau}{2}\right)$
  与对称性得 $2\pi G_{4\pi}(\omega)\leftrightarrow 4\pi\mathrm{Sa}(2\pi t)$，
  两边除 $2\pi$ 即得 $E(\mathrm{j}\omega)=\frac{1}{2}G_{4\pi}(\omega)$。

### 题型 4-2 利用微积分特性求折线信号的傅里叶变换

**题型特征**：波形是梯形、三角等**分段线性**函数（求导后变成矩形、
二次求导后变成冲激），要求 $F(\mathrm{j}\omega)$。

**解题步骤**：

1. 先把波形写成 $t$ 与 $u(t-t_i)$ 的乘积之和，方便逐项求导；
2. 求一阶导：$t\,u(t-t_0)$ 的导数是 $u(t-t_0)+t\delta(t-t_0)$，
   而 $t\delta(t-t_0)=t_0\delta(t-t_0)$，别忘了冲激项；
3. 若一阶导仍是矩形，再求一次得到冲激串；
4. 用 $f^{(n)}(t)\leftrightarrow(\mathrm{j}\omega)^{n}F(\mathrm{j}\omega)$ 反解，即
   $F(\mathrm{j}\omega)=(\mathrm{j}\omega)^{-n}\mathcal{F}[f^{(n)}(t)]$；
5. 用 $F(0)=\int f\,\mathrm{d}t$（波形面积）检验结果。

**例题**：三角脉冲 $f(t)=1-|t|$（$|t|<1$）、其余为 $0$，
关键点 $(0,1)$、$(\pm1,0)$，用微积分特性求其变换。

解：分段表达式为
$f(t)=(1+t)$（$-1\le t\le 0$）、$f(t)=(1-t)$（$0\le t\le 1$）。
一阶导是两段矩形：$f'(t)=1$ 于 $(-1,0)$、$f'(t)=-1$ 于 $(0,1)$，即

$$
f'(t)=G_1\left(t+\frac{1}{2}\right)-G_1\left(t-\frac{1}{2}\right)
$$

再求导得冲激串：

$$
f''(t)=\delta(t+1)-2\delta(t)+\delta(t-1)
$$

由微分性质及 $\delta(t-t_0)\leftrightarrow e^{-\mathrm{j}\omega t_0}$：

$$
(\mathrm{j}\omega)^{2}F(\mathrm{j}\omega)
=e^{\mathrm{j}\omega}-2+e^{-\mathrm{j}\omega}
=2\cos\omega-2
$$

所以

$$
F(\mathrm{j}\omega)=-\frac{2\cos\omega-2}{\omega^{2}}
=\frac{2(1-\cos\omega)}{\omega^{2}}
=\left(\frac{\sin(\omega/2)}{\omega/2}\right)^{2}
=\mathrm{Sa}^{2}\!\left(\frac{\omega}{2}\right)
$$

校验：$F(0)=1$，而波形面积为 $1$（底 $2$、高 $1$ 的三角形面积恰为 $1$），
一致。该结果也是必背变换对：三角脉冲对应 $\mathrm{Sa}^{2}$。

**同类题**：

- 【附加作业4 第5题】梯形信号关键点 $(-2,0)$、$(-1,1)$、$(1,1)$、$(2,0)$：
  先写 $f(t)=(t+2)u(t+2)-(t+1)u(t+1)-(t-1)u(t-1)+(t-2)u(t-2)$，
  求导时用 $t\delta(t-t_0)=t_0\delta(t-t_0)$ 消掉四个冲激，
  得 $f'(t)=u(t+2)-u(t+1)-u(t-1)+u(t-2)$，再求导得四个冲激，
  最终 $F(\mathrm{j}\omega)=\frac{2[\cos\omega-\cos 2\omega]}{\omega^{2}}$。

### 题型 4-3 由频率响应求冲激响应并求零状态响应

**题型特征**：给 $H(\mathrm{j}\omega)$ 的有理分式（或给微分方程），
要求 $h(t)$，再给一个指数型激励求 $y_{zs}(t)$。

**解题步骤**：

1. 把 $\mathrm{j}\omega$ 看作 $s$，对 $H$ 做部分分式展开，每项化成
   $\frac{A}{s+\alpha}$ 的标准形；
2. 逆变换：$\frac{A}{s+\alpha}\leftrightarrow Ae^{-\alpha t}u(t)$
   （要求 $\alpha>0$，否则系统不稳定、$h(t)$ 不存在）；
3. 求激励频谱：$e^{-\alpha t}u(t)\leftrightarrow\frac{1}{\alpha+\mathrm{j}\omega}$；
4. 相乘再展开：$R_{zs}=H\cdot E$ 的部分分式，注意**不能**只保留
   一部分项，凡分母出现的因式都要给出对应项；
5. 若某个留数为零，说明该项确实为零（例如激励极点被 $H$ 的零点抵消），
   要点明这是巧合而不是写法错误。

**例题**（【附加作业4 第7题】）：已知

$$
H(\mathrm{j}\omega)=\frac{2\mathrm{j}\omega+3}{-\omega^{2}+\mathrm{j}3\omega+2}
$$

求冲激响应，并用频域法求 $e(t)=e^{-1.5t}u(t)$ 时的 $y_{zs}(t)$。

解：记 $s=\mathrm{j}\omega$，则 $-\omega^{2}=s^{2}$，故

$$
H(s)=\frac{2s+3}{s^{2}+3s+2}=\frac{2s+3}{(s+1)(s+2)}
$$

部分分式：$H(s)=\frac{A}{s+1}+\frac{B}{s+2}$，
$A=\frac{2s+3}{s+2}\Big|_{s=-1}=\frac{1}{1}=1$，
$B=\frac{2s+3}{s+1}\Big|_{s=-2}=\frac{-1}{-1}=1$。所以

$$
H(\mathrm{j}\omega)=\frac{1}{\mathrm{j}\omega+1}+\frac{1}{\mathrm{j}\omega+2}
$$

逆变换得冲激响应

$$
h(t)=\left(e^{-t}+e^{-2t}\right)u(t)
$$

激励频谱 $E(\mathrm{j}\omega)=\frac{1}{\mathrm{j}\omega+1.5}$，于是

$$
R_{zs}(\mathrm{j}\omega)=H(\mathrm{j}\omega)E(\mathrm{j}\omega)
=\frac{2s+3}{(s+1)(s+2)(s+1.5)}
$$

三个极点 $-1$、$-2$、$-1.5$，逐项求留数：

$$
A_{1}=\frac{2s+3}{(s+2)(s+1.5)}\Big|_{s=-1}=\frac{1}{1\times 0.5}=2
$$

$$
A_{2}=\frac{2s+3}{(s+1)(s+1.5)}\Big|_{s=-2}=\frac{-1}{(-1)\times(-0.5)}=-2
$$

$$
A_{3}=\frac{2s+3}{(s+1)(s+2)}\Big|_{s=-1.5}=\frac{0}{(-0.5)\times 0.5}=0
$$

第三项之所以为零，是因为分子 $2s+3$ 恰在 $s=-1.5$ 处有零点，
把激励极点抵消了——这是本题的巧合，不是漏项。故

$$
R_{zs}(\mathrm{j}\omega)=\frac{2}{\mathrm{j}\omega+1}
-\frac{2}{\mathrm{j}\omega+2}
$$

逆变换得

$$
y_{zs}(t)=2\left(e^{-t}-e^{-2t}\right)u(t)
$$

校验：$t\to\infty$ 时 $y_{zs}\to 0$，与系统稳定、激励有阻尼一致；
又 $y_{zs}(0^{+})=0$，说明无跳变。

**同类题**：

- 【附加作业4 第8题】由 $r''+3r'+2r=e$ 直接写
  $H(\mathrm{j}\omega)=\frac{1}{(\mathrm{j}\omega)^{2}+3\mathrm{j}\omega+2}$，
  $E=\frac{1}{\mathrm{j}\omega+3}$，三个极点 $-1,-2,-3$ 的留数分别为
  $0.5$、$-1$、$0.5$，得
  $y_{zs}(t)=\left(0.5e^{-t}-e^{-2t}+0.5e^{-3t}\right)u(t)$。

### 题型 4-4 调制加理想滤波求系统输出

**题型特征**：框图先乘 $\cos\omega_0t$（调制），再经理想带通/低通滤波，
给滤波器的幅频特性与 $\varphi(\omega)=0$，求输出。

**解题步骤**：

1. 求输入频谱 $E(\mathrm{j}\omega)$（常是门函数或 $\mathrm{Sa}$ 型）；
2. 用频移性质或相乘性质求乘法器输出，频谱左右各搬移 $\pm\omega_0$ 后减半：

   $$
   E_1(\mathrm{j}\omega)=\frac{1}{2}\bigl[E(\mathrm{j}(\omega+\omega_0))
   +E(\mathrm{j}(\omega-\omega_0))\bigr]
   $$
3. 画出 $E_1$ 的频谱，与 $|H(\mathrm{j}\omega)|$ 的通带位置对照，
   把落在通带内的部分"切出来"；
4. 逆变换时可用对称性：频域里宽为 $\tau$ 的门函数，对应时域
   $\frac{\tau}{2\pi}\mathrm{Sa}\left(\frac{\tau t}{2}\right)$；
   逐块逆变换后再用欧拉公式合成实信号。

**例题**（【附加作业4 第9题】）：
$e(t)=\frac{\sin 2\pi t}{2\pi t}$，先与 $\cos 1000t$ 相乘，
再通过理想带通滤波器。带通幅频在 $999<|\omega|<1001$ 内为 $1$、
其余为 $0$，相位特性 $\varphi(\omega)=0$。求输出 $y(t)$。

解：第一步，求输入频谱。由题型 4-1 同类题的结论

$$
E(\mathrm{j}\omega)=\frac{1}{2}G_{4\pi}(\omega)
$$

即幅度 $\frac{1}{2}$、占据 $|\omega|<2\pi$ 的矩形谱。

第二步，调制。由
$\mathcal{F}[\cos 1000t]=\pi[\delta(\omega+1000)+\delta(\omega-1000)]$
与相乘性质：

$$
E_1(\mathrm{j}\omega)=\frac{1}{2\pi}E(\mathrm{j}\omega)
*\pi\bigl[\delta(\omega+1000)+\delta(\omega-1000)\bigr]
$$

利用 $\delta$ 的筛选性质
$F(\mathrm{j}\omega)*\delta(\omega-\omega_0)=F(\mathrm{j}(\omega-\omega_0))$，得

$$
E_1(\mathrm{j}\omega)=\frac{1}{4}\bigl[G_{4\pi}(\omega+1000)
+G_{4\pi}(\omega-1000)\bigr]
$$

即原矩形谱被搬到 $\pm1000$ 处，每块宽度 $4\pi$，幅度 $\frac{1}{4}$。

第三步，滤波。通带 $999<|\omega|<1001$ 宽度为 $2$，
而搬移后的每块宽 $4\pi\approx12.57$，故每块只被切出中间宽 $2$ 的一段：

$$
R(\mathrm{j}\omega)=E_1(\mathrm{j}\omega)H(\mathrm{j}\omega)
=\frac{1}{4}G_2(\omega+1000)+\frac{1}{4}G_2(\omega-1000)
$$

第四步，逆变换。由 $G_2(\omega)$ 的逆变换为
$\frac{\sin t}{\pi t}=\frac{1}{\pi}\mathrm{Sa}(t)$，再用频移性质
$F(\mathrm{j}(\omega-\omega_0))\leftrightarrow f(t)e^{\mathrm{j}\omega_0 t}$：

$$
y(t)=\frac{1}{4}\cdot\frac{\sin t}{\pi t}e^{-\mathrm{j}1000t}
+\frac{1}{4}\cdot\frac{\sin t}{\pi t}e^{\mathrm{j}1000t}
$$

用欧拉公式合并：

$$
y(t)=\frac{\sin t}{2\pi t}\cos 1000t
=\frac{1}{2\pi}\mathrm{Sa}(t)\cos 1000t,
\qquad -\infty<t<+\infty
$$

物理意义：输出是一个包络为 $\mathrm{Sa}(t)$ 的 $1000\ \mathrm{rad/s}$
窄带信号，即把低频信号"搬"到了载频附近，这正是调制的效果。

**同类题**：

- 【附加作业4 第2题】用频域卷积定理导出 $\cos\omega_ct\cdot u(t)$：
  $\cos\omega_ct\leftrightarrow\pi[\delta(\omega+\omega_c)+\delta(\omega-\omega_c)]$、
  $u(t)\leftrightarrow\frac{1}{\mathrm{j}\omega}+\pi\delta(\omega)$，
  卷积后得 $\frac{\pi}{2}[\delta(\omega+\omega_c)+\delta(\omega-\omega_c)]$
  加上 $\frac{\mathrm{j}\omega}{\omega_c^{2}-\omega^{2}}$；
  关键是用 $\frac{1}{\mathrm{j}\omega}$ 与 $\delta$ 卷积即得频移项。

### 题型 4-5 利用对称性与频域卷积定理导出新变换对

**题型特征**：题目要求"由已知变换对导出另一对的变换"，
或"求奇偶分量的频谱"，本质考性质的对偶使用。

**解题步骤**：

1. 认出已知对中谁像谁：$F(\mathrm{j}\omega)$ 与 $f(t)$ 交换位置用对称性；
2. 套对称性 $F(\mathrm{j}t)\leftrightarrow 2\pi f(-\omega)$，
   若 $f$ 为偶函数则 $f(-\omega)=f(\omega)$，结果最简洁；
3. 时域乘积改用频域卷积（带 $\frac{1}{2\pi}$），
   频域乘积改用时域卷积；
4. 用奇偶分解式 $f_e(t)=\frac{f(t)+f(-t)}{2}$、
   $f_o(t)=\frac{f(t)-f(-t)}{2}$ 与
   $F(-\mathrm{j}\omega)=R(\omega)-\mathrm{j}X(\omega)$ 对应。

**例题**：已知 $e^{-\alpha|t|}\leftrightarrow\frac{2\alpha}{\alpha^{2}+\omega^{2}}$
（$\alpha>0$），用对称性求 $f(t)=\frac{1}{1+t^{2}}$ 的傅里叶变换。

解：先整理已知对，使其形如 $F(\mathrm{j}\omega)$ 为实偶函数：

$$
F(\mathrm{j}\omega)=\frac{2\alpha}{\alpha^{2}+\omega^{2}}
\;\longleftrightarrow\;
f(t)=e^{-\alpha|t|}
$$

由对称性 $F(\mathrm{j}t)\leftrightarrow 2\pi f(-\omega)$，取 $\alpha=1$ 得

$$
\frac{2}{1+t^{2}}\;\longleftrightarrow\;2\pi e^{-|\omega|}
$$

两边同除 $2$：

$$
\frac{1}{1+t^{2}}\;\longleftrightarrow\;\pi e^{-|\omega|}
$$

结果校验：$\frac{1}{1+t^{2}}$ 是实偶函数，其频谱必为实偶函数，
$\pi e^{-|\omega|}$ 满足；且 $F(0)=\pi$，而
$\int_{-\infty}^{+\infty}\frac{\mathrm{d}t}{1+t^{2}}=\pi$，一致。

**同类题**：

- 【附加作业4 第2题】频域卷积定理的具体用法见题型 4-4 的同类题。
- 【附加作业4 第3题】$f(t)$ 为实函数、
  $F(\mathrm{j}\omega)=R(\omega)+\mathrm{j}X(\omega)$ 时，用
  $F(-\mathrm{j}\omega)=R(\omega)-\mathrm{j}X(\omega)$ 代入奇偶分解即得
  $F_e(\mathrm{j}\omega)=R(\omega)$、$F_o(\mathrm{j}\omega)=\mathrm{j}X(\omega)$；
  结论要记牢：**实偶分量对应频谱的实部，实奇分量对应频谱的虚部**。

## 易错点

1. **反变换漏掉 $\frac{1}{2\pi}$** → 写成
   $f(t)=\frac{1}{2\pi}\int F(\mathrm{j}\omega)e^{\mathrm{j}\omega t}\mathrm{d}\omega$
   → 正变换积分里没有这个因子，很容易顺手漏掉。
2. **门函数变换漏掉 $\frac{\tau}{2}$** → 用
   $G_{\tau}(t)\leftrightarrow\tau\mathrm{Sa}\left(\frac{\omega\tau}{2}\right)$
   → $\mathrm{Sa}$ 的自变量是半宽乘 $\omega$，不是全宽乘 $\omega$。
3. **阶跃函数变换漏掉 $\pi\delta(\omega)$** → 必须写
   $u(t)\leftrightarrow\frac{1}{\mathrm{j}\omega}+\pi\delta(\omega)$ →
   少了这一项，凡含阶跃的题目（如作业4第2题）都错一项。
4. **频移符号搞反** → $f(t)e^{\mathrm{j}\omega_c t}$ 对应
   $F(\mathrm{j}(\omega-\omega_c))$ →
   "时域乘指数、频域右移"，可用 $\delta(\omega-\omega_c)$ 对照记忆。
5. **卷积定理与相乘性质混用** → 时域相乘配频域卷积，且要
   $\frac{1}{2\pi}$ 因子 → 两个变换的因子不对称，只能靠记。
6. **微积分性质漏掉跳变产生的冲激** → $f(t)$ 有跳变时先写出
   $f'(t)$ 的冲激项再变换 → 逐段求导并保留 $t_0\delta(t-t_0)$ 这类项。
7. **部分分式只保留一部分项** → 分母的每个因式都要给出一项，
   留数为零也要说明为零的原因 → 漏项在时域就是丢掉一个响应分量。
8. **把 $H(p)$ 与 $H(\mathrm{j}\omega)$ 混为一谈** → 只有稳定系统
   才能把 $p$ 换成 $\mathrm{j}\omega$ 得到频率响应 →
   $H(\mathrm{j}\omega)$ 是 $H(p)$ 在虚轴上的取值。
9. **判断无失真只看幅频** → 必须同时满足 $|H|=K$ 常数与
   $\varphi(\omega)=-\omega t_d$ 线性 → 幅度不失真但相位非线性仍会畸变。
10. **抽样定理中 $f_s$ 与 $\omega_s$、$f_m$ 与 $\omega_m$ 混用** →
    $f_s\ge 2f_m$ 或 $\omega_s\ge 2\omega_m$，两式因子都为 $2$，但单位不同 →
    带限信号可用矩形脉冲的"第一个零点"估计 $f_m$。
11. **认为理想低通可以物理实现** → 用佩利-维纳准则判定，
    $|H(\mathrm{j}\omega)|$ 不能在一段频带内恒为零 → 理想低通的
    $h(t)$ 在 $t<0$ 已有非零值，非因果。
