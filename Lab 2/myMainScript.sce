clear; clc;
// --------------------------------
// Question 1
// Part a
s = poly(0, 's');
a = 32;
b = 13;
G = a / (s + b);
S = syslin('c', G);
// Part b
t = 0:(1/130):5;
y = csim('step', t, S);
scf();
plot(t, y, 'k', 'LineWidth', 2);
set(gca(),"data_bounds",[-0.5,-0.1;5,2.6]);
time_constant = [1/b];
y1 = [y(11)];
plot(time_constant, y1, 'r*', 'LineWidth', 4);
settling_time_2p = time_constant .* log(50);
plot(settling_time_2p, y(1+(settling_time_2p .* 130)), 'b*', 'LineWidth', 4);
rise_time_low = time_constant .* log(10/9);
rise_time_high = time_constant .* log(10/1);
plot(rise_time_low, y(1+(rise_time_low .* 130)), 'm>', 'LineWidth', 4);
plot(rise_time_high, y(1+(rise_time_high .* 130)), 'm<', 'LineWidth', 4);
legend(['Step Response','Time Constant','2% Settling Time','Rise Time Start','Rise Time End'],4);
xlabel("time",'fontsize', 3);
ylabel("Step Response",'fontsize', 3);
title(["Transfer Function", "$\frac{a}{s+b}$"], 'fontsize', 3);
xs2png(gcf(), "Q1b.png");
// Part c
A = a:a:100 * a;
rise_time = ones(A) .* (rise_time_high - rise_time_low)
scf();
plot(A, rise_time);
xlabel("$a$", 'fontsize', 3);
ylabel("Rise Time", 'fontsize', 3);
title(["Transfer Function", "$\frac{a}{s+b}$"], 'fontsize', 3);
xs2png(gcf(), "Q1c.png");
// Part d
B = b:b:100 * b;
rise_time = (1./B) .* log(9);
scf();
plot(B, rise_time);
xlabel("$b$", 'fontsize', 3);
ylabel("Rise Time", 'fontsize', 3);
title(["Transfer Function", "$\frac{a}{s+b}$"], 'fontsize', 3);
xs2png(gcf(), "Q1d.png");
// -----------------------------------------------
// Question 2
G2 = 100 / (s^2 + 5*s + 100) // natural frequency = 10 rad/s, zeta = 0.25
S2 = syslin('c', G2);
t = 0:0.005:5
scf();
plot(t, csim('step', t, S2), 'LineWidth', 2);
xlabel("time",'fontsize', 3);
ylabel("Step Response",'fontsize', 3);
title(["Transfer Function", "$\frac{100}{s^2 + 5s + 100}$"], 'fontsize', 3)
xs2png(gcf(), "Q21.png");
zeta = 0:0.25:2;
wn = 10; 
scf();
plotcolors = ["scilabred4", "scilab blue2", "scilab green4", "scilab cyan4",...
"scilabmagenta4", "scilabbrown4", "scilabpink4", "black", "royalblue"];
for i=1:size(zeta, 2)
    G = wn^2 / (s^2 + 2 * zeta(i) * wn * s + wn^2);
    S = syslin('c', G);
    plot2d(t, csim('step', t, S), style=[color(plotcolors(i))]);
    xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
end
legend(["$\zeta = 0$", "$\zeta = 0.25$", "$\zeta = 0.5$", "$\zeta = 0.75$",...
"$\zeta = 1.0$", "$\zeta = 1.25$", "$\zeta = 1.5$", "$\zeta = 1.75$", "$\zeta = 2.0$"])
title(["Transfer Function", "$\frac{100}{s^2 + 20\zeta s + 100}$"], 'fontsize', 3);
xs2png(gcf(), "Q22.png");

// -----------------------------------------------
// Question 3
first_order = 12.5 / (s+12.5);
first_order_system = syslin('c', first_order);
second_order = 100 / (s^2 + 25 * s + 100);
second_order_system = syslin('c', second_order);
t = 0:0.01:10;
scf();
subplot(131),plot(t, csim('step', t, first_order_system));
title(["Transfer function", "$\frac{12.5}{s+12.5}$"], 'fontsize', 2);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
subplot(132),plot(t, csim('step', t, second_order_system));
title(["Transfer function", "$\frac{100}{s^2+25s+100}$"], 'fontsize', 2);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
second_order_new = 100 / (s + 10)^2;
second_order_new_system = syslin('c', second_order_new);
subplot(133),plot(t, csim('step', t, second_order_new_system));
title(["Transfer function", "$\frac{100}{(s+10)^2}$"], 'fontsize', 2);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
xs2png(gcf(), "Q3.png");
// -----------------------------------------------
// Question 4
// Part a
gs = 1/s;
Gs = syslin('c', gs);
scf();
plot(t, csim('step', t, Gs));
title(["Transfer function", "$\frac{1}{s}$"], 'fontsize', 4);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
xs2png(gcf(), "Q4a.png");
// Part b
z=poly(0,'z');
h=1/z;
sl=tf2ss(h);
u1=ones(1,10);
x=dsimul(sl,u1);  //Step response
scf();
plot(x, 'ro');
set(gca(),"data_bounds",[0,-1;10,2]);
xlabel("$n$", 'fontsize', 3);
ylabel("$y[n]$", 'fontsize', 3);
title(["Transfer Function", "$\frac{1}{z}$"], 'fontsize', 4);
xs2png(gcf(), "Q4b.png");
// Part c
ratio = 1 / s^2;
output = csim('step', t, ratio);
// -----------------------------------------------
// Question 5
t1 = 0:0.1:10; // tau = 0.1
t2 = 0:0.5:10; // tau = 0.5
t3 = 0:2:10;   // tau = 2
G1 = (s+5) / ((s+4)*(s+2));
S1 = syslin('c', G1);
G2 = (s+5)/(s+4);
S2 = syslin('c', G2);
G3 = 1/(s+2);
S3 = syslin('c', G3);
y1 = csim('step', t1, S1);
y21 = csim('step', t1, S2);
y22 = csim(y21, t1, S3);
y31 = csim('step', t1, S3);
y32 = csim(y31, t1, S2);
scf();
subplot(131),plot(t1, y1, 'r');
subplot(131),plot(t1, y22, 'b');
subplot(131),plot(t1, y32, 'g-*');
legend(["Direct", "Series #1", "Series #2"], 4);
title("$\tau = 0.1$", 'fontsize', 4);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
y1 = csim('step', t2, S1);
y21 = csim('step', t2, S2);
y22 = csim(y21, t2, S3);
y31 = csim('step', t2, S3);
y32 = csim(y31, t2, S2);
subplot(132),plot(t2, y1, 'r');
subplot(132),plot(t2, y22, 'b-.');
subplot(132),plot(t2, y32, 'g-*');
legend(["Direct", "Series #1", "Series #2"], 4);
title("$\tau = 0.5$", 'fontsize', 4);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
y1 = csim('step', t3, S1);
y21 = csim('step', t3, S2);
y22 = csim(y21, t3, S3);
y31 = csim('step', t3, S3);
y32 = csim(y31, t3, S2);
subplot(133),plot(t3, y1, 'r');
subplot(133),plot(t3, y22, 'b-.');
subplot(133),plot(t3, y32, 'g-*');
legend(["Direct", "Series #1", "Series #2"], 4);
title("$\tau = 2$", 'fontsize', 4);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
xs2png(gcf(), "Q5.png");
