clc; clear all; close all;
%%
s = tf('s');
G = 10 / (s * ((s/5)+1)*((s/20)+1));
lead = (s+3) / (s+1);
lag = (s+1)/(s+3);
figure();
nyquist(G);
figure();
nyquist(G*lead);
figure();
nyquist(G*lag);