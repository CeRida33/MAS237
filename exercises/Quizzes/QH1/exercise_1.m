clear; clc; close all;
format short
%%
% task 1 with ideal conditions
Q_p = 91.4/(6*10^4); %m^3/s
P_ps_p = 42.4 * 10^3; %W = N/m^2

Delta_p = (P_ps_p/Q_p)* 10^(-5) %bar = 10^5 Pa

%%
% Task 2 with efficiencies

D_p = 5 * 10^(-6); %m^5/rev
M_p = 24; %Nm
eta_hmp = 0.86; %enhetløs
Delta_pp = ((M_p * eta_hmp * 2* pi)/D_p)*10^(-5)

%%
% Task 3
n_1 = 1394.9/60; %rev/s
D_1max = 180*10^(-6); %m^3/rev
D_2 = 125 * 10^(-6); %m^3/rev
n_2 = 656.4/60; %rev/s 

D_1 = (D_2 * n_2)/n_1;

alpha_1 = D_1/D_1max

%%
%Task 4
Delta_pM = 365 * 10^5; %Pa
M_tM = 221; %Nm
D_M = ((M_tM * 2 * pi)/Delta_pM) * 10^6

%%
%Task 5 Positive load (resistive)

Delta_PM = 361 * 10^(5); %Pa
M_M = 131; %Nm
eta_hmM = 0.88;
D = (M_M * 2*pi)/(eta_hmM*Delta_PM)*10^6 %cm^3/rev


%%
%Task 6 Positive load (resistive)
P_M_L = 116 * 10^3; %W / N/m^2
delta_pm = 245 * 10^5; %Pa
eta_vM = 0.83;
eta_hmm = 0.96;

Qt_M = (P_M_L /delta_pm);
Q_M = (Qt_M/(eta_vM*eta_hmm))*60000

%%
%Task 7 hydrostatic transmission ideal conditions
M_1_1 = 115; %Nm
D_1_1 = 28*10^(-6); %m^3/rev
D_2_1 = 45*10^(-6); %m^3/rev
DP = (M_1_1*2*pi)/D_1_1; %Pa
M_2_1 = (D_2_1*DP)/(2*pi) %Nm

%%
%Hydrostatid transmission (positive load)
M_1_2 = 4; %Nm
D_1_2 = 5 * 10^(-6); %m^3/rev
D_2_2 = 200 * 10^(-6); %M^3/rev
eta_hmM_2 = 0.98;
M_2_2 = 141; %Nm

%what is eta_hmP?

eta_hmP_2 = (M_2_2*D_1_2)/(eta_hmM_2*D_2_2*M_1_2)






