clc; clear; 
//-----------------
// Question 2
// Part a
s = poly(0, 's');
G = 10 / (s* (s+2) * (s+4));
Gs = syslin('c', G);
K = 10;
Cs = K * Gs /. syslin('c', 1, 1);
disp("Transfer function for K = 10");
disp(Cs);
disp("==================================================");
// Part b
K = 0:0.1:100;
scf();
for i=1:size(K, 2)
    k = K(i);
    Cs = k * Gs /. syslin('c', 1, 1);
    [z, p, _p] = tf2zp(Cs);
    plot(real(p), imag(p), 'b*', 'LineWidth', 2);
end
xlabel("Real Axis", 'fontsize', 3);
ylabel("Imaginary Axis", 'fontsize', 3);
title(["Locus of poles of", "$\frac{10K}{10K + 8s + 6s^2 + s^3}$"], "fontsize", 4);
xs2png(gcf(), "Q2b.png");
// ------------------------
// Part c
K_critical = -1;
for i=1:size(K, 2)
    k = K(i);
    Cs = k * Gs /. syslin('c', 1, 1);
    [z, p, _p] = tf2zp(Cs);
    rp = real(p);
    if rp(1) > 0 || rp(2) > 0 || rp(3) > 0
        K_critical = k;
        break;
    end
end
disp("Estimated Critical Value of K");
disp(K_critical);
// ------------------------
// Part d
