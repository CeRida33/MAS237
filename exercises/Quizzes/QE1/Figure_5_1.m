% Figure 5_1
clear; clc; close all;
format("longG")


% Forsøk 1:
% Electromagnetics I . 
% Consider a magnetic circuit with a single MMF and two reluctances in series, see Figure Q5.1 .
% Current (i_1) = 8.8 A . 
% Number of windings (N_1) = 740 .
% Reluctance length (l_1) = 5.9 cm . 
% Relative permeability (mu_R1) = 91500 .
% Reluctance length (l_2) = 7.6 cm . 
% Reluctance area (A_2) = 11.0 cm^2 . 
% Relative permeability (mu_R2) = 71200 . 
% Magnetic flux (phi_1) = 5152 mWb = milliWb . 
% What is the reluctance area (A_1) in cm^2?

% Electromagnetics I . 
% Consider a magnetic circuit with a single MMF and two reluctances in series, see Figure Q5.1 . 
%  Current (i_1) = 2.3 A .
%  Number of windings (N_1) = 360 .
%  Reluctance length (l_1) = 12.1 cm .
%  Relative permeability (mu_R1) = 36600 . 
%  Reluctance length (l_2) = 11.7 cm . 
%  Reluctance area (A_2) = 8.7 cm^2 . 
%  Relative permeability (mu_R2) = 45100 .
% Magnetic flux (phi_1) = 190 mWb = milliWb . 
% What is the reluctance area (A_1) in cm^2?


% A_1 = ?
% R = (l)/(mu_r*mu_0*A)
% A_R_1 = (l_R_1)/(mu_R_1* mu_0*R_1)

mu_0 = 4 * pi * 10^-7; % Wb/m*A

i_mmf_1 = 26.0;  % A 
N_mmf_1 = 320;  % loops

l_R_1  = 18.3;   % cm
mu_R_1 = 32700; 
 
l_R_2  = 17.3;   % cm
mu_R_2 = 71300;
A_R_2  = 12.0;    % cm^2

% phi_1 = phi_tot
% 190 mWb = 0.190 Wb

phi_tot = 1.67 % wb

l_R_1_m = l_R_1/100  % cm to m
l_R_2_m = l_R_2/100  % cm to m

A_R_2_m = A_R_2/(100^2)  % cm^2 to m^2

% A_R_1 = (l_R_1)/(mu_R_1* mu_0*R_1)
% R_1 = ?

% R_1 = R_tot - R_2

% R_2 = (l_R_2)/(mu_R_2*mu_0*A_R_2)

% F_mmf = phi * R
% R_tot = (F_mmf_1)/(phi_tot)
% F_mmf_1 = N_mmf_1 * i_mmf_1

F_mmf_1 = N_mmf_1 * i_mmf_1

R_tot = (F_mmf_1)/(phi_tot)

R_2 = (l_R_2_m)/(mu_R_2*mu_0*A_R_2_m)

R_1 = R_tot - R_2


% For oppgaver som spør om annet enn A, endre hensyn på varibel her

A_R_1_m = (l_R_1_m)/(mu_R_1* mu_0*R_1)  % m

A_R_1 = A_R_1_m * (100^2)               % m^2 to cm^2

% A_R_1 = 13.2536646619266  % cm^2