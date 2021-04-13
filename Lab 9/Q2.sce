clc; clear;
s = poly(0, 's');
g = ((s^2+100*%pi*%pi*100)/(s^2 + 2*1*s + (100*%pi)^2));
G = syslin('c', g);
scf();
bode(G, 1, 100);
title(["Notch filter that rejects 50Hz", "$\frac{s^2 + (100\pi)^2}{s^2 + 2s + (100\pi)^2}$"], 'fontsize', 3);
K = 1:20:100;
tfs = [];
labels = [];
for i=1:size(K, 2)
    k = K(i);
    g = ((s^2+100*%pi*%pi*100)/(s^2 + 2*k*s + (100*%pi)^2));
    G = syslin('c', g);
    tfs = [tfs; G];
    str = sprintf("$K = %d$", k);
    labels = [labels; str];
//    gainplot(G, 1, 100, 'r-');
end
scf();
gainplot(tfs, 10, 1000, labels);
title(["Notch filter that rejects 50Hz", "$\frac{s^2 + (100\pi)^2}{s^2 + 2Ks + (100\pi)^2}$"], 'fontsize', 3);
