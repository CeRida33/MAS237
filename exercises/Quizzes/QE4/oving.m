clear; clc; close all;

f = 50;                  %Hz
u = 440;                 %V
Rs = 1.1;                %ohm
Rr = 0.48;               %ohm
Xls = 1.15;              %ohm
Xm = 50;                 %ohm
Xlr = 0.52;              %ohm
nm = 1200;               %rev/min
np = 4;
j = sqrt(-1);
%% a) Compute the slip

wb = (2*2^pi*f)/4;
wm = 1200*((2^pi)/60);

s = (wb-wm)/wb;
fprintf('The slip is: %.2f\n', s);
%% b) Compute the stator current (Is)

theta_degZs = atand(Xls/Rs);
Zs_utvidet = Rs + j* Xls; 
Zs = sqrt(Rs^2+Xls^2);

fprintf('Impedansen Zs = %.2f ∠ %.1f° (ohm)\n', Zs, theta_degZs);

theta_degZm = atand(Xm/0);
Zm_utvidet = j*Xm; %j er 90 grader pga relle tallet = 0
Zm = sqrt(0+Xm^2);


fprintf('Impedansen Zm = %.2f ∠ %.1f° (ohm)\n', Zm, theta_degZm);

Rm = (1-s)/s*Rr;

fprintf('The equivilent mechanical resistance R_M =  %.2f (ohm)\n', Rm)

Zr_utvidet = Rr + j*Xlr + Rm;
Zr = abs(Zr);
Zrangle_rad = angle(Zr);
Zrangle_deg = rad2deg(Zrangle_rad);

fprintf('Impedansen Zr = %.2f ∠ %.1f° (ohm)\n', Zr, Zrangle_deg);

Ztot = Zs + (Zm*Zrmag)/(Zm+Zrmag)