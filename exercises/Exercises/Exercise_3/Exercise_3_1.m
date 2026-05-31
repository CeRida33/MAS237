clear; clc; close all;
format long g;
F_L = 100*10^3; %N
n_p = 1450/60; %rev/s
D = 36*10^(-6); %m^3/rev
eta_vp = 0.95;
eta_hmc = 0.95; 

d_cyl = 80 *10^(-3); %m
d_r = 36*10^(-3); %m

p = 850; %kg/m^3
p_cr = 250 * 10^5; %Pa
c_d = 0.65; 
A_p_a = 24*10^(-6); %m^2
A_b_t = 18*10^(-6); %m^2

A = pi*(d_cyl/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

%a) Pump flow, Q_p
Q_p = (eta_vp*n_p*D)*60000; %l/min

%b) Cylinder speed, v
v = (Q_p/60000)/A; %m/s

%c) pressure in B-port
Q_2 =(phi*Q_p)/60000; %(eta_vp*n_p*D); noe her er galt?

p_b = ((p/2)*(Q_2/(c_d*A_b_t))^2)*10^(-5) %Bar

%d) pressure in A-port
p_a = ((F_L/(eta_hmc*A)))*10^(-5)+(phi*p_b);

%e) pump pressure

dpp = ((p/2)*((Q_p/60000)/(c_d*A_p_a))^2)*10^(-5);
pp = p_a+dpp;


