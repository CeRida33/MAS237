%% figure 3.4 a
clear; clc; close all;

% Basic valve characteristics . Refer to Figure 3.4a in support material for QH3 . 
% Consider a check valve in parallel with an orifice . 
% Liquid density (rho) = 885 kg/m^3 . 
% Discharge coefficient (C_d) = 0.90 . 
% Discharge area (A_d) = 9.0 mm^2 . 
% Pressure (p_B) = 20 bar . 
% Pressure (p_T) = 0 bar . 
% Flow (Q_in) = 34 l/min . 
% What is the flow (Q_2) in l/min?

rho = 885; %kg/m^3
c_d = 0.90; 
a_d = 9*10^(-6); %m^2
p_b = 20*10^5; %Pa
p_t = 0; 
Q_in = 34/60000; %l/s

p_a = ((((Q_in)/(c_d*a_d))^2 * (rho/2))+p_b);

Q_2 = (c_d*a_d*(sqrt((2/rho)*(p_a-p_b))))*60000


%% figure 3.4 b
clear; clc; close all;
%Basic valve characteristics . 
% Refer to Figure 3.4b in support material for QH3 . 
% Consider a pressure relief valve in parallel with an orifice . 
% Liquid density (rho) = 883 kg/m^3 . 
% Discharge coefficient (C_d) = 0.84 . 
% Discharge area (A_d) = 9.0 mm^2 . 
% Crack pressure (p_cr) = 160 bar . 
% Pressure (p_B) = 20 bar . 
% Pressure (p_T) = 0 bar . 
% Flow (Q_in) = 77 l/min . 
% What is the flow (Q_2) in l/min?

rho = 883; %kg/m^3
c_d = 0.84; 
a_d = 9*10^(-6); %m^2
p_cr = 160*10^5; %Pa
p_b = 20*10^5; %Pa
p_t = 0; 
Q_in = 77/60000; %l/s


p_a = p_b + (rho/2)*((Q_in)/(c_d*a_d))^2

p_b+p_cr

%p_a ikke lik p_b + p_cr dermed er 

Q_2 = Q_in*60000 %l/min

