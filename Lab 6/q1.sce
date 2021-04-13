clc; clear;
s = poly(0, 's');
g = 1 / ((s+3)*(s+4)*(s+12));
G = syslin('c', g);
//---------------------------
// Part a
Ka = ((1/0.489)-1)*144;
disp("K for SSE of 0.489 = ");
disp(Ka);
//---------------------------
// Part b
scf();
evans(G, 700);
x = -2.3:0.00001:0;
ratio = sqrt(1-0.35^2) / 0.35;
y = -ratio .* x;
plot(x, y, 'r-', 'LineWidth', 1);
L = legend(['open-loop poles', 'asymptotes', 'branch 3', 'branch 2', 'branch 1',... 
"$\zeta = 0.35$"]);
L.font_size = 3;
L.legend_location = "in_upper_left";
title(["Designing P controller for a damping ratio of 0.35"], 'fontsize', 3);
poi = 2.061 + %i*5.516; // from the root locus
Kb = 371.9; // from the root locus
disp("K for damping ratio of 0.35 = ");
disp(Kb);
// ------------------------
// Part c
Kc = 2.127 // from the root locus
disp("Gain value at the break away point");
disp(Kc);
scf();
evans(G, 700);
// ------------------------
// Part d
K = %eps:0.1:1;
t = 0:0.001:10;
errs = [];
scf();
for i=1:size(K, 2)
    k = K(i);
    G = syslin('c', k*g);
    T = G /. syslin('c', 1, 1);
    xset("thickness", 2);
    plot(t, csim('step', t, T));
    xgrid;
    sse = 1 / (1 + k / (3 * 4 * 12));
    errs = [errs, sse];
end
xlabel("$t$", 'fontsize', 3);
ylabel("Step response", 'fontsize', 3);
title(["Unity gain negative feedback for ", "$\frac{K}{(s+3)(s+4)(s+12)}$"],...
"fontsize", 3);
scf();
evans(syslin('c', g), 1);
scf();
plot(K, errs, 'b-', 'LineWidth', 2);
xlabel("$K$", "fontsize", 3);
ylabel("Steady State Error");
title(["Unity gain negative feedback for ", "$\frac{K}{(s+3)(s+4)(s+12)}$"],...
"fontsize", 3);
// --------------------------------
// Part e
K = 1:50:1000;
t = 0:0.001:10;
errs = [];
scf();
for i=1:size(K, 2)
    k = K(i);
    G = syslin('c', k*g);
    T = G /. syslin('c', 1, 1);
    xset("thickness", 2);
    plot(t, csim('step', t, T));
    xgrid;    
    sse = 1 / (1 + k / (3 * 4 * 12));
    errs = [errs, sse];
end
xlabel("$t$", 'fontsize', 3);
ylabel("Step response", 'fontsize', 3);
title(["Unity gain negative feedback for ", "$\frac{K}{(s+3)(s+4)(s+12)}$"],...
"fontsize", 3);
scf();
evans(syslin('c', g), 1000);
scf();
plot(K, errs, 'b-', 'LineWidth', 2);
xlabel("$K$", "fontsize", 3);
ylabel("Steady State Error");
title(["Unity gain negative feedback for ", "$\frac{K}{(s+3)(s+4)(s+12)}$"],...
"fontsize", 3);
