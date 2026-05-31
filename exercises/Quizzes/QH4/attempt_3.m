%% Task 1
clear; clc; close all;
format long g;
%Figure Q 4.7
%retracting cylinger with an resistive load (positive)

%Variabler
D = 90*10^(-6); % m^3/rev
n = 990/60; %rev/sek
eta_vp = 0.92; 
P_cr_m = 240*10^5; %Pa
rho = 875; %kg/m^3
c_d = 0.70;
A_dmax_PB = 139*10^(-6); %m^2
A_dmax_AT = 140*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = -4.0*10^(-3); %m
alpha = 2.5;
p_cr = 240*10^5; %Pa

d_c = 125*10^(-3); %m
d_r = 80*10^(-3); %m

eta_hmc = 0.92;
FL = 116*10^3; %N

%Figure Q 4.6 for the equations based on the given information

%Starten av utregninger
A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

p_t = 0;

K_PB = c_d * (abs(x)/x_max)*A_dmax_PB*sqrt(2/rho);
K_AT = c_d * (abs(x)/x_max)*A_dmax_AT*sqrt(2/rho);

p_eq = (FL/(eta_hmc*A));



%P_in = p_crm assuming the relief valve is open which it is not because we
%are asked to find p_in

a = ((phi+alpha) * P_cr_m)+p_eq-p_cr;
b = (1+alpha)*K_PB^2+((phi+alpha)*phi^2*K_AT^2);

Q_in = K_PB * K_AT * phi * sqrt(a/b);

p_A = (Q_in/(phi*K_AT))^2;

c = (phi * p_cr)+(alpha*p_eq)+((1+alpha)*phi*p_A);
d = (phi + alpha);
p_Au = c/d; 

P_b = (p_Au-p_eq)/phi;

p_in = (P_b + (Q_in/K_PB)^2)*10^(-5)