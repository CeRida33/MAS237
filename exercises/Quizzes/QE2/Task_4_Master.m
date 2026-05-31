%Task_4
clear; clc; close all;
format("longG")


% Linear DC motor . 
% Consider a linear DC motor, steady state (ss) conditions .
% Supply voltage (u_s) = 23 Volt . 
% Linear DC motor length (l) = 6 cm .
% Magnetic flux density (B) = 1.58 Tesla . 
% Resistance (R) = 9.0 Ohm . 
% What is the stall force (F_ST) in N?


% F_ST = (u_s * l * B) / R

u_s = 16 % V

l = 15 % cm

B = 1.58 % Tesla

R = 5.0 % Ohm


l_m = l / 100 % cm to m

fst = 0.25

F_ST = (u_s * l_m * B) / R

B = (fst*R)/(u_s*l_m)


% F_ST = 0.242266666666667



%%
%Task_4
clear; clc; close all;
format("longG")


% Linear DC motor . Consider a linear DC motor, steady state (ss) conditions . 
% Supply voltage (u_s) = 15 Volt .
% Linear DC motor length (l) = 86 cm . 
% Magnetic flux density (B) = 1.67 Tesla . 
% Resistance (R) = 9.0 Ohm . 
% What is the no-load linear velocity (v_NL) in m/s?


u_s = 23 % V

l = 90 % cm

B = 1.35 % Tesla

R = 10.0 % Ohm

l_m = l / 100 % cm to m

v_nl = 22; %m/s

B = (u_s)/(l_m*v_nl)

v_NL = (u_s)/(l_m * B)       % m/s

% v_NL = 10.4442278234229    % m/s