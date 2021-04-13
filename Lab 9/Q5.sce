clc; clear;
s = poly(0, 's');
g = (10*s + 2000) / (s^3 + 202*s^2 + 490*s + 18001);
G = syslin('c', g);
scf();
show_margins(G, 'bode');
K = 9 * 18001 / 2000;
g1 = K*g;
G1 = syslin('c', g1);
disp(sprintf("The proportional added to get sse of 10%s = %.4f",'%', K));
[gm, fg] = g_margin(G1);
[phm, fp] = p_margin(G1);
disp(sprintf("The gain margin of G1(s) is %.8f", gm));
disp(sprintf("The phase margin of G1(s) is %.8f at crossover frequency %.8f Hz",... 
phm, fp));
g2 = g1 * (s+1);
G2 = syslin('c', g2);
[gm2, fg2] = g_margin(G2);
[phm2, fp2] = p_margin(G2);
disp(sprintf("The gain margin of G2(s) is %.8f", gm2));
disp(sprintf("The phase margin of G2(s) is %.8f at crossover frequency %.8f Hz",...
phm2, fp2));
G2_cl = G2 /. syslin('c', 1, 1);
[z, p, k] = tf2zp(G2_cl);
disp(p);
scf();
show_margins(G2);
