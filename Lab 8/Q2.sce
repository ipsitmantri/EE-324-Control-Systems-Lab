clc; clear;
s = poly(0, 's');
K2 = [0.001, 0.01, 0.1, 1, 10, 20];
K1 = 5 * K2;
t = 0:0.01:10;
plotcolors = ["scilabred4", "scilab blue2", "scilab green4","scilabmagenta4", "black", "royalblue"];
scf();
for i=1:size(K2, 2)
    k2 = K2(i);
    k1 = K1(i);
    g = (s + k1) / (s + k2);
    G = syslin('c', g);
    plot2d(t, csim('step', t, G), style=[color(plotcolors(i))]);
    e = gce();
    e.children.thickness = 2.5;
    xgrid(5); 
end
xlabel("$t$", 'fontsize', 3);
ylabel("Step Response", 'fontsize', 3);
title(["Step Response of", "$\frac{s+K_1}{s+K_2}$", "as",...
"$\frac{K_1}{K_2} = 5$", "and varying them"], "fontsize", 3);
L = legend(["$K_2 = 0.001$", "$K_2 = 0.01$", "$K_2 = 0.1$", "$K_2 = 1$",...
"$K_2 = 10$", "$K_2 = 20$"]);
L.font_size = 3;
// ----------------------------
// Part b
t = 0:0.01:1;
scf();
for i=1:size(K2, 2)
    k2 = K2(i);
    k1 = K1(i);
    g = (s + k1) / (s + k2);
    G = syslin('c', g);
    plot2d(t, csim('impuls', t, G), style=[color(plotcolors(i))]);
    e = gce();
    e.children.thickness = 2.5;
    xgrid(5); 
end
xlabel("$t$", 'fontsize', 3);
ylabel("Impulse Response", 'fontsize', 3);
title(["Impulse Response of", "$\frac{s+K_1}{s+K_2}$", "as",...
"$\frac{K_1}{K_2} = 5$", "and varying them"], "fontsize", 3);
L = legend(["$K_2 = 0.001$", "$K_2 = 0.01$", "$K_2 = 0.1$", "$K_2 = 1$",...
"$K_2 = 10$", "$K_2 = 20$"]);
L.font_size = 3;
h = gca(); // get current axes
h.data_bounds = [0, -0.8 ; 1, 90];

