%% Variation 1
clear;clc;close all;
disp('==================================================')
disp('What is the number of windings (N_1) rounded off ?')
disp('====================Answer:=======================')


% Given parameters---------------------------------------------------------
i_1      = 4.2;        % Current in Amperes
l_1      = 11.5 / 100; % Reluctance length in meters
A_1      = 3.4 * 1e-4; % Reluctance area in square meters
mu_R1    = 88100    ;  % Relative permeability
l_2      = 20.8 / 100; % Reluctance length in meters
A_2      = 9.7 * 1e-4; % Reluctance area in square meters
mu_R2    = 45300    ;  % Relative permeability
phi_1    = 227 * 1e-3; % Magnetic flux in Webers

% Computing----------------------------------------------------------------

mu_0 = 4 * pi * 1e-7;  % magnetic constant [H/m]

R_1 = l_1 / ( mu_R1*A_1*mu_0); % Eq. 1.11 - Reluctance in winding 

R_2 = l_2 / ( mu_R2*A_2*mu_0); % Eq. 1.11

R_tot = R_1 + R_2 ;

% MMF = phi * R_tot , where F_1 = N_1 * i_1 ; % Magnetomotive Force = F_1 
                        % - Enheten er ampere-turns (A·turns).

% This gives us:  N_1 * i_1 = phi * R_tot, and then we can solve for N_1

N_1 = ( phi_1 * R_tot) / i_1; % number of windings in winding number 1

disp(['The number of windings (N_1) is: ', num2str(round(N_1))]);

%% Variation 2

