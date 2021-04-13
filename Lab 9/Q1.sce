clc; clear;
s = poly(0, 's');
g = (10/s) / ((1+s/5) * (1+s/20));
G = syslin('c', g);
scf();
nyquist(G, 0.1, 500);
title("$G(s) = \frac{10}{s(0.2s+1)(0.05s+1)}$", 'fontsize', 3);
disp(sprintf("The gain margin of G(s) is %.8f", g_margin(G)));
disp(sprintf("The phase margin of G(s) is %.8f", p_margin(G)));
lag_comp = (s+3) / (s+1);
g1 = g * lag_comp;
G1 = syslin('c', g1);
scf();
nyquist(G1, 0.1, 500);
title("$G(s) = \frac{10(s+3)}{s(0.2s+1)(0.05s+1)(s+1)}$", 'fontsize', 3);
disp(sprintf("The gain margin of G(s) with lag compensator is %.8f", g_margin(G1)));
disp(sprintf("The phase margin of G(s) with lag compensator is %.8f", p_margin(G1)));
lead_comp = (s+1) / (s+3);
g2 = g * lead_comp;
G2 = syslin('c', g2);
scf();
nyquist(G2, 0.1, 500);
title("$G(s) = \frac{10(s+1)}{s(0.2s+1)(0.05s+1)(s+3)}$", 'fontsize', 3);
disp(sprintf("The gain margin of G(s) with lead compensator is %.8f", g_margin(G2)));
disp(sprintf("The phase margin of G(s) with lead compensator is %.8f", p_margin(G2)));
