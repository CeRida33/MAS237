% Figure 5_3
clear; clc; close all;
format("longG")


% Forsøk 1:
% Electromagnetics II . 
% Consider a magnetic circuit with a single MMF and three reluctances, see Figure Q5.3 . 
% Current (i_1) = 29 A . 
% Number of windings (N_1) = 720 . 
% Reluctance length (l_1) = 20.3 cm . 
% Reluctance area (A_1) = 6.2 cm^2 . 
% Relative permeability (mu_R1) = 91300 . 
% Reluctance length (l_2) = 10.7 cm . 
% Reluctance area (A_2) = 3.4 cm^2 . 
% Relative permeability (mu_R2) = 87700 . 
% Reluctance length (l_3) = 11.3 cm . 
% Reluctance area (A_3) = 3.8 cm^2 . 
% Relative permeability (mu_R3) = 36300 . 
% What is the magnetic flux (phi_0) in mWb = milliWb?


i_mmf_1 = 2.6;  % A 
N_mmf_1 = 370;  % loops

F_mmf_1 = N_mmf_1 * i_mmf_1


mu_0 = 4 * pi * 10^-7; % Wb/m*A

mu_R_1 = 56400; 
l_R_1  = 13.8;           % cm
A_R_1  = 4.8;           % cm^2

l_R_1_m = l_R_1/100      % cm to m
A_R_1_m = A_R_1/(100^2)  % cm^2 to m^2

mu_R_2 = 80000;
l_R_2  = 23.9;           % cm
A_R_2  = 12.3;            % cm^2

l_R_2_m = l_R_2/100      % cm to m
A_R_2_m = A_R_2/(100^2)  % cm^2 to m^2

mu_R_3 = 65000;
l_R_3  = 13.1;           % cm
A_R_3  = 13.0;            % cm^2

l_R_3_m = l_R_3/100      % cm to m
A_R_3_m = A_R_3/(100^2)  % cm^2 to m^2


R_1 = (l_R_1_m)/(mu_R_1*mu_0*A_R_1_m)

R_2 = (l_R_2_m)/(mu_R_2*mu_0*A_R_2_m)

R_3 = (l_R_3_m)/(mu_R_3*mu_0*A_R_3_m)


R_tot = R_1 + (R_2 * R_3)/(R_2 + R_3)


% phi_0 = phi_tot

phi_tot = F_mmf_1 / R_tot % Wb

phi_tot_mWb = phi_tot*1000 % Wb to mWb

% phi_tot_mWb = 4314.45432320442  % mWb

