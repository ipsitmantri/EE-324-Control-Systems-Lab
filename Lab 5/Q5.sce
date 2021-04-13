clc; clear;
//-----------------
// Question 5
s = poly(0, 's');
g = 100 / ((s+1) * (s+2) * (s+50));
G = syslin('c', g);
g1 = 2 / ((s+1) * (s+2));
G1 = syslin('c', g1);
scf();
evans(G1);
scf();
evans(G);
K = 0.1:0.1:2;
t = 0:0.01:10
plotcolors = ["scilabred4", "scilab blue2", "scilab green4", "scilab cyan4",...
"scilabmagenta4", "scilabbrown4", "scilabpink4", "black", "royalblue","gold",...
"dodgerblue1", "palevioletred", "hotpink1", "royalblue4", "turquoise4", ...
"darkgoldenrod4", "rosybrown2", "indianred2", "tan1", "magenta1"];
scf();
for i=1:size(K, 2)
    k = K(i);
    G = syslin('c', k*g);
    G1 = syslin('c', k*g1);
    T = G /. syslin('c', 1, 1);
    T1 = G1 /. syslin('c', 1, 1);
    xset("thickness",2);
    plot2d(t, csim('step', t, T - T1), style=[color(plotcolors(i))]);
    xgrid;    
end
xlabel("$t$", 'fontsize', 3);
ylabel("Step response", 'fontsize', 3);
title(["Difference in unity gain negative feedback for ", "$\frac{100}{(s+1)(s+2)(s+50)}$",",", "$\frac{2}{(s+1)(s+2)}$"], "fontsize", 3);
L = legend(["$K = 0.1$","$K = 0.2$","$K = 0.3$","$K = 0.4$",...
"$K = 0.5$","$K = 0.6$","$K = 0.7$","$K = 0.8$","$K = 0.9$","$K = 1$","$K = 1.1$"...
,"$K = 1.2$","$K = 1.3$","$K = 1.4$","$K = 1.5$","$K = 1.6$","$K = 1.7$","$K = 1.8$"...
,"$K = 1.9$","$K = 2$"]);
L.font_size = 3;
