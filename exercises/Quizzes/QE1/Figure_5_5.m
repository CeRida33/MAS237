% Figure 5_5
clear; clc; close all;
format("longG")


% Forsøk 3:
% Electromagnetics II . 
% Consider a magnetic circuit with two MMF's and three reluctances, see Figure Q5.5
%  Current (i_1) = 8.0 A . 
%  Number of windings (N_1) = 840 .
%  Number of windings (N_2) = 420 . 
%  Current (i_2) = 6.9 A .
%  Air reluctance length (l_1) = 2.4 mm .
%  Reluctance area (A_1) = 10.5 cm^2 .
%  Reluctance length (l_2) = 10.4 cm . 
%  Reluctance area (A_2) = 3.3 cm^2 .
%  Relative permeability (mu_R2) = 96800 .
% Reluctance length (l_3) = 3.9 cm . 
% Reluctance area (A_3) = 4.5 cm^2 . 
%  Relative permeability (mu_R3) = 49900 .
% What is the magnetic flux (phi_1) in mWb = milliWb?


i_mmf_1 = 8.0;  % A 
N_mmf_1 = 840;  % loops

F_mmf_1 = N_mmf_1 * i_mmf_1;

i_mmf_2 = 6.9;  % A 
N_mmf_2 = 420;  % loops

F_mmf_2 = N_mmf_2 * i_mmf_2;


mu_0 = 4 * pi * 10^-7; % Wb/m*A

mu_R_1 = 1; 
l_R_1  = 2.4;             % mm  OBS
A_R_1  = 10.5;            % cm^2

l_R_1_m = l_R_1/1000;      % mm to m  OBS
A_R_1_m = A_R_1/(100^2);   % cm^2 to m^2

R_1 = (l_R_1_m)/(mu_R_1*mu_0*A_R_1_m);

mu_R_2 = 96800;
l_R_2  = 10.4;            % cm
A_R_2  = 3.3;             % cm^2

l_R_2_m = l_R_2/100;       % cm to m
A_R_2_m = A_R_2/(100^2);   % cm^2 to m^2

R_2 = (l_R_2_m)/(mu_R_2*mu_0*A_R_2_m);

mu_R_3 = 49900;
l_R_3  = 3.9;             % cm
A_R_3  = 4.5;             % cm^2

l_R_3_m = l_R_3/100;       % cm to m
A_R_3_m = A_R_3/(100^2);   % cm^2 to m^2

R_3 = (l_R_3_m)/(mu_R_3*mu_0*A_R_3_m);



F_R_3 = F_mmf_2;

phi_3 = F_R_3 / R_3;                                          % Wb
phi_3_mWb = phi_3*1000                                        % Wb to mWb

phi_1 = (F_mmf_1 - F_mmf_2) / ((R_1 * R_2)/(R_1 + R_2));      % Wb
phi_1_mWb = phi_1*1000                                        % Wb to mWb

phi_2 = phi_3 - phi_1;                                        % Wb
phi_2_mWb = phi_2*1000                                        % Wb to mWb