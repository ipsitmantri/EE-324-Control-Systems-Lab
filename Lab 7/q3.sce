clc; clear;
s = poly(0, 's');
g = 1 / (s^2 + 3*s + 2);
G = syslin('c', 4.437 * g);
G_old = G /. syslin('c', 1, 1);
disp("Uncompensated Transfer function")
disp(G_old);
settling_t = 2.3357; 
disp(sprintf("Old settling time = %.4f", settling_t));
slope = %pi / log(10);
x = -4:0.001:0;
y = -slope * x;
scf();
evans(G, 1000);
plot(x, y, 'c-', 'LineWidth', 2);
new_settling_t = settling_t / 2;
disp(sprintf("New settling time = %.4f", new_settling_t));
new_real_part = -4 / new_settling_t;
disp(sprintf("Real part of new dominant pole = %.8f", new_real_part));
new_imaginary_part = -slope * new_real_part;
disp(sprintf("Imaginary part of new dominant pole = %.8f", new_imaginary_part));
plot(new_real_part, new_imaginary_part, 'mx', 'LineWidth', 2);
// assume the zero of the lead compensator is at -6
z_c = 6;
[z, p, _] = tf2zp(G);
if z ~= [] then
    zeroes = zeros(size(z, 1), 2);
end
if p ~= [] then
    poles = zeros(size(p, 1), 2);
end
for i=1:size(p, 1)
    pi = p(i);
    pi = [real(pi), imag(pi)];
    poles(i, :) = pi;
end
for i=1:size(z, 1)
    zi = z(i);
    zi = [real(zi), imag(zi)];
    zeroes(i, :) = zi;
end
angles = 0;
for i=1:size(poles, 1)
    vector = [new_real_part, new_imaginary_part] - poles(i, :);
    angles = angles - atan(vector(2), vector(1))
end
angles = angles + atan(new_imaginary_part, z_c + new_real_part);
angle_by_new_pole = angles - %pi + 2*%pi;
disp(sprintf("Required angle to be compensated by the pole = %.4f", angle_by_new_pole));
p_c = (new_imaginary_part / tan(angle_by_new_pole)) - new_real_part;
disp(sprintf("p_c = %.8f", p_c)); 
g_comp = (s + z_c) * 4.437 * g / (s + p_c);
G_comp = syslin('c', g_comp);
disp(G_comp);
K = 0.01:1:100;
//-----------------------------------------
// Part b
angles = 0;
for i=1:size(poles, 1)
    vector = [new_real_part, new_imaginary_part] - poles(i, :);
    angles = angles - atan(vector(2), vector(1))
end
angle_by_new_zero = -angles + %pi;
disp(sprintf("Required angle to be compensated by the zero = %.4f", angle_by_new_zero));
z_c = (new_imaginary_part / tan(angle_by_new_zero)) - new_real_part;
disp(sprintf("z_c = %.8f", z_c)); 
g_pd = g * 4.437 * (s + z_c);
G_pd = syslin('c', g_pd);
disp(G_pd);
