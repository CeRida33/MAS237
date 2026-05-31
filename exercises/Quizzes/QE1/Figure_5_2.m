% Figure 5_2
clear; clc; close all;
format("longG")


% Forsøk 8:
% Electromagnetics I . 
% Consider a magnetic circuit with a single MMF and two reluctances in parallel, see Figure Q5.2 . 
% Current (i_1) = 12 A . 
% Number of windings (N_1) = 850 . 
% Reluctance length (l_1) = 17.9 cm . 
% Reluctance area (A_1) = 11.6 cm^2 . 
% Relative permeability (mu_R1) = 92600 . 
% Reluctance length (l_2) = 16.3 cm . 
% Reluctance area (A_2) = 9.6 cm^2 . 
% Relative permeability (mu_R2) = 21100 . 
% What is the magnetic flux (phi_0) in mWb = milliWb?



% phi_0 = phi_tot
% phi_tot = F_mmf/R_tot
% R_tot = R_1 + R_2


i_mmf_1 = 12;  % A 
N_mmf_1 = 850;  % loops

F_mmf_1 = N_mmf_1 * i_mmf_1


mu_0 = 4 * pi * 10^-7; % Wb/m*A

mu_R_1 = 92600; 
l_R_1  = 17.9;   % cm
A_R_1  = 11.6;    % cm^2

mu_R_2 = 21100;
l_R_2  = 16.3;   % cm
A_R_2  = 9.6;    % cm^2

l_R_1_m = l_R_1/100  % cm to m
l_R_2_m = l_R_2/100  % cm to m

A_R_1_m = A_R_1/(100^2)  % cm^2 to m^2
A_R_2_m = A_R_2/(100^2)  % cm^2 to m^2


R_1 = (l_R_1_m)/(mu_R_1*mu_0*A_R_1_m)

R_2 = (l_R_2_m)/(mu_R_2*mu_0*A_R_2_m)

R_tot = (R_1 * R_2)/(R_1 + R_2)

phi_tot = F_mmf_1 / R_tot  % Wb

phi_tot_mWb = phi_tot*1000 % Wb to mWb

% phi_tot_mWb = 9284.61907942204  % mWb

