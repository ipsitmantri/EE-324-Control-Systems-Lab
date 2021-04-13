function [rise_time, pos] = TrnPos(t, sl)
    outputs = csim('step', t, sl);
    ss_val = outputs(size(outputs, 2));
    peak_val = max(outputs);
    for i=1:size(outputs, 2)
        if(abs(0.1 * ss_val - outputs(i)<= 1e-4))
            rise_time_low = t(i);
            break;
            end
    end
    for i=1:size(outputs, 2)
        if(abs(0.9 * ss_val - outputs(i)<= 1e-4))
            rise_time_high = t(i);
            break;
            end
    end
    rise_time = rise_time_high - rise_time_low;
    pos = (peak_val - ss_val) / ss_val * 100;
endfunction
