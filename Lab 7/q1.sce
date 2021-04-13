clc; clear;
s = poly(0, 's');
g = 1 / ((s+3)*(s+4)*(s+12));
G = syslin('c', g);
//---------------------------
// Part a
zeta = 0.2;
slope = sqrt(1 - zeta^2) / zeta;
x = -2:0.001:0;
y = -slope * x;
z = 0.01;
ga = g * (s + z) / s;
Ga = syslin('c', ga);
scf();
evans(Ga, 1000);
plot(x, y, 'c-', 'LineWidth', 2);
L = legend(['open-loop zeroes', 'open-loop poles', 'asymptotes', 'branch 3', 'branch 2', 'branch 1', "$\zeta = 0.2$"]);
L.font_size = 3;
L.legend_location = "in_upper_left";
title(["Designing PI controller for a damping ratio of 0.2"], 'fontsize', 3);
poi = -1.416 + %i*6.935; // from the root locus
Ka = 666.3; // from the root locus
disp("K for damping ratio of 0.2 = ");
disp(Ka);
//---------------------------
// Part b
y = -8:0.01:8;
x = -sqrt(64 - y^2);
gb = g * (s + z) / s;
Gb = syslin('c', gb);
scf();
evans(Gb, 2000);
plot(x, y, 'c-', 'LineWidth', 2);
L = legend(['open-loop zeroes', 'open-loop poles', 'asymptotes', 'branch 3', 'branch 2', 'branch 1', "$\omega_n = 8$"]);
L.font_size = 3;
L.legend_location = "in_upper_left";
title(["Designing PI controller for a undamped frequency of 8 rad/s"], 'fontsize', 3);
Kb1 = 953.4; // from the root locus
disp("K for undamped natural frequency = 8 rad/s");
disp(Kb1);
y = -9:0.01:9;
x = -sqrt(81 - y^2);
scf();
evans(Gb, 2000);
plot(x, y, 'c-', 'LineWidth', 2);
L = legend(['open-loop zeroes', 'open-loop poles', 'asymptotes', 'branch 3', 'branch 2', 'branch 1', "$\omega_n = 9$"]);
L.font_size = 3;
L.legend_location = "in_upper_left";
title(["Designing PI controller for a undamped frequency of 8 rad/s"], 'fontsize', 3);
Kb2 = 1329; // from the root locus
disp("K for undamped natural frequency = 9 rad/s");
disp(Kb2);
//---------------------------
// Part c
Z = [0.001, 0.01, 0.5, 1, 2, 3.5, 10, 15];
for i=1:size(Z, 2)
    z = Z(i);
    gc = g * (s + z) / s;
    Gc = syslin('c', gc);
    scf();
    evans(Gc, 10000);
    title([sprintf("z = %0.3f", z)], 'fontsize', 3)
end
