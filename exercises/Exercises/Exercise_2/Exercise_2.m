clear; clc; close all;
%% Problem 1
%  Calculate the piston side flow Q_1
D_cyl = 150*10^(-3); %mm (area)
D_rod = 100*10^(-3); %mm (area)
eta_hmC = 0.9; %(efficiency)
eta_vC = 1.0;  %(efficiency)
F_L = 40 * 10^3; %N (force of the load)
v = 0.5; %m/s (the speed of the pump)
A = (pi*(D_cyl/2)^2); % m^2 (Area of a circle)
A_r = (pi*(D_rod/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2
P = 5 * 10^5; %Pa

% a) Compute the piston side flow, Q_1

Q_1 = (v*A)*60000 %l/min

% b) Compute the ring side flow, Q_2

Q_2 = (phi*v*A)*60000 %l/min kan også skrives som Q_1*phi

%c) The piston side pressure, p_1 (extracting) or the ring side pressure,
%p_2 (retracting)

%1 Outstroke and resistive load
F_ca = F_L/eta_hmC;
P_a = ((F_ca/A)+(P*phi))*10^(-5) %Bar

%2 Outstroke and assistive load
F_cb = F_L/(2-eta_hmC);
P_b = (((F_c1/A)+P)*10^(-5))/phi %Bar

%3 In-stroke and assistive load
F_cc = F_L/(2-eta_hmC);
P_c = ((F_cc/A)+(P*phi))*10^(-5) %Bar

%4 In stroke and resistive load
F_cd = F_L/eta_hmC;
P_d = (((F_cd/A) + P)/phi)*10^(-5)

%d) Compute the friction force for all four situations

% situation 1
F_mc_a = ((1-eta_hmC)*F_ca)*10^(-3) %kN

% situation 2
F_mc_b = ((1-eta_hmC)*F_cb)*10^(-3) %kN

% situation 3
F_mc_c = ((1-eta_hmC)*F_cc)*10^(-3) %kN

%situation 4
F_mc_d = ((1-eta_hmC)*F_cd)*10^(-3) %kN

%% Problem 2
clear; clc; close all;
D_cyl1 = 40*10^(-3); %m
D_rod1 = 25*10^(-3); %m
%conditions are considered ideal eta_hmc = eta_vc = 1
M = 1200; %kg
Q_P = 25 /60000; %m^3/s
etha_hmc = 1;
etha_vc = etha_hmc;
A1 = (pi*(D_cyl1/2)^2); %m^2
A_r1 = (pi*(D_rod1)^2); %m^2
A_a1 = A1-A_r1; %m^2
phi1 = A_a1/A1; 
g = 9.81; %m/s^2
F_L1  = M * g; %N
v = Q_P/A1 %m/s

% a) Calculate the pump pressure, Pp for each situation

%Pp_1 = F_L1/(A1*(1-phi1))*10^(-5)








