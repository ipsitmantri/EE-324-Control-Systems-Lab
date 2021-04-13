clc; clear;
// --------------------
// Part a
s = poly(0, 's');
G = 85/(s^3+7*s^2+27*s+85);
sl = syslin('c', G);
[z, p, k] = tf2zp(sl);
disp(p);
// ignoring the farthest pole
G_approx = 17 / (s^2 + 2*s + 17);
sl_approx = syslin('c', G_approx);
t = 0:0.01:10;
scf();
plot(t, csim('step', t, sl), 'r', 'LineWidth', 2);
plot(t, csim('step', t, sl_approx), 'b', 'LineWidth', 2);
L = legend(["3rd order system", "2nd order approximation"]);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
xs2png(gcf(), "Q2a.png");
// ---------------------------------
// Part b
Gb = (s+0.01)/(s^3+(101/50)*s^2+(126/25)*s+0.1);
slb = syslin('c', Gb);
[z, p, k] = tf2zp(slb);
disp(p);
Gbb = 0.5 / (s^2 + 2*s + 5);
slbb = syslin("c", Gbb);
t = 0:0.01:200;
scf();
plot(t, csim('step', t, slb), 'r', 'LineWidth', 2);
plot(t, csim('step', t, slbb), 'b', 'LineWidth', 2);
L = legend(["3rd order system", "2nd order approximation"]);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
xs2png(gcf(), "Q2b.png");
