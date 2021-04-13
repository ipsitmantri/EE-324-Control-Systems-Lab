clc; clear;
s = poly(0, 's');
ratio = 20;
//-----------------
// Part a
g = 1 / (s^2 + 3*s + 2);
slope = %pi / log(10);
G = syslin('c', g);
scf();
evans(G, 1000);
x = -10:0.0001:0;
y = -slope * x;
plot(x, y, 'r-', 'LineWidth', 2);
K = 4.437; // constant gain for 10% OS
disp("K for 10 % OS = ");
disp(K);
//-------------------
// Part b
sse_original = 1 / (1 + K * 0.5);
disp("Original Steady State Error = ");
disp(sse_original);
// choose pole very close to origin
pole = 0.0001;
zero = ratio * pole;
g_lag_comp = (s + zero) * g / (s + pole);
G_lag_comp = syslin('c', g_lag_comp);
scf();
evans(G_lag_comp, 1000);
sse_lag_comp = 1 / (1 + (K * 20 * 0.5));
disp("New Steady State Error = ");
disp(sse_lag_comp);
//-------------------
// Part c
Poles = [0.0001, 0.01, 1, 10, 20];
for i=1:size(Poles, 2)
    pole = Poles(i);
    zero = pole * ratio;
    g_lag_comp = (s + zero) * g / (s + pole);
    G_lag_comp = syslin('c', g_lag_comp);
    scf();
    evans(G_lag_comp, 2000);
    plot(x, y, 'r-', 'LineWidth', 2);
    title(sprintf("pole at -%.4f, zero at -%.4f", pole, zero));
end
