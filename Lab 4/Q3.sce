clc; clear; 
//-----------------
// Question 3
s = poly(0, 's');
// Part a
Ga = s^5 + 3*s^4 + 5*s^3 + 4*s^2 + s + 3;
disp("Part a");
disp(["Routh Table of", "s^5 + 3*s^4 + 5*s^3 + 4*s^2 + s + 3"]);
disp(routh_t(Ga));
disp("==================================================");
//-----------------
// Part b
Gb = s^5 + 6*s^3 + 5*s^2 + 8*s + 20;
disp("Part b");
disp(["Routh Table of", "s^5 + 6*s^3 + 5*s^2 + 8*s + 20"]);
disp(routh_t(Gb));
disp("==================================================");
//-----------------
// Part c
Gc = s^5 - 2*s^4 + 3*s^3- 6*s^2 + 2*s - 4;
disp("Part c");
disp(["Routh Table of", "s^5 - 2*s^4 + 3*s^3- 6*s^2 + 2*s - 4"]);
disp(routh_t(Gc));
disp("==================================================");
//-----------------
// Part d
Gd = s^6 + s^5 - 6*s^4 + s^2 + s - 6;
disp("Part d");
disp(["Routh Table of", "s^6 + s^5 - 6*s^4 + s^2 + s - 6"]);
disp(routh_t(Gd));
disp("==================================================");
