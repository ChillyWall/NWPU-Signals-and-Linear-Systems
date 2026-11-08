# 附录 A　专题横向对比 {.unnumbered}

正文按章回答"这一章怎么考"，本附录回答另一半问题：同一件事在六个域里各放在哪里、彼此怎么换算。
三个附录都不重述推导，只做横向对照与考前压缩；需要完整推导与例题时见相应章节。

## A.1 求零状态响应的三条路径 {.unnumbered}

求 $y_{zs}(t)$ 是本课程出现频率最高的计算，三条路径给出的结果必然相同，差别只在
"题目给了什么、要求以什么形式交付"。

| 路径 | 适用前提 | 计算步骤 | 优势 | 典型适用信号 |
|:-----|:---------|:---------|:-----|:-------------|
| 时域：卷积 | 已有 $h(t)$；两函数图形简单或可分段积分 | 定支撑区，排四个分界点，逐段积 | 不用查表，分段点定准后只算定积分 | 矩形、三角、分段直线 |
| 频域：$H(\mathrm{j}\omega)$ | $f(t)$ 绝对可积，或取其广义变换；系统稳定 | 写 $H(\mathrm{j}\omega)$，乘 $F$，反变换 | 调制、滤波、抽样类题一步到位 | $\cos$、$\sin$、门函数、带限信号 |
| 复频域：$H(s)$ | $H(s)$ 为有理函数，$F(s)$ 存在 | 乘得 $Y_{zs}(s)$，部分分式，查表 | 反变换表最全，同时带 $u(t)$ 收口 | 指数、阶跃、$t$ 乘指数类 |

三条路径的收口方式不同，这是丢分的常见来源：时域路径的答案本来是分段函数，写完全域积分就
错；频域路径的答案里常留 $\delta(\omega)$ 与 $\mathrm{Sa}$，需要靠对称性倒回来；复频域路径的
答案每一项都必须带 $u(t)$。

**什么时候只能用（或必须优先用）拉普拉斯变换**：

1. **不满足绝对可积**。$\mathrm{e}^{2t}u(t)$、$t^{2}u(t)$、$u(t)$ 这类信号的傅里叶变换只在广
   义函数意义下存在，频谱里会出现 $\delta$ 及其导数，反变换反而更繁；直接走 $s$ 域，收敛域
   $\mathrm{Re}(s)>\sigma_{0}$ 把"为什么不收敛"一并交代清楚。
2. **含初始条件**。傅里叶变换是零状态工具，初始储能在频域没有位置，无法交出 $y_{zi}(t)$；
   拉氏变换的微分性质自带 $f^{(k)}(0^{-})$ 项，全响应一次算完，再按极点归属拆成 $y_{zi}$ 与
   $y_{zs}$。
3. **需要看零输入响应、判稳定性、求稳态值**。零输入响应的极点必须靠 $A(s)=0$ 的根给出；
   因果与稳定要靠收敛域与极点位置判定；终值定理只在 $s$ 域有。

反过来，若题目只问某个频率的正弦稳态输出，用相量法或频率响应最快，此时不必做任何反变换。

## A.2 三大变换性质对照表 {.unnumbered}

下表左右两列是同一性质的两种写法。看这张表的目的不是背，而是记牢三处"不对称"。

| 性质 | 傅里叶变换 | 单边拉普拉斯变换 | 关键差异 |
|:-----|:-----------|:-----------------|:---------|
| 线性 | $aF_{1}+bF_{2}$ | $aF_{1}(s)+bF_{2}(s)$ | 无差异 |
| 时移 | $F(\mathrm{j}\omega)\mathrm{e}^{-\mathrm{j}\omega t_{0}}$ | $f(t-t_{0})u(t-t_{0})\to F(s)\mathrm{e}^{-st_{0}}$ | 单边必须补 $u(t-t_{0})$ |
| 频移 | $F\bigl(\mathrm{j}(\omega-\omega_{0})\bigr)$ | $F(s-s_{0})$ | 单边要求 $\mathrm{Re}(s_{0})$ 平移收敛域 |
| 尺度变换 | $\dfrac{1}{\lvert a\rvert}F\left(\mathrm{j}\dfrac{\omega}{a}\right)$ | $\dfrac{1}{a}F\left(\dfrac{s}{a}\right)$，$a>0$ | 傅里叶允许 $a<0$ 并产生反褶 |
| 时域卷积 | $F_{1}F_{2}$ | $F_{1}(s)F_{2}(s)$ | 单边默认两信号因果 |
| 频域卷积 | $\dfrac{1}{2\pi}F_{1}*F_{2}$ | 复卷积，极少考 | 因子 $\frac{1}{2\pi}$ 与卷积定理不对称 |
| 时域微分 | $(\mathrm{j}\omega)^{n}F(\mathrm{j}\omega)$ | $s^{n}F(s)-\sum s^{n-1-k}f^{(k)}(0^{-})$ | 单边带初始项，这是最大差异 |
| 时域积分 | $\dfrac{F(\mathrm{j}\omega)}{\mathrm{j}\omega}+\pi F(0)\delta(\omega)$ | $\dfrac{F(s)}{s}$ | 下限 $0^{-}$ 与 $-\infty$ 的区别 |
| 对称性 | $F(\mathrm{j}t)\leftrightarrow 2\pi f(-\omega)$ | 无对应关系 | 单边定义破坏了对称性 |

**三处必须记住的差异**：

1. **单边拉氏的微分性质带初始条件项**。二阶形式是
   $s^{2}F(s)-sf(0^{-})-f'(0^{-})$，初始项不是记忆负担而是复频域方法的价值所在：正因为有
   它，一个微分方程加一组初始条件才能一步化成代数方程。
2. **单边拉氏的积分性质下限是 $0^{-}$，不是 $-\infty$**。
   $\mathcal{L}\left[\int_{0^{-}}^{t}f(\tau)\mathrm{d}\tau\right]=\dfrac{F(s)}{s}$；
   若写成 $\int_{-\infty}^{t}$，非因果信号会多出
   $\dfrac{1}{s}\int_{-\infty}^{0^{-}}f(\tau)\mathrm{d}\tau$ 这一项，因果信号下该项为零，
   所以平时看不出差别，换题就错。
3. **傅里叶变换的尺度变换对 $a<0$ 有反褶**。因子是 $\frac{1}{\lvert a\rvert}$，
   $a<0$ 时 $F\left(\mathrm{j}\frac{\omega}{a}\right)$ 自带一次频率反褶；单边拉氏的尺度性质
   只对 $a>0$ 成立，因为 $t<0$ 段已被定义域丢掉，写 $a<0$ 没有意义。

## A.3 常用变换对三列对照表 {.unnumbered}

下表把正文第 4 章、第 5 章的两张变换对表并排放，方便看清"同一个信号在两个域里长什么样"。
$F(s)$ 列一律指单边拉普拉斯变换，故只反映 $t\ge 0$ 部分；收敛域一列缺省写"—"。

| $f(t)$ | $F(\mathrm{j}\omega)$ | $F(s)$ | 收敛域 |
|:-------|:----------------------|:-------|:-------|
| $\delta(t)$ | $1$ | $1$ | 整个 $s$ 平面 |
| $\delta(t-t_{0})$ | $\mathrm{e}^{-\mathrm{j}\omega t_{0}}$ | $\mathrm{e}^{-st_{0}}$ | 整个 $s$ 平面 |
| $u(t)$ | $\dfrac{1}{\mathrm{j}\omega}+\pi\delta(\omega)$ | $\dfrac{1}{s}$ | $\mathrm{Re}(s)>0$ |
| $1$ | $2\pi\delta(\omega)$ | $\dfrac{1}{s}$ | $\mathrm{Re}(s)>0$ |
| $\mathrm{sgn}(t)$ | $\dfrac{2}{\mathrm{j}\omega}$ | $\dfrac{1}{s}$ | $\mathrm{Re}(s)>0$ |
| $\mathrm{e}^{-at}u(t)$ | $\dfrac{1}{a+\mathrm{j}\omega}$ | $\dfrac{1}{s+a}$ | $\mathrm{Re}(s)>-a$ |
| $\mathrm{e}^{-a\lvert t\rvert}$ | $\dfrac{2a}{a^{2}+\omega^{2}}$ | — | — |
| $t\,u(t)$ | $\mathrm{j}\pi\delta'(\omega)-\dfrac{1}{\omega^{2}}$ | $\dfrac{1}{s^{2}}$ | $\mathrm{Re}(s)>0$ |
| $t^{n}\mathrm{e}^{-at}u(t)$ | $\dfrac{n!}{(a+\mathrm{j}\omega)^{n+1}}$ | $\dfrac{n!}{(s+a)^{n+1}}$ | $\mathrm{Re}(s)>-a$ |
| $\cos\omega_{0}t\,u(t)$ | $\dfrac{\pi}{2}\bigl[\delta(\omega-\omega_{0})+\delta(\omega+\omega_{0})\bigr]+\dfrac{\mathrm{j}\omega}{\omega_{0}^{2}-\omega^{2}}$ | $\dfrac{s}{s^{2}+\omega_{0}^{2}}$ | $\mathrm{Re}(s)>0$ |
| $\sin\omega_{0}t\,u(t)$ | $\dfrac{\pi}{2\mathrm{j}}\bigl[\delta(\omega-\omega_{0})-\delta(\omega+\omega_{0})\bigr]+\dfrac{\omega_{0}}{\omega_{0}^{2}-\omega^{2}}$ | $\dfrac{\omega_{0}}{s^{2}+\omega_{0}^{2}}$ | $\mathrm{Re}(s)>0$ |
| $\mathrm{e}^{-at}\cos\omega_{0}t\,u(t)$ | 取 $F(s)$ 令 $s=\mathrm{j}\omega$ | $\dfrac{s+a}{(s+a)^{2}+\omega_{0}^{2}}$ | $\mathrm{Re}(s)>-a$ |
| $\mathrm{e}^{-at}\sin\omega_{0}t\,u(t)$ | 取 $F(s)$ 令 $s=\mathrm{j}\omega$ | $\dfrac{\omega_{0}}{(s+a)^{2}+\omega_{0}^{2}}$ | $\mathrm{Re}(s)>-a$ |
| $u(t)-u(t-\tau)$ | $\tau\mathrm{Sa}\left(\dfrac{\omega\tau}{2}\right)\mathrm{e}^{-\frac{\mathrm{j}\omega\tau}{2}}$ | $\dfrac{1-\mathrm{e}^{-s\tau}}{s}$ | 整个 $s$ 平面 |
| $\mathrm{Sa}(\omega_{c}t)$ | $\dfrac{\pi}{\omega_{c}}$，$\lvert\omega\rvert<\omega_{c}$，其余为 $0$ | — | — |

表中十三类信号覆盖了附加作业与真题里出现的全部基本波形。四点读表说明：

1. **矩形脉冲一行取的是因果门** $u(t)-u(t-\tau)$。若改用关于原点对称的门函数
   $G_{\tau}(t)$，则 $G_{\tau}(t)\leftrightarrow\tau\mathrm{Sa}\left(\frac{\omega\tau}{2}\right)$，
   二者只差平移因子 $\mathrm{e}^{-\frac{\mathrm{j}\omega\tau}{2}}$，见“常用信号的傅里叶变换对”一节。
2. **$1$、$\mathrm{sgn}(t)$、$u(t)$ 三行的 $F(s)$ 都是 $1/s$**，这不是巧合：单边变换只积
   $t\ge 0$ 段，三个信号在 $t>0$ 上完全相同。若题目给的是双边变换，这三行必须分开写。
3. **$\mathrm{j}\pi\delta'(\omega)$ 项的来历**：由频域微分性质
   $t f(t)\leftrightarrow \mathrm{j}\dfrac{\mathrm{d}F}{\mathrm{d}\omega}$ 作用在 $u(t)$ 上
   得到，考场上直接推比背表更稳。
4. **"取 $F(s)$ 令 $s=\mathrm{j}\omega$"成立的前提是收敛域含虚轴**，即 $a>0$。$a<0$ 时该信号
   无傅里叶变换，不能这样替换（见 A.4 的稳定判据）。

## A.4 系统特性判据对照 {.unnumbered}

同一个性质往往有两条判据：拿 $h(t)$ 看是时域判据，拿收敛域与极点看是变换域判据。
考场上一句话用哪条，取决于题目给的是波形还是 $H(s)$。

| 特性 | 时域判据 | 变换域判据 | 易混提示 |
|:-----|:---------|:-----------|:---------|
| 线性 | 齐次性与叠加性同时成立 | $H(s)$ 与输入幅度、初态无关；$Y=HF$ 恒成立 | 含非零常数项只算增量线性 |
| 时不变 | $f(t-t_{0})\to y(t-t_{0})$ | $H(s)$、$H(\mathrm{j}\omega)$ 的系数全为常数 | 系数显含 $t$ 即变时 |
| 因果 | $h(t)=0$，对一切 $t<0$ | $H(s)$ 的收敛域是某右半平面 $\mathrm{Re}(s)>\sigma_{0}$ | 等价于 $\sigma_{0}$ 取最右极点实部 |
| 稳定 | $\displaystyle\int_{-\infty}^{+\infty}\lvert h(t)\rvert\mathrm{d}t<\infty$ | 收敛域含虚轴；有理系统等价于极点全在左半平面 | 收敛域含虚轴才可令 $s=\mathrm{j}\omega$ |

**因果与稳定的联合判据**（考试最爱考的一句）：因果系统的收敛域必为右半平面，稳定要求收敛域
含虚轴，两条同时成立的充要条件是**极点全部严格位于左半平面**。这也解释了为什么"因果且稳定"
只需看极点：收敛域与极点的相对位置已被因果性唯一确定。

**BIBO 稳定、渐近稳定、临界稳定三者不能混用**：

- **BIBO 稳定**只问"有界输入是否必有有界输出"，等价于 $h(t)$ 绝对可积；
- **渐近稳定**更强，要求 $h(t)\to 0$（$t\to+\infty$），等价于极点全部在左半平面；
- **临界稳定**指虚轴上允许一阶极点：此时 $h(t)$ 有等幅振荡或非零常值，绝对可积被破坏、
  $h(t)$ 也不趋于零，所以**临界稳定不是 BIBO 稳定**，只是"不发散"。不少教材直接把临界稳定
  归入不稳定，答题时把"临界稳定（不满足 BIBO）"写全最安全。
- 判据的顺序也要记牢：系数同号只是必要条件，必须再列罗斯表才能下结论（见“罗斯-霍尔维茨判据”一节）。

## A.5 一图流判断流程 {.unnumbered}

拿到一道题，先花三十秒回答三个问题，再动手。

- **第一问：题目要的交付物是什么？**
  - 要 $y(t)$（响应）→ 走下面第二条主线。
  - 要 $h(t)$、$H(s)$、极零图 → 部分分式或长除法，见第 2、6 章。
  - 要"是否稳定""参数范围"→ 罗斯判据，跳到第四条主线。
  - 要"频谱""带宽""功率"→ 第 3、4 章，做级数或变换即可，不涉及求响应。
- **第二问：题目给了哪些已知量？**
  - 给了 $h(t)$ 与 $f(t)$ 的波形 → 时域卷积（图形法），四个分界点定区间。
  - 给了微分方程与初始条件 → 拉氏变换一次算全响应，再拆 $y_{zi}$、$y_{zs}$。
  - 给了 $H(\mathrm{j}\omega)$ 或电路 → 频域相乘，反变换用部分分式。
  - 给了 $H(s)$ 与 $F(s)$ → 直接乘，部分分式查表，最快。
  - 只给了 $h(t)$ 的表达式，没给 $f(t)$ → 多半是求 $g(t)=\int h$ 或判稳定。
- **第三问：激励是什么类型的信号？**
  - 直流、阶跃、指数 → 拉氏或终值定理（阶跃输入下 $y(+\infty)=H(0)$）。
  - 单频正弦或余弦 → 频率响应：幅度乘 $\lvert H(\mathrm{j}\omega)\rvert$，相位加 $\varphi(\omega)$。
  - 周期非正弦 → 傅里叶级数逐项加权，不要做积分。
  - 有限长脉冲、门函数 → 傅里叶变换 + 卷积定理；或时域卷积，看哪个支撑区简单。
  - 抽样后的信号 → 频域复制与混叠，先算 $f_{s}$ 与 $2f_{m}$ 的大小关系。
- **第四条主线（判稳定性，独立于求响应）**
  - 先写 $D(s)$，检查系数是否同号无缺项：不同号直接判不稳定。
  - 再列罗斯表，数首列变号次数，得到右半平面根的个数。
  - 首列出现零：用 $\varepsilon$ 代替，或乘 $(s+1)$ 重建。
  - 出现全零行：取上一行写辅助多项式，对其求导替代全零行，再解 $P(s)=0$ 看虚轴极点阶数。
  - 反馈系统先由 $1+G(s)K(s)=0$ 求特征方程，再回到"写 $D(s)$"这一步。

三条三十秒口诀：

1. **有初态找拉氏，无初态看波形**：初态一出现，频域法就交不出答案。
2. **要稳态用 $H(\mathrm{j}\omega)$，要瞬态用 $H(s)$**：频率响应天然只描述零状态稳态。
3. **图形简单走时域，表达式简单走变换域**：分段的横线图形卷积只需算三角形面积，而指数乘
   多项式硬积会出错。

# 附录 B　公式速查 {.unnumbered}

本附录只列结论与成立条件，不写推导。带条件的公式在考场上要把条件抄在结果旁边，条件本身
就是采分点。

## B.1 信号与基本运算 {.unnumbered}

| 项目 | 结论 | 成立条件 |
|:-----|:-----|:---------|
| 冲激与阶跃 | $\delta(t)=\dfrac{\mathrm{d}u(t)}{\mathrm{d}t}$，$u(t)=\displaystyle\int_{-\infty}^{t}\delta(\tau)\mathrm{d}\tau$ | 广义函数意义下 |
| 取样 | $\displaystyle\int_{\alpha}^{\beta}f(t)\delta(t-t_{0})\mathrm{d}t=f(t_{0})$ | $\alpha<t_{0}<\beta$，否则为 $0$ |
| 筛选 | $f(t)\delta(t-t_{0})=f(t_{0})\delta(t-t_{0})$ | 恒成立 |
| 冲激尺度 | $\delta(at)=\dfrac{1}{\lvert a\rvert}\delta(t)$ | $a\ne 0$ |
| 奇偶分解 | $f_{e}(t)=\dfrac{f(t)+f(-t)}{2}$，$f_{o}(t)=\dfrac{f(t)-f(-t)}{2}$ | 定义在对称区间 |
| 波形变换 | $f(at+b)$：$(t_{k},f_{k})\to\left(\dfrac{t_{k}-b}{a},\ f_{k}\right)$ | 先定 $a$ 的符号再搬点 |
| 能量与功率 | $E=\displaystyle\int_{-\infty}^{+\infty}\lvert f(t)\rvert^{2}\mathrm{d}t$，$P=\displaystyle\lim_{T\to\infty}\frac{1}{2T}\int_{-T}^{T}\lvert f(t)\rvert^{2}\mathrm{d}t$ | 能量信号 $0<E<\infty$；功率信号 $0<P<\infty$ |

波形变换一行的两种写法等价：把括号内化成 $a(t-t_{0})$ 的标准形后，关键点映射为
$(t_{k},f_{k})\to\left(t_{0}+t_{k}/a,\ Af_{k}\right)$，其中 $A$ 为该步的幅度增益；
用 $f(at+b)$ 的原始形式算，就是上表那一行。作图顺序按"尺度、反褶、平移、标量相乘"，
**先平移后尺度时平移量要除以 $a$**，这是最容易错的一步，见“信号的简单处理”一节。

## B.2 卷积 {.unnumbered}

定义与因果形式：

$$
f_{1}(t)*f_{2}(t)=\int_{-\infty}^{+\infty}f_{1}(\tau)f_{2}(t-\tau)\,\mathrm{d}\tau .
$$

若 $f_{1}$、$f_{2}$ 都是因果信号，则上下限改为 $0$ 到 $t$，即
$f_{1}(t)*f_{2}(t)=\displaystyle\int_{0}^{t}f_{1}(\tau)f_{2}(t-\tau)\mathrm{d}\tau$。

| 性质 | 结论 | 条件 |
|:-----|:-----|:-----|
| 交换、分配、结合 | $f_{1}*f_{2}=f_{2}*f_{1}$，$f_{1}*(f_{2}+f_{3})=f_{1}*f_{2}+f_{1}*f_{3}$ | 恒成立 |
| 时移 | $f_{1}(t-t_{1})*f_{2}(t-t_{2})=y(t-t_{1}-t_{2})$ | 恒成立 |
| 微积分 | $\left(f_{1}*f_{2}\right)'=f_{1}'*f_{2}=f_{1}*f_{2}'$，积分可任取一个因子做 | 可导 |
| 与冲激 | $f(t)*\delta(t-t_{0})=f(t-t_{0})$，$f(t)*\delta^{(n)}(t-t_{0})=f^{(n)}(t-t_{0})$ | 恒成立 |
| 与阶跃 | $f(t)*u(t)=\displaystyle\int_{-\infty}^{t}f(\tau)\mathrm{d}\tau$ | 恒成立 |

常用卷积结果（$a$ 为任意实数，$E$ 为幅度，$\tau$ 为宽度）：

| 卷积 | 结果 |
|:-----|:-----|
| $u(t)*u(t)$ | $t\,u(t)$ |
| $t\,u(t)*u(t)$ | $\dfrac{1}{2}t^{2}u(t)$ |
| $\mathrm{e}^{at}u(t)*\mathrm{e}^{at}u(t)$ | $t\,\mathrm{e}^{at}u(t)$（谐振来源） |
| 两个同宽同高矩形 | 三角形，底 $2\tau$，高 $E^{2}\tau$ |
| 两个不同宽矩形 | 梯形，总宽 $\tau_{1}+\tau_{2}$，平顶宽 $\lvert\tau_{1}-\tau_{2}\rvert$，高 $E^{2}\min(\tau_{1},\tau_{2})$ |

**卷积积分限的三条判据**（设 $f_{1}$ 只在 $[a,b]$ 非零，$f_{2}$ 只在 $[c,d]$ 非零）：

1. 重叠区间为 $\left[\max(a,t-d),\ \min(b,t-c)\right]$，区间非空才积，否则结果写 $0$；
2. 四个分界点 $a+c$、$a+d$、$b+c$、$b+d$ 排序后即为分段点，互不相同的个数等于分段段数；
3. 结果支撑区起点 $a+c$、长度 $(b-a)+(d-c)$，用它回验分段是否写全。

## B.3 傅里叶级数 {.unnumbered}

本附录统一记基频 $\omega_{0}=\dfrac{2\pi}{T}$（第 3 章正文记作 $\Omega$，是同一个量）。

三角形式与系数（周期为 $T$）：

$$
f(t)=\frac{a_{0}}{2}+\sum_{n=1}^{+\infty}\left(a_{n}\cos n\omega_{0}t+b_{n}\sin n\omega_{0}t\right),
$$
$$
a_{n}=\frac{2}{T}\int_{t_{1}}^{t_{1}+T}f(t)\cos n\omega_{0}t\,\mathrm{d}t,
\qquad
b_{n}=\frac{2}{T}\int_{t_{1}}^{t_{1}+T}f(t)\sin n\omega_{0}t\,\mathrm{d}t .
$$

指数形式与换算：

$$
f(t)=\sum_{n=-\infty}^{+\infty}c_{n}\mathrm{e}^{\mathrm{j}n\omega_{0}t},
\qquad
c_{n}=\frac{1}{T}\int_{t_{1}}^{t_{1}+T}f(t)\mathrm{e}^{-\mathrm{j}n\omega_{0}t}\mathrm{d}t .
$$

两种形式的换算（实信号，$n\ge 1$）：

$$
c_{0}=\frac{a_{0}}{2}=\frac{A_{0}}{2},
\qquad
\lvert c_{n}\rvert=\frac{A_{n}}{2}=\frac{1}{2}\sqrt{a_{n}^{2}+b_{n}^{2}},
\qquad
\varphi_{n}=-\arctan\frac{b_{n}}{a_{n}} .
$$

$\varphi_{n}$ 的象限由 $(a_{n},-b_{n})$ 所在象限决定，不能只取反正切主值；双边谱必须成对
画 $c_{n}$ 与 $c_{-n}$。

周期信号的平均功率与帕塞瓦尔定理（$f$ 在一周期内平方可积）：

$$
P=\frac{1}{T}\int_{t_{1}}^{t_{1}+T}f^{2}(t)\,\mathrm{d}t
=\frac{a_{0}^{2}}{4}+\sum_{n=1}^{+\infty}\frac{a_{n}^{2}+b_{n}^{2}}{2}
=\sum_{n=-\infty}^{+\infty}\lvert c_{n}\rvert^{2},
\qquad
f_{\mathrm{rms}}=\sqrt{P} .
$$

功率可以按频率逐项相加，有效值不行——这是帕塞瓦尔定理最常被用错的地方。

成立条件：满足狄利克雷条件（一周期内只有有限个第一类间断点与有限个极值点，且绝对可积）；
此时级数在连续点等于 $f(t)$，在间断点收敛到 $\dfrac{f(t_{0}^{+})+f(t_{0}^{-})}{2}$。

必备模型（周期矩形脉冲，幅度 $E$、脉宽 $\tau$、周期 $T$）：

$$
c_{n}=\frac{E\tau}{T}\,\mathrm{Sa}\left(\frac{n\omega_{0}\tau}{2}\right),
\qquad
\mathrm{Sa}(0)=1 .
$$

频带宽度三种定义，题目必须认准是哪一种：以最大幅度的 $\frac{1}{10}$ 为限；以幅度谱第一个
过零点为限（最常用）；以包含 $90\%$ 功率为限。按第二种定义，矩形脉冲
$B_{f}=\dfrac{1}{\tau}$、$B_{\omega}=\dfrac{2\pi}{\tau}$，即脉宽与带宽成反比。

## B.4 傅里叶变换 {.unnumbered}

$$
F(\mathrm{j}\omega)=\int_{-\infty}^{+\infty}f(t)\mathrm{e}^{-\mathrm{j}\omega t}\mathrm{d}t,
\qquad
f(t)=\frac{1}{2\pi}\int_{-\infty}^{+\infty}F(\mathrm{j}\omega)\mathrm{e}^{\mathrm{j}\omega t}\mathrm{d}\omega .
$$

反变换前的 $\dfrac{1}{2\pi}$ 只属于反变换，正变换没有。

存在条件：$f(t)$ 在整条实轴上绝对可积，且只有有限个第一类间断点与有限个极值点
（狄利克雷条件，充分条件）。不满足时，借助冲激函数可定义广义傅里叶变换。

| 性质 | 结论 | 条件 |
|:-----|:-----|:-----|
| 时移与频移 | $f(t-t_{0})\leftrightarrow F\mathrm{e}^{-\mathrm{j}\omega t_{0}}$；$f(t)\mathrm{e}^{\mathrm{j}\omega_{0}t}\leftrightarrow F\bigl(\mathrm{j}(\omega-\omega_{0})\bigr)$ | 恒成立 |
| 尺度 | $f(at)\leftrightarrow\dfrac{1}{\lvert a\rvert}F\left(\mathrm{j}\dfrac{\omega}{a}\right)$ | $a\ne 0$，$a<0$ 带反褶 |
| 对称 | $F(\mathrm{j}t)\leftrightarrow 2\pi f(-\omega)$ | 恒成立 |
| 微分 | $f^{(n)}(t)\leftrightarrow(\mathrm{j}\omega)^{n}F(\mathrm{j}\omega)$ | 可用跳变逐项写 |
| 积分 | $\displaystyle\int_{-\infty}^{t}f\leftrightarrow\frac{F(\mathrm{j}\omega)}{\mathrm{j}\omega}+\pi F(0)\delta(\omega)$ | $F(0)\ne 0$ 时冲激项必写 |
| 卷积定理 | $f_{1}*f_{2}\leftrightarrow F_{1}F_{2}$ | 恒成立 |
| 相乘定理 | $f_{1}f_{2}\leftrightarrow\dfrac{1}{2\pi}F_{1}*F_{2}$ | 因子不能丢 |

调制与抽样两条最常用的推论：

$$
f(t)\cos\omega_{0}t\ \longleftrightarrow\
\frac{1}{2}\left[F\bigl(\mathrm{j}(\omega+\omega_{0})\bigr)+F\bigl(\mathrm{j}(\omega-\omega_{0})\bigr)\right],
$$

$$
F_{s}(\mathrm{j}\omega)=\frac{1}{T_{s}}\sum_{k=-\infty}^{+\infty}F\bigl(\mathrm{j}(\omega-k\omega_{s})\bigr).
$$

恢复条件两条：抽样角频率 $\omega_{s}\ge 2\omega_{m}$（奈奎斯特），恢复低通的截止频率
$\omega_{m}<\omega_{c}<\omega_{s}-\omega_{m}$。

周期信号的傅里叶变换（冲激串）：

$$
F(\mathrm{j}\omega)=2\pi\sum_{n=-\infty}^{+\infty}c_{n}\delta(\omega-n\omega_{0}),
\qquad
\sum_{k=-\infty}^{+\infty}\delta(t-kT)\ \longleftrightarrow\
\omega_{0}\sum_{n=-\infty}^{+\infty}\delta(\omega-n\omega_{0}).
$$

单脉冲与周期化的桥：$c_{n}=\dfrac{1}{T}F_{0}(\mathrm{j}n\omega_{0})$，$F_{0}$ 是取一个周期、
其余补零所得信号的变换。能量式（帕塞瓦尔）：$E=\displaystyle\int\lvert f\rvert^{2}\mathrm{d}t
=\frac{1}{2\pi}\int\lvert F(\mathrm{j}\omega)\rvert^{2}\mathrm{d}\omega$，要求 $f$ 能量有限。

完整变换对见 A.3；判决"能否用频域法"的依据是上面这条存在条件。

## B.5 拉普拉斯变换 {.unnumbered}

单边与双边（必须分清，混用是硬错）：

单边拉普拉斯变换：

$$
F(s)=\int_{0^{-}}^{+\infty}f(t)\mathrm{e}^{-st}\mathrm{d}t .
$$

双边拉普拉斯变换：

$$
F(s)=\int_{-\infty}^{+\infty}f(t)\mathrm{e}^{-st}\mathrm{d}t .
$$

下限取 $0^{-}$ 是为了把 $t=0$ 处的冲激与 $t=0^{-}$ 的初始状态一并计入，这样微分性质的初始
项才与电路"动作发生前"的状态对齐。单边变换只反映 $t\ge 0$ 部分，因此 $F(s)$ 唯一确定
$t\ge 0$ 的波形；双边变换必须 $F(s)$ 与收敛域一起给才唯一。

收敛域与信号类型的对应：

| 信号类型 | 收敛域形状 | 例 |
|:---------|:-----------|:---|
| 右边（因果） | $\mathrm{Re}(s)>\sigma_{0}$ | $\mathrm{e}^{-2t}u(t)$：$\mathrm{Re}(s)>-2$ |
| 左边（反因果） | $\mathrm{Re}(s)<\sigma_{0}$ | $-\mathrm{e}^{-2t}u(-t)$：$\mathrm{Re}(s)<-2$ |
| 双边 | $\sigma_{1}<\mathrm{Re}(s)<\sigma_{2}$ | 两项之和，条带形 |
| 时限且绝对可积 | 整个 $s$ 平面 | 因果门函数 |

三条推论：收敛域边界必穿过极点且内部不含极点；收敛域含虚轴时
$F(\mathrm{j}\omega)=\left.F(s)\right\rvert_{s=\mathrm{j}\omega}$；同一个有理式配不同收敛域
给出不同原信号。

单边拉普拉斯变换的性质（与傅里叶变换逐条对照见 A.2）：

| 性质 | 复频域 | 条件 |
|:-----|:-------|:-----|
| 线性 | $a_{1}F_{1}(s)+a_{2}F_{2}(s)$ | 至少为两收敛域的交 |
| 尺度变换 | $\dfrac{1}{a}F\left(\dfrac{s}{a}\right)$ | $a>0$ |
| 时移 | $\mathrm{e}^{-st_{0}}F(s)$ | 必须写 $f(t-t_{0})u(t-t_{0})$ |
| 频移 | $F(s-s_{0})$ | 收敛域平移 $\mathrm{Re}(s_{0})$ |
| 时域微分 | $s^{n}F(s)$ 减去初始项 | 初始项不可省，见下式 |
| 时域积分 | $\dfrac{F(s)}{s}$ | 下限取 $0^{-}$ |
| 频域微分 | $-\dfrac{\mathrm{d}F(s)}{\mathrm{d}s}$ 对应 $tf(t)$ | 收敛域不变 |
| 卷积定理 | $F_{1}(s)F_{2}(s)$ | 至少为两收敛域的交 |

$$
\mathcal{L}\left[f^{(n)}(t)\right]
=s^{n}F(s)-\sum_{k=0}^{n-1}s^{n-1-k}f^{(k)}(0^{-}).
$$

常用变换对见 A.3，这里只补与初值、终值有关的结论。

初值定理（$f$ 与 $f'$ 存在且变换存在）：$f(0^{+})=\lim\limits_{s\to\infty}sF(s)$。若 $F(s)$
是假分式（含冲激项），先长除分出多项式，再对真分式部分取极限。

终值定理（成立条件：$sF(s)$ 的极点全在左半平面）：$f(+\infty)=\lim\limits_{s\to 0}sF(s)$。
虚轴上有极点时终值不存在，算出来的是假值。阶跃输入下 $Y(s)=\dfrac{H(s)}{s}$，故
$y(+\infty)=H(0)$。

**部分分式展开的全部系数公式**（设 $F(s)=\dfrac{N(s)}{D(s)}$，$m<n$）：

| 情形 | 系数公式 | 时间项 |
|:-----|:---------|:-------|
| 单实根 | $K_{i}=(s-s_{i})F(s)\big\rvert_{s=s_{i}}=\dfrac{N(s_{i})}{D'(s_{i})}$ | $K_{i}\mathrm{e}^{s_{i}t}u(t)$ |
| 共轭复根 | $K_{2}=K_{1}^{*}$，$K_{1}=\lvert K_{1}\rvert\mathrm{e}^{\mathrm{j}\phi_{1}}$ | $2\lvert K_{1}\rvert\mathrm{e}^{\sigma_{1}t}\cos(\omega_{0}t+\phi_{1})$ |
| $r$ 重根 $p$ | $K_{1k}=\dfrac{1}{(r-k)!}\left.\dfrac{\mathrm{d}^{r-k}}{\mathrm{d}s^{r-k}}\left[(s-p)^{r}F(s)\right]\right\rvert_{s=p}$ | $\dfrac{K_{1k}t^{r-k}}{(r-k)!}\mathrm{e}^{pt}u(t)$ |
| 假分式 | 先长除：$F(s)=M(s)+\dfrac{N_{1}(s)}{D(s)}$ | $M(s)$ 给 $\delta(t)$ 及其导数 |

假分式一项务必单独记：$\mathcal{L}^{-1}[1]=\delta(t)$，$\mathcal{L}^{-1}[s^{n}]=\delta^{(n)}(t)$。
重根系数一定要逐阶求导，$r=2$ 时两个系数分别是
$\left[(s-p)^{2}F(s)\right]_{s=p}$ 与它的一阶导数在 $s=p$ 的值。

## B.6 系统函数与稳定性 {.unnumbered}

$$
H(s)=\frac{Y_{zs}(s)}{F(s)}=\frac{B(s)}{A(s)},
\qquad
H(\mathrm{j}\omega)=\left.H(s)\right\rvert_{s=\mathrm{j}\omega}.
$$

后一个等号只在收敛域含虚轴（即系统稳定）时成立，这是 $H(\mathrm{j}\omega)$ 与 $H(s)$ 唯一
正式的关系。

$A(s)=0$ 的根为极点 $p_{i}$，$B(s)=0$ 的根为零点 $z_{i}$；实系数有理式的极零点只能是实数
或共轭复数，极零图关于实轴对称。极点个数与零点个数之差决定 $h(t)$ 是否含 $\delta(t)$
及其导数（$m\ge n$ 时含）。

极点位置与 $h(t)$ 波形（$p_{i}=\sigma_{i}+\mathrm{j}\omega_{i}$）：

| 极点位置 | 参数 | $h(t)$ 行为 |
|:---------|:-----|:------------|
| 负实轴 | $\sigma_{i}<0$，$\omega_{i}=0$ | 单调衰减，时间常数 $1/\lvert\sigma_{i}\rvert$ |
| 正实轴 | $\sigma_{i}>0$，$\omega_{i}=0$ | 单调增长 |
| 左半平面共轭对 | $\sigma_{i}<0$，$\omega_{i}\ne 0$ | 减幅振荡，周期 $2\pi/\lvert\omega_{i}\rvert$ |
| 虚轴共轭对 | $\sigma_{i}=0$，$\omega_{i}\ne 0$ | 等幅振荡，临界稳定 |
| 右半平面共轭对 | $\sigma_{i}>0$，$\omega_{i}\ne 0$ | 增幅振荡；$r$ 重极点为发散 |

稳定判据三级：必要条件是 $D(s)$ 系数同号且无缺项；充要条件是罗斯表首列同号（等效于极点
全在左半平面）；因果且稳定等价于极点全在左半平面。反馈系统 $H(s)=\dfrac{G(s)}{1+G(s)K(s)}$，
闭环极点由特征方程 $1+G(s)K(s)=0$ 决定。

罗斯表递推（把上两行记作 $b_{1},b_{2},\dots$ 与 $c_{1},c_{2},\dots$）：

$$
d_{1}=\frac{b_{1}c_{2}-b_{2}c_{1}}{b_{1}},
\qquad
d_{2}=\frac{b_{1}c_{3}-b_{2}c_{2}}{b_{1}},
\qquad\cdots
$$

口诀：左上乘右下，减右上乘左下，再除以上一行的首列元素。首列变号次数等于右半平面根个数
（重根按重数计）。

两种特殊情况的处理规则：

1. **首列出现零**：用无穷小正量 $\varepsilon$ 代替该零继续造表，令 $\varepsilon\to 0^{+}$
   判符号；或先把 $D(s)$ 乘 $(s+1)$ 再重建表。两种做法结论必须一致，卷面上写清用的是哪种。
2. **出现全零行**：说明存在关于原点对称的根。取全零行的上一行系数构造辅助多项式 $P(s)$，
   用 $\dfrac{\mathrm{d}P(s)}{\mathrm{d}s}$ 的系数替代全零行继续造表；再解 $P(s)=0$：虚轴上
   单极点判临界稳定，重极点判不稳定。

## B.7 常用数学工具 {.unnumbered}

积化和差（级数展开与卷积化简都要用）：

| 公式 | 结果 |
|:-----|:-----|
| $\sin A\cos B$ | $\dfrac{1}{2}\left[\sin(A+B)+\sin(A-B)\right]$ |
| $\cos A\cos B$ | $\dfrac{1}{2}\left[\cos(A+B)+\cos(A-B)\right]$ |
| $\sin A\sin B$ | $\dfrac{1}{2}\left[\cos(A-B)-\cos(A+B)\right]$ |

二倍角与降幂：$\sin 2A=2\sin A\cos A$，
$\cos 2A=\cos^{2}A-\sin^{2}A=1-2\sin^{2}A$，
$\sin^{2}A=\dfrac{1-\cos 2A}{2}$，$\cos^{2}A=\dfrac{1+\cos 2A}{2}$。

欧拉公式与复数：

$$
\mathrm{e}^{\mathrm{j}\theta}=\cos\theta+\mathrm{j}\sin\theta,
\qquad
\cos\theta=\frac{\mathrm{e}^{\mathrm{j}\theta}+\mathrm{e}^{-\mathrm{j}\theta}}{2},
\qquad
\sin\theta=\frac{\mathrm{e}^{\mathrm{j}\theta}-\mathrm{e}^{-\mathrm{j}\theta}}{2\mathrm{j}} .
$$

$$
a+\mathrm{j}b=\sqrt{a^{2}+b^{2}}\,\mathrm{e}^{\mathrm{j}\varphi},
\qquad
\sum_{n=0}^{N-1}q^{n}=\frac{1-q^{N}}{1-q}\quad (q\ne 1).
$$

其中 $\varphi=\arctan\dfrac{b}{a}$，实数部分为负时要按 $(a,b)$ 所在象限加或减 $\pi$，不能
只取反正切主值。等比求和在周期信号展开与冲激串求和里反复出现。

常用定积分（$a>0$，$\omega$ 任意）：

| 积分 | 结果 |
|:-----|:-----|
| $\displaystyle\int_{0}^{\infty}t\mathrm{e}^{-at}\mathrm{d}t$ | $\dfrac{1}{a^{2}}$ |
| $\displaystyle\int_{0}^{\infty}t^{n}\mathrm{e}^{-at}\mathrm{d}t$ | $\dfrac{n!}{a^{n+1}}$ |
| $\displaystyle\int_{0}^{\infty}\mathrm{e}^{-at}\cos\omega t\,\mathrm{d}t$ | $\dfrac{a}{a^{2}+\omega^{2}}$ |
| $\displaystyle\int_{0}^{\infty}\mathrm{e}^{-at}\sin\omega t\,\mathrm{d}t$ | $\dfrac{\omega}{a^{2}+\omega^{2}}$ |
| $\displaystyle\int_{0}^{\infty}t\mathrm{e}^{-at}\cos\omega t\,\mathrm{d}t$ | $\dfrac{a^{2}-\omega^{2}}{(a^{2}+\omega^{2})^{2}}$ |
| $\displaystyle\int_{0}^{\infty}t\mathrm{e}^{-at}\sin\omega t\,\mathrm{d}t$ | $\dfrac{2a\omega}{(a^{2}+\omega^{2})^{2}}$ |

抽样函数的常用值（$\mathrm{Sa}(x)=\dfrac{\sin x}{x}$，与 $\mathrm{sinc}$ 相差一个 $\pi$
因子）：$\mathrm{Sa}(0)=1$；$\mathrm{Sa}(n\pi)=0$（$n$ 为非零整数）；
$\displaystyle\int_{-\infty}^{+\infty}\mathrm{Sa}(x)\mathrm{d}x=\pi$；
$\displaystyle\int_{0}^{+\infty}\mathrm{Sa}(x)\mathrm{d}x=\frac{\pi}{2}$；
$\displaystyle\int_{-\infty}^{+\infty}\mathrm{Sa}^{2}(x)\mathrm{d}x=\pi$。

# 附录 C　易错点与陷阱总汇 {.unnumbered}

六章正文的"易错点"节按章罗列，这里按性质重排成三类。每条都是考场提醒：前半句是错误做法，
后半句是正确做法，括号里是一句话原因。

## C.1 概念类 {.unnumbered}

1. 错误：把 $y_{zi}(t)$ 当自然响应。正确：自然响应是 $y_{zi}$ 加上 $y_{zs}$ 中与特征根
   对应的那部分（两者划分依据不同：谁引起对极点归属）。
2. 错误：把 $y_{zs}(t)$ 当受迫响应。正确：$y_{zs}$ 同时含自然与受迫两种成分（它由全部
   极点决定，不只看激励极点）。
3. 错误：把"稳定"等同于"渐近稳定"。正确：BIBO 稳定只要求 $h(t)$ 绝对可积（虚轴一阶极点
   属临界稳定，此时 $h(t)$ 不趋于零）。
4. 错误：以为 $H(\mathrm{j}\omega)$ 与 $H(s)$ 是一回事。正确：$H(\mathrm{j}\omega)$ 只是
   $H(s)$ 在虚轴上的截线，且要求收敛域含虚轴（系统稳定）。
5. 错误：以为任何系统都能令 $s=\mathrm{j}\omega$。正确：只有稳定系统的频率响应才有意义
   （右半平面极点使 $h$ 不绝对可积）。
6. 错误：以为 $h(t)$ 是系统对任意输入的响应。正确：$h(t)$ 是激励为 $\delta(t)$ 时的零状态
   响应（它描述系统本身）。
7. 错误：以为周期信号没有傅里叶变换。正确：周期信号的频谱是冲激串
   $2\pi\sum c_{n}\delta(\omega-n\omega_{0})$（广义变换）。
8. 错误：认为负频率"不存在所以不必画"。正确：双边谱必须画负频率，实信号的双边幅度谱偶
   对称（漏掉就丢一半幅度）。
9. 错误：把取样特性的结果当成 $t$ 的函数。正确：结果是数 $f(t_{0})$（积分已把 $t$ 消掉）。
10. 错误：以为子系统串联时 $H$ 相加。正确：串联相乘、并联相加（对应卷积与求和）。
11. 错误：以为全通系统就是无失真系统。正确：全通只保证幅频为常数，相频非线性时仍有相位
    失真（无失真要求两条同时满足）。
12. 错误：以为负反馈一定稳定。正确：增益过大会把闭环极点推入右半平面（这正是求 $K$ 稳定
    范围的考点）。
13. 错误：以为频带越宽响应越慢。正确：$t_{r}B_{f}\approx 0.5$，带宽与上升时间成反比。
14. 错误：以为系数全正就稳定。正确：同号只是必要条件，必须再列罗斯表（见“罗斯-霍尔维茨判据”一节的反例）。

## C.2 运算类 {.unnumbered}

1. 错误：卷积一律写 $\int_{-\infty}^{+\infty}$ 不分段。正确：先定支撑区，用四个分界点划区间
   （区间外被积函数为零，硬套全域得不到分段结果）。
2. 错误：反褶后把平移方向写反。正确：$h(t-\tau)$ 是把 $h(-\tau)$ 向右平移 $t$
   （$t>0$），写成 $h(-(\tau+t))$ 就变成左移。
3. 错误：部分分式重根系数只求一次。正确：按
   $\dfrac{1}{(r-k)!}\dfrac{\mathrm{d}^{r-k}}{\mathrm{d}s^{r-k}}$ 逐阶求导（$r$ 阶重根要
   求 $r$ 次）。
4. 错误：对假分式直接做部分分式。正确：先长除分出多项式（多项式项对应 $\delta(t)$ 及其
   导数）。
5. 错误：微分性质只写 $s^{2}Y(s)$。正确：写全 $s^{2}Y(s)-sy(0^{-})-y'(0^{-})$（初始项
   是全响应一次算出的根本）。
6. 错误：时移性质写成 $f(t-t_{0})$。正确：单边变换要写 $f(t-t_{0})u(t-t_{0})$（$t<t_{0}$
   段必须确实为零）。
7. 错误：反变换漏 $\dfrac{1}{2\pi}$。正确：该因子只属于傅里叶反变换（正变换没有）。
8. 错误：频域卷积漏 $\dfrac{1}{2\pi}$。正确：相乘定理必须带该因子（与卷积定理不对称）。
9. 错误：冲激尺度写成 $\delta(at)=\delta(t)$。正确：$\delta(at)=\dfrac{1}{\lvert a\rvert}
   \delta(t)$（面积必须守 1）。
10. 错误：尺度变换顺序做错。正确：先平移后压缩时平移量要除以 $a$（每一步都对变量 $t$ 操作）。
11. 错误：罗斯表整行为零时直接跳过。正确：用辅助多项式求导后的系数替代该行（全零行说明
    有对称根，不能直接判稳定或不定）。
12. 错误：罗斯表首列是零还继续除。正确：用 $\varepsilon$ 代替或乘 $(s+1)$ 重建（除零无
    意义）。
13. 错误：变号次数跳行比较。正确：只比较首列相邻两元素的正负（跳行会漏计）。
14. 错误：单边频谱直接抄双边幅度。正确：$n\ge 1$ 时 $A_{n}=2\lvert c_{n}\rvert$（单边把
    负频率的能量折叠过来）。
15. 错误：把 $a_{0}$ 当直流分量。正确：直流分量是 $\dfrac{a_{0}}{2}=c_{0}$（展开式自带
    $\frac{1}{2}$）。
16. 错误：求 $H(s)$ 时不置零初始状态。正确：先把等效源置零（否则得到的是特定初态下的
    响应）。
17. 错误：反变换结果不写 $u(t)$。正确：每个指数项后面都补 $u(t)$（零状态响应在 $t<0$ 为
    零）。
18. 错误：抽样定理把 $f_{s}$ 与 $\omega_{s}$ 混用。正确：$f_{s}\ge 2f_{m}$ 与
    $\omega_{s}\ge 2\omega_{m}$ 各自成立（两个 $2$ 都对，单位不同）。
19. 错误：不查条件就用终值定理。正确：先看 $sF(s)$ 的极点是否全在左半平面（虚轴有极点时
    终值不存在）。
20. 错误：卷积性质与乘法律混用。正确：只用
    $\left(f_{1}*f_{2}\right)'=f_{1}'*f_{2}=f_{1}*f_{2}'$ 这一条恒等式（不能把导数分别
    分配后各自求值再相乘）。

## C.3 记号与符号类 {.unnumbered}

1. 错误：$\mathcal{F}$ 与 $\mathcal{L}$ 混用。正确：傅里叶变换写
   $F(\mathrm{j}\omega)=\mathcal{F}[f(t)]$，拉氏写 $F(s)=\mathcal{L}[f(t)]$（自变量不同）。
2. 错误：虚数单位写成斜体字母。正确：一律写正体 $\mathrm{j}$（与支路电流 $i$ 区分）。
3. 错误：写 $F(s)$ 不写收敛域。正确：$F(s)$ 后紧跟 $\mathrm{Re}(s)>\sigma_{0}$（双边变换
   尤其必需）。
4. 错误：单边变换下限写成 $0$ 或 $0^{+}$。正确：一律 $0^{-}$（要含 $t=0$ 处的冲激与初态）。
5. 错误：$\mathrm{Sa}$ 与 $\mathrm{sinc}$ 直接换用。正确：$\mathrm{Sa}(x)=\frac{\sin x}{x}$，
   $\mathrm{sinc}(x)=\frac{\sin\pi x}{\pi x}$（差一个 $\pi$ 因子）。
6. 错误：阶跃写成 $\varepsilon(t)$。正确：全篇写 $u(t)$（课件写法与本书记号只差字体）。
7. 错误：卷积写成点乘或 $\ast$。正确：写 $f_{1}(t)*f_{2}(t)$（点乘是相乘，不是卷积）。
8. 错误：自然底写成斜体 $e$，或与电荷 $e$ 混用。正确：写正体 $\mathrm{e}^{-at}$
   （指数基数与变量要分清）。
9. 错误：$\omega_{c}$ 与 $f_{c}$ 混写。正确：$\omega$ 的单位是 $\mathrm{rad/s}$，$f$ 的
   单位是 $\mathrm{Hz}$，二者差 $2\pi$。
10. 错误：基频一会儿写 $\omega_{0}$ 一会儿写 $\Omega$。正确：同一次作答只用一种（本书第
    3 章用 $\Omega$，其余章用 $\omega_{0}$）。
11. 错误：响应记号 $r(t)$ 与 $y(t)$ 混用。正确：同一题内统一（前言约定响应为 $y(t)$，
    零输入、零状态写作 $y_{zi}$、$y_{zs}$）。
12. 错误：把"增量线性"直接写成"线性"。正确：写"严格意义非线性，但零状态响应满足线性"
    （含非零常数项时必须这样表述）。
