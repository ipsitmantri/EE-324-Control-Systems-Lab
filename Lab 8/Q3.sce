clc; clear;
s = poly(0, 's');
//---------------------
// Part a
p1 = -1;
p2 = %i;
p3 = -%i;
p4 = 2*%i;
p5 = -2*%i;
g = 1 / ((s-p1)*(s-p2)*(s-p3)*(s-p4)*(s-p5));
G = syslin('c', g);
scf();
evans(G, 1000);
xgrid();
//----------------------
// Part b
shift = 5;
g_shifted = 1 / ((s-p1 +shift)*(s-p2 +shift)*(s-p3 +shift)*(s-p4 +shift)...
*(s-p5 +shift));
G_shifted = syslin('c', g_shifted);
scf();
evans(G_shifted, 10000);
xgrid();
scf();
bode(G_shifted);
//-----------------------------------------------------------
// Part c
z1 = 10*2*%pi;
g_new = g_shifted * (s + z1)^4;
G_new = syslin('c', g_new);
scf();
bode(G_new);
title(["After adding 4 zeros at", "$-20\pi$"], 'fontsize', 3);
//------------------------------------------------------------
// Part d
scf();
evans(G_new, 9000);
xgrid();
h = gca(); // get current axes
h.data_bounds = [-350, -200 ; 1, 200];
