clc; clear;
// A = p2z(R,Theta) - Convert from polar to rectangular form.
//    R is a matrix containing the magnitudes
//    Theta is a matrix containing the phase angles (in degrees).
function [A] = p2z(R,Theta)
 if argn(2) <> 2 then
    error("incorrect number of arguments.");
 end
 if ~and(size(R) == size(Theta)) then
   error("arguments must be of the same dimension.");
 end
 A = R.*exp(%i*%pi*Theta/180.);
endfunction


// [R, Theta] = z2p(A) - Display polar form of complex matrix.
function [R, Theta] = z2p(A)
 if argn(1) == 1 then
   // Only a single return argument.
     // Display the mag and phase in adjacent columns.
     Theta = zeros(A);
     // Protect against 0 entries
     i = (A <> 0);
     Theta(i) = atan(imag(A(i)),real(A(i)))*180./%pi;
     disp(matrix([abs(A); Theta],size(A,1),2*size(A,2)));
     R = A;
 elseif argn(1) == 2 then
   // With two return arguments, the mag and phase are in stored in
   // separate matrices
   // Protect against 0 entries
   i = (A <> 0);
   Theta = zeros(A);
   Theta(i) = atan(imag(A(i)),real(A(i)))*180./%pi;
   R = abs(A);
 else
   error("invalid number of return arguments");
 end
endfunction
function [val] = value(w)
    q = %i * w;
    val = 1 / (q^2 + 5*q + 6);
endfunction
s = poly(0, 's');
//--------------------------
// Part a
g = 1 / (s^2 + 5*s + 6);
G = syslin('c', g);
t = 0:0.001:10;
deff('u=timefun(t)','u=cos(t)')
Omega = [1, sqrt(6), 2.5, 5, 20];
plotcolors = ["scilabred4", "scilab blue2", "scilab green4",...
"scilabmagenta4", "scilab cyan4"];
amplitudes = [];
peak_locs = [];
scf();
for i=1:size(Omega, 2)
    omega = Omega(i);
    outputs = csim(timefun, t*omega, G);
    amp = max(outputs(size(outputs, 2)-100:size(outputs, 2)));
    idx = find(outputs(size(outputs, 2)-100:size(outputs, 2)) == amp, 1);
    peak_locs = [peak_locs, idx];
    phase = acos((1/amp) * outputs(1));
    amplitudes = [amplitudes, amp];
    xset("thickness",2);
    plot2d(t, outputs, style=[color(plotcolors(i))]);
end
xlabel("$t$", 'fontsize', 3);
ylabel("Sinusoidal response", 'fontsize', 3);
title(["Plant with transfer function", "$\frac{1}{s^2 + 5s + 6}$"], "fontsize", 3);
L = legend(["$\omega = 1$", "$\omega = \sqrt{6}$", "$\omega = 2.5$",...
"$\omega = 5$", "$\omega = 20$"]);
L.font_size = 3;
peak_locs_inp = [];
scf();
for i=1:size(Omega, 2)
    omega = Omega(i);
    outputs = sin(t * omega);
    idx = find(max(outputs(size(outputs, 2)-100:size(outputs, 2))) == outputs(size(outputs, 2)-100:size(outputs, 2)), 1);
    peak_locs_inp = [peak_locs_inp, idx];
    xset("thickness",2);
    plot2d(t, sin(t*omega), style=[color(plotcolors(i))]);
end
xlabel("$t$", 'fontsize', 3);
ylabel("Sinusoidal inputs", 'fontsize', 3);
title(["Sinusoidal inputs for plant with transfer function", "$\frac{1}{s^2 + 5s + 6}$"], "fontsize", 3);
L = legend(["$\omega = 1$", "$\omega = \sqrt{6}$", "$\omega = 2.5$",...
"$\omega = 5$", "$\omega = 20$"]);
L.font_size = 3;
phases = Omega .* (t(peak_locs + length(t) - 100 - 1) - t(peak_locs_inp+length(t)-100-1));
disp(phases);
vals = [];
for i=1:size(Omega, 2)
    vals = [vals, value(Omega(i))];
end
[dbs, phis] = dbphi(vals);
G_mags = 10.^(dbs ./ 20);
