clc; clear; 
//-----------------
// Question 4
s = poly(0, 's');
// Part a
Ga = s^6 + s^5 + s^4 + s^2 + s + 1;
disp("Part a");
disp(["Routh Table of", "s^6 + s^5 + s^4 + s^2 + s + 1"]);
disp(routh_t(Ga));
disp("==================================================");
//-----------------
// Part b
Gb = Ga * (s^2 + s + 1);
disp("Part b");
disp(["Routh Table of", "s^8 + 2s^7 + 3s^6 + 2s^5 + 2s^4 + 2s^3 + 3s^2 + 2s + 1"]);
disp(routh_t(Gb));
disp("==================================================");
//-----------------
// Part c
Gc = s^6 + s^5 + s^2 + s;
disp("Part c");
disp(["Routh Table of", "s^6 + s^5 + s^2 + s"]);
disp(routh_t(Gc));
disp("==================================================");
