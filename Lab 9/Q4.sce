clc; clear;
s = poly(0, 's');
g = 1 / (s^3 + 3*s^2 + 2*s);
G = syslin('c', g);
Kr = kpure(G);
gmr = 20 * log(Kr) / log(10);
disp(sprintf("Gain margin using root locus = %.8f dB", gmr));
scf();
evans(G, 10);
sgrid;
scf();
show_margins(G, 'bode');
bode_asymp(G);
scf();
nyquist(G,  0.1, 100);
