clc; clear;
s = poly(0, 's');
g = 1 / (s * (s^2 + 4*s + 8));
// ----------------------------
// Part a
K = 0:0.01:100;
k_req = 0;
gms = [];
pms = [];
for i=1:size(K, 2)
    k = K(i);
    tf = 1 + k * g;
    T = syslin('c', tf);
    gm = g_margin(T);
    pm = p_margin(T);
    gms = [gms, gm];
    pms = [pms, pm];
    if abs(gm - pm) <= 1e-8 then
        k_req = k;
     end
end
scf();
plot(K, gms, 'r-', 'LineWidth', 2);
plot(K(2:size(K, 2)), pms, 'b-', 'LineWidth', 2);
xgrid();
xlabel("$K$", 'fontsize', 3);
ylabel("Gain/Phase Margins", 'fontsize', 3);
title(["Variation of Gain and Phase Margin with", "$K$", "for",...
"$1 +\frac{K}{s(s^2 + 4s + 8)}$"], "fontsize", 3);
L = legend(["Gain Margin in dB", "Phase margin in degrees"]);
L.font_size = 3;
disp(sprintf("The value of K for which the gain and the phase margins become zero is %.4f",k_req));
// -----------------------------------
// Part c
tf = 1 + (k_req * g);
T = syslin('c', tf);
[z, p, g] = tf2zp(T);
disp("The closed loop poles at K = 64 are");
disp(z);
