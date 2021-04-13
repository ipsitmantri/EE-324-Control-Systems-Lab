clc; clear;
function [rise_time, pos] = TrnPos(t, sl)
    outputs = csim('step', t, sl);
    ss_val = outputs(size(outputs, 2));
    peak_val = max(outputs);
    rise_time_low = 0;
    rise_time_high = 0;
    for i=1:size(outputs, 2)
        if(outputs(i) - (0.1 * ss_val)>= 5*1e-4)
            rise_time_low = t(i);
            break;
            end
    end
    for i=1:size(outputs, 2)
        if(outputs(i) - 0.9 * ss_val>= 5*1e-4)
            rise_time_high = t(i);
            break;
            end
    end
    rise_time = rise_time_high - rise_time_low;
    pos = (peak_val - ss_val) / ss_val * 100;
endfunction

// --------------------
// Part a
s = poly(0, 's');
G = 9 / (s^2 + 2*s + 9);
sl = syslin('c', G);
[z, p, k] = tf2zp(sl);
disp("Poles");
disp(p);
G1 = (s + 10) * G;
sl_zero = syslin('c', G1);
t = 0:0.01:10;
scf();
plot(t, csim('step', t, sl), 'r', 'LineWidth', 2);
plot(t, csim('step', t, sl_zero), 'b', 'LineWidth', 2);
L = legend(["$\frac{9}{s^2 + 2s+9}$", "$\frac{9(s+10)}{s^2 + 2s+9}$"]);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title("Step Response with and without a zero", "fontsize", 3);
xs2png(gcf(), "Q3a.png");
[tr, pos] = TrnPos(t, sl);
[tr1, pos1] = TrnPos(t, sl_zero);
disp("Original System");
disp("Rise Time");
disp(tr);
disp("% OS");
disp(pos);
disp("System with zero");
disp("Rise Time");
disp(tr1);
disp("% OS");
disp(pos1);
// --------------------
// Part b
Gb = G / (s + 1);
slb = syslin('c', Gb);
Gbb = G / (s + 10);
slbb = syslin('c', Gbb);
t = 0:0.01:20;
scf();
plot(t, csim('step', t, sl), 'r', 'LineWidth', 2);
plot(t, csim('step', t, slb), 'k', 'LineWidth', 2);
plot(t, csim('step', t, slbb), 'b', 'LineWidth', 2);
L = legend(["$\frac{9}{s^2 + 2s+9}$", "$\frac{9}{(s+1)(s^2 + 2s+9)}$",...
"$\frac{9}{(s+10)(s^2 + 2s+9)}$"], 4);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title("Step Response with and without additional poles", "fontsize", 3);
xs2png(gcf(), "Q3b.png");
[tr, pos] = TrnPos(t, slb);
[tr1, pos1] = TrnPos(t, slbb);
disp("System with pole at -1");
disp("Rise Time");
disp(tr);
disp("% OS");
disp(pos);
disp("System with pole at -10");
disp("Rise Time");
disp(tr1);
disp("% OS");
disp(pos1);
