clear; clc; close all;
%% task 1 (ideal relations)
delta_p = 272*10^(5); %Pa
P_ps_P = 28.2 * 10^3; %W
Q_P = (P_ps_P/delta_p)*60000 %L/min

%% task 2 (basic relations)
D_p = 80 * 10^(-6); %m^3/rev
n = 1709.0 /60; %rev/s
eta_vp = 0.84 %unitless

%what is the pump flow Q_P in l/min?

Q_P_1 = (eta_vp * n * D_p)*60000 %l/min

%% task 3 (Ideal conditions)
D1_max = 10*10^(-6); %m^3/rev
n_1 = 1652.1 /60; %rev/s
Q_P_2 = 7.6/60000; %m^3/s

%what is the pump displacement alpha?
D_1 = Q_P_2/n_1; %m^3/rev
alpha_1 = D_1/D1_max

%% Task 4 ideal relatiosn hydraulic motor (resistive positive load)
delta_pM = 290 * 10^5 %Pa
P_M_L = 269 *10^3 %W
%what is the motor flow Q_M in l/min?

Q_M = (P_M_L/delta_pM)*60000 %l/min

%% task 5 haudrylic motor basic relations
%negative load
D_M = 28*10^(-6); %m^3/rev
n_2 = 4921.0/60; %rev/s
eta_vm = 0.96;
%what is Q_M?

Q_M_1 = (n_2*D_M*eta_vm)*60000

%% task 6 assistive load (negative)
P_LM = 488*10^3; %W
n_3 = 854.6/60; %rev/s
D_M_1 = 710 * 10^(-6); %m^3/rev
eta_hmM = 0.89;
%what is deltap_M in bar?

M_M = P_LM/(2*pi*n_3); %Nm
delta_PM_2 = ((M_M*eta_hmM*2*pi)/(D_M_1))*10^(-5) %Bar

%% task 7 Hydrostatic transmission ideal components
M_P_1 = 58; %Nm
D_P_1 = 23 * 10^(-6); %m^3/rev
D_M_2 = 80 * 10^(-6); %m^3/rev
%what is the torque M_M in Nm

Delta_pm_3 = (M_P_1*2*pi)/(D_P_1); %Pa
M_M_2 = (D_M_2*Delta_pm_3)/(2*pi) %Nm

%% Task 8 hydrostatic transmission positive load 
n_1 = 1255/60; %rev/s
D_1 = 5 * 10^(-6); %m^3/rev
eta_vp_1 = 0.98;
D_2 = 125 * 10^(-6); %m^3/rev
eta_vm = 0.93;
n_2 = ((eta_vp_1*eta_vm*D_1*n_1)/D_2)*60





