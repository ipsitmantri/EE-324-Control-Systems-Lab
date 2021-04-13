clc; clear;
//-----------------
// Question 1
// Part a
s = poly(0, 's');
Ga = 1/(s^3 + 4*s^2 + 5*s);
Ga = syslin('c', Ga);
scf();
evans(Ga, 30);
//-----------------
// Part b
Gb = (s+1) / (s^2 * (s + 3.6));
Gb = syslin('c', Gb);
scf();
evans(Gb, 80);
//-----------------
// Part c
Gc = (s+0.4) / (s^2 * (s + 3.6));
Gc = syslin('c', Gc);
scf();
evans(Gc, 50);
//-----------------
// Part d
P = [-5, -2, -1, 0, 1, 2, 3, 4, 5];
scf();
for i=1:size(P, 2)
    p = P(i);
    Gd = (s + p) / (s * (s+1) * (s+2));
    Gd = syslin('c', Gd);
    evans(Gd, 200);
end
title(["Locus of closed loop poles of", "$\frac{s+p}{s(s+1)(s+2)}$", ",",...
"$p \in \{-5,-2,-1,0,1,2,3,4,5\}$"], "fontsize", 3);
