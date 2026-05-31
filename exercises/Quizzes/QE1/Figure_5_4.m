% Figure 5_4
clear; clc; close all;
format("longG")


% Forsøk 2:
% Electromagnetics II . 
% Consider a magnetic circuit with two MMF's and three reluctances, see Figure Q5.4
%  Current (i_1) = 20 A . 
%  Number of windings (N_1) = 510 . 
%  Number of windings (N_2) = 770 .
%  Current (i_2) = 4.4 A . 
%  Air reluctance length (l_1) = 2.2 mm . 
%  Reluctance area (A_1) = 13.0 cm^2 . 
%  Reluctance length (l_2) = 24.0 cm . 
%  Reluctance area (A_2) = 9.2 cm^2 . 
%  Relative permeability (mu_R2) = 78900 .
%  Reluctance length (l_3) = 385.3 cm . 
%  Reluctance area (A_3) = 12.5 cm^2 . 
%  Relative permeability (mu_R3) = 62700 . 
% What is the magnetic flux (phi_2) in mWb = milliWb?


% Electromagnetics II . 
% Consider a magnetic circuit with two [MMF's and three reluctances, see Figure Q5.4 .
%  Current (i_1) = 20 A .
%  Number of windings (N_1) = 470 . 
%  Number of windings (N_2) = 350 . 
%  Current (i_2) = 15 A . 
%  Air reluctance length (l_1) = 3.7 mm . 
%  Reluctance area (A_1) = 2.2 cm^2 .
%  Reluctance length (l_2) = 21.0 cm .
%  Reluctance area (A_2) = 11.5 cm^2 .
%  Relative permeability (mu_R2) = 35400 .
%  Reluctance length (l_3) = 473.7 cm .
%  Reluctance area (A_3) = 1.3 cm^2 . 
%  Relative permeability (mu_R3) = 21000 . 
% What is the magnetic flux (phi_1) in mWb = milliWb?]


i_mmf_1 = 20;  % A 
N_mmf_1 = 470;  % loops

F_mmf_1 = N_mmf_1 * i_mmf_1

i_mmf_2 = 15;  % A 
N_mmf_2 = 350;  % loops

F_mmf_2 = N_mmf_2 * i_mmf_2


mu_0 = 4 * pi * 10^-7; % Wb/m*A

mu_R_1 = 1; 
l_R_1  = 3.7;             % mm  OBS
A_R_1  = 2.2;             % cm^2

l_R_1_m = l_R_1/1000      % mm to m  OBS
A_R_1_m = A_R_1/(100^2)   % cm^2 to m^2

R_1 = (l_R_1_m)/(mu_R_1*mu_0*A_R_1_m)

mu_R_2 = 35400;
l_R_2  = 21.0;            % cm
A_R_2  = 11.5;            % cm^2

l_R_2_m = l_R_2/100       % cm to m
A_R_2_m = A_R_2/(100^2)   % cm^2 to m^2

R_2 = (l_R_2_m)/(mu_R_2*mu_0*A_R_2_m)

mu_R_3 = 21000;
l_R_3  = 473.7;           % cm
A_R_3  = 1.3;            % cm^2

l_R_3_m = l_R_3/100       % cm to m
A_R_3_m = A_R_3/(100^2)   % cm^2 to m^2

R_3 = (l_R_3_m)/(mu_R_3*mu_0*A_R_3_m)


% phi_3 = phi_1 + phi_2
% phi_2 = phi_3 - phi_1

% phi_3 = F_R_3 / R_3
% F_R_3 = F_mmf_2

% phi_1 = (F_mmf_1 - F_mmf_2) / (R_1 + R_2)

phi_1 = (F_mmf_1 - F_mmf_2) / (R_1 + R_2)

F_R_3 = F_mmf_2

phi_3 = F_R_3 / R_3


phi_2 = phi_3 - phi_1             % Wb

phi_2_mWb = phi_2*1000         % Wb to mWb

% phi_2_mWb = 81.5543319068131   % mWb


% hvis spurt om phi_3 :
% phi_3_mWb = phi_3*1000         % Wb to mWb


phi_1_mWb = phi_1*1000                                        % Wb to mWb

% phi_1_mWb = 0.309988606639896 mWb






