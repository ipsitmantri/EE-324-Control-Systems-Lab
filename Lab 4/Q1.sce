clc; clear; 
//-----------------
// Question 1
// Part a
s = poly(0, 's');
G1 = 1/s^2;
G2 = (50 * s) / (s^2 + s + 100);
G3 = s - 2;
G4 = 1;
S1 = syslin('c', G1);
S2 = syslin('c', G2);
S3 = syslin('c', G3, 1);
S4 = syslin('c', G4, 1);
Cs = (S1 * S2 * S3)/.S4;
disp("Transfer function of part a");
disp(Cs);
disp("==================================================");
// ----------------------------------------------------------
// Part b
G1 = s;
S1 = syslin('c', G1, 1);
S2 = S1 * S1;
G2 = 1/s;
S3 = syslin('c', G2);
S4 = S2 + S3;
S5 = S4 /. syslin('c', 1, 1);
Cs = (S5 * syslin('c', G2))/. syslin('c', s, 1);
disp("Transfer function of part b");
disp(Cs);
disp("==================================================");
// ----------------------------------------------------------
// Part c
G1 = (3*s^2) / (1 + s) + 2 * s;
S1 = syslin('c', G1);
G2 = 1 / (s + 2);
S2 = syslin('c', G2);
S3 = S2 /. (syslin('c', 4, 1));
S4 = S3 * S1;
Cs = S4 /. syslin('c', 1, 1);
disp("Transfer function of part c");
disp(Cs);
disp("==================================================");
