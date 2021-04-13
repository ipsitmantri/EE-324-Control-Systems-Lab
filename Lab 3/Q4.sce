clc; clear;
function [rise_time, pos, peak_t, delay_t, settling_t] = stepinfo(t, sl)
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
    peak_t = t(find(outputs == max(outputs))(1));
    delay_t = 0
    for i=1:size(outputs, 2)
        if(outputs(i) - 0.5 * ss_val>= 5*1e-4)
            delay_t = t(i);
            break;
            end
    end
    for i=1:size(outputs, 2)
        if(outputs(size(outputs, 2) - i + 1) - 0.98 * ss_val<= 5*1e-4)
            settling_t = t(size(outputs, 2) - i + 1);
            break;
            end
    end
    
endfunction
// -----------------------
// Part a
s = poly(0, 's');
// undamped
G_un = 1 / (s^2 + 1);
s_un = syslin('c', G_un);
// underdamped
G_under = 1 / (s^2 + s + 1); // zeta = 0.5
s_under = syslin("c", G_under);
// overdamped
G_over = 1 / (s^2 + 4*s + 1); // zeta = 2
s_over = syslin("c", G_over);
t = 0:0.0001:20;
scf();
plot(t, csim("step", t, s_un), 'r', 'LineWidth', 2);
plot(t, csim("step", t, s_under), 'k', 'LineWidth', 2);
plot(t, csim("step", t, s_over), 'b', 'LineWidth', 2);
L = legend(["$\text{Undamped, } \frac{1}{s^2 + 1}$",...
"$\text{Underdamped, }\frac{1}{s^2 + s + 1}$", "$\text{Overdamped, }\frac{1}{s^2 + 4s + 1}$"]);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title("Step Response of undamped, underdamped and overdamped", "fontsize", 3);
xs2png(gcf(), "Q4a.png");
[rise_time, pos, peak_t, delay_t, settling_t] = stepinfo(t, s_under);
disp("Underdamped System");
disp("Rise Time");
disp(rise_time);
disp("%OS");
disp(pos);
disp("Peak Time");
disp(peak_t);
disp("Delay Time");
disp(delay_t);
disp("2% Settling Time");
disp(settling_t);
[rise_time, pos, peak_t, delay_t, settling_t] = stepinfo(t, s_over);
disp("Overdamped System");
disp("Rise Time");
disp(rise_time);
disp("%OS");
disp(pos);
disp("Peak Time");
disp(peak_t);
disp("Delay Time");
disp(delay_t);
disp("2% Settling Time");
disp(settling_t);
// --------------------
// Part b
wn = 1:2:9;
plotcolors = ["scilabred4", "scilab blue2", "scilab green4", "scilab cyan4",...
"scilabmagenta4"];
scf();
for i=1:size(wn, 2)
    w = wn(i);
    G = w^2 / (s^2 + w * s + w^2);
    sl = syslin("c", G);
    t = 0:0.0001:20;
    plot2d(t, csim('step', t, sl), style=[color(plotcolors(i))]);
    [rise_time, pos, peak_t, delay_t, settling_t] = stepinfo(t, sl);
    mprintf("Underdamped System %d\n", i);
    disp("Rise Time");
    disp(rise_time);
    disp("%OS");
    disp(pos);
    disp("Peak Time");
    disp(peak_t);
    disp("2% Settling Time");
    disp(settling_t);
end
L = legend(["$\omega_n = 1$", "$\omega_n = 3$", "$\omega_n = 5$", ...
"$\omega_n = 7$", "$\omega_n = 9$"], 4);
L.font_size = 2;
xlabel("$t$", 'fontsize', 3);
ylabel("$c(t)$", 'fontsize', 3);
title(["Step Response with", "$\zeta = 0.5$", "and varying", "$\omega_n$"], "fontsize", 3);
xs2png(gcf(), "Q4b.png");

//---------------------------
