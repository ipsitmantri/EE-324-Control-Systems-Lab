clc; clear;
//-----------------
// Question 4
s = poly(0, 's');
g = 0.11 * (s+0.6) / (6*s^2 + 3.6127*s +0.0572);
G = syslin('c', g);
scf();
evans(G, 70);
scf();
t = 0:0.01:10;
k = 85.8;
plot(t, csim('step', t, (k*G)/.syslin('c', 1, 1)));
K = -1:0.01:-0.1;
for i=1:size(K, 2)
    k = K(i);
    gg = g * k;
    G = syslin('c', gg);
    T = G /. syslin('c', 1, 1);
    [z, p, _p] = tf2zp(T);
    x = real(p);
    if abs(x(1)) <= 1e-4 || abs(x(2)) <= 1e-4
        disp("K at jw crossing");
        disp(k);
    end
end
