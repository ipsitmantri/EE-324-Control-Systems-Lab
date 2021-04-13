clc; clear;
function [rise_time] = Tr(t, sl, flag)
    outputs = csim('step', t, sl);
    ss_val = mean(outputs(size(outputs, 2)-200:size(outputs, 2)));
    if flag then
        ss_val = 1;
    end
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
endfunction
//-----------------
// Question 3
s = poly(0, 's');
G = 1/(s*(s^2 + 3*s + 5));
K = 0.01:0.01:kpure(G);
t = 0:0.01:20;
scf();
candidates = [];
for i=1:size(K, 2)
    k = K(i);
    T = syslin('c', k*G);
    T = T /. syslin('c', 1, 1);
    tr = Tr(t, T, %f);
    if i == size(K, 2)
        tr = Tr(t, T, %t);
    end
    plot(k, tr, 'b.', 'LineWidth', 0.25);
    if tr == 1.5
        candidates = [candidates, k];
    end
end
xlabel("$K_p$", 'fontsize', 3);
ylabel("Rise Time in seconds", 'fontsize', 3);
title(["Rise time vs ", "$K_p$", "for unity negative feedback system of the plant",...
"$\frac{1}{s(s^2 + 3s + 5)}$"], "fontsize", 3);
disp("Kp for rise time = 1.5s");
disp(candidates(1));
k_critical = kpure(G);
T = syslin('c', k_critical*G);
T = T /. syslin('c', 1, 1);
min_tr = Tr(t, T, %t);
disp("Minimum rise time for stable closed-loop");
disp(min_tr);
