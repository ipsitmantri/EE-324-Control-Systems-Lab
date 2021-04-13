clc; clear;
//-----------------
// Question 2
// Part a
s = poly(0, 's');
Ga = (s^3 - 1) / (s^3 + 1);
Ga = syslin('c', Ga);
scf();
evans(Ga, 30);
//-----------------
// Part b
Gb = (s^5 - 1) / (s^5 + 1);
Gb = syslin('c', Gb);
scf();
evans(Gb, 30);
//-----------------
// Part c
Gc = 1 / (s + 1);
Gc = syslin('c', Gc);
scf();
evans(Gc, 50);
//-----------------
// Part d
Gd = 1 / (s^4 - 13*s^2 + 36);
Gd1 = 1 / (s^4 + 13*s^2 + 36);
Gd1 = syslin('c', Gd1);
Gd2 = 1 / ((s-5)^4 + 13*(s-5)^2 + 36);
Gd2 = syslin('c', Gd2);
scf();
evans(Gd2, 100);
