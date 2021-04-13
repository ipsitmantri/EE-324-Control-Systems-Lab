clc; clear;
// --------------------
// Part a
s = poly(0, 's');
A = -1:0.01:1;
scf();
for i=1:size(A, 2)
    a = A(i);
    [N, D] = simp(s + 5 + a, s^2 + 11*s + 30);
    sla = syslin('c', N, D);
    t=0:0.05:10;
    plot(t, csim('step', t, sla), color('blue'), 'LineWidth', 2);
    xlabel("$t$", 'fontsize', 3);
    ylabel("$c(t)$", 'fontsize', 3);
    title("$G(s) = \frac{s + 5 + a}{s^2 + 11s + 30}$", "fontsize", 4);
end
xs2png(gcf(), "Q1a.png");
// --------------------
// Part b
G = 1 / (s^2 - s - 6);
slb = syslin('c', G);
t=0:0.05:10;
scf();
plot(t, csim('step', t, slb), color('blue'), 'LineWidth', 2);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title("$G(s) = \frac{1}{s^2 -s -6}$", "fontsize", 4);
xs2png(gcf(), "Q1b1.png");
// After adding a zero, 
G1 = 1 / (s + 2);
slbb = syslin('c', G1);
scf();
plot(t, csim('step', t, slbb), color('blue'), 'LineWidth', 2);
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title("$G(s) = \frac{1}{s+2}$", "fontsize", 4);
xs2png(gcf(), "Q1b2.png");
// Perturbing the zero
A = -0.05:0.01:0.05;
plotcolors = ["scilabred4", "scilab blue2", "scilab green4", "scilab cyan4",...
"scilabmagenta4", "scilabbrown4", "scilabpink4", "black", "royalblue","gold",...
"dodgerblue1"];
scf();
for i=1:size(A, 2)
    a = A(i);
    [N, D] = simp(s - 3 + a, s^2 - s - 6);
    slbbb = syslin('c', N, D);
    t=0:0.01:10;
    xset("thickness",2);plot2d(t, csim('step', t, slbbb), style=[color(plotcolors(i))]);
    xlabel("$t$", 'fontsize', 3);
    ylabel("$c(t)$", 'fontsize', 3);
    title("$G(s) = \frac{s - 3 + a}{s^2 - s - 6}$", "fontsize", 4);
end
h = gca();
h.data_bounds = [0, 0; 10, 0.8];
L = legend(["$a = -0.05$","$a = -0.04$","$a = -0.03$","$a = -0.02$","$a = -0.01$",...
"$a = 0$","$a = 0.01$","$a = 0.02$","$a = 0.03$","$a = 0.04$","$a = 0.05$"]);
L.font_size = 3;
xs2png(gcf(), "Q1b3.png");
