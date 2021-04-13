clear; clc;
// -------------------------------------------
// Question 1 //
s = poly(0, 's');
G1 = 10 / (s^2 + 2*s + 10);
G2 = 5 / (s + 5);
S1 = syslin('c', G1);
S2 = syslin('c', G2);
// -------------------------------------------
// Part a
TA = S1 * S2;
disp("Transfer Function for part a");
disp(TA);
// -------------------------------------------
// Part b 
TB = S1 + S2;
disp("Transfer Function for part b");
disp(TB);
// -------------------------------------------
// Part c 
TC = (S1) / (1 + (S1 * S2));
disp("Transfer Function for part c");
disp(TC);
// -------------------------------------------
// Part d 
t = 0:0.01:10;
scf();
plot(t, csim('step', t, S1));
xgrid(0);
title(["Step Response of the system with transfer function", "$G1(s)$"], 'fontsize', 4);
xlabel("$t$", 'fontsize', 3);
ylabel("$y(t)$", 'fontsize', 3)
// -------------------------------------------
// Question 2 //
// Part a
[za, pa, ga] = tf2zp(TA);
disp('Zeros of Part a');
disp(za);
disp('Poles of Part a');
disp(pa);
scf();
plzr(TA);
xgrid(0);
title("Poles and Zeros of the system in part (a)", 'fontsize', 4);
xlabel("Real Axis",'fontsize', 3);
ylabel("Imaginary Axis",'fontsize', 3);
// -------------------------------------------
// Part b
[zb, pb, gb] = tf2zp(TB);
disp('Zeros of Part b');
disp(zb);
disp('Poles of Part b');
disp(pb);
scf();
plzr(TB);
xgrid(0);
title("Poles and Zeros of the system in part (b)", 'fontsize', 4);
xlabel("Real Axis",'fontsize', 3);
ylabel("Imaginary Axis",'fontsize', 3);
// -------------------------------------------
// Part c
[zc, pc, gc] = tf2zp(TC);
disp('Zeros of Part c');
disp(zc);
disp('Poles of Part c');
disp(pc);
scf();
plzr(TC);
xgrid(0);
title("Poles and Zeros of the system in part (c)", 'fontsize', 4);
xlabel("Real Axis",'fontsize', 3);
ylabel("Imaginary Axis",'fontsize', 3);
// -------------------------------------------
// Matrices Task //
A = [s 1/s (s+1)/(s-1); 1 s^3 0; 1+s^2 2*s 1];
B = [1 2 1; 1 s 9; -1 0 1];
disp('A+B');
disp(A+B);
disp('A x B');
disp(A * B);
disp("det(A)");
disp(det(A));
// -------------------------------------------
// Question 3 //
Z = [1+(2*(s+1)^2) -1 -(s+1)^2; -1 (s+2)^2 -2*(s+1); -(s+1)^2 -2*(s+1) (s^2+7*s+7)];
V = [0 0 (1+s)];
T = V * inv(Z);
disp(T);
