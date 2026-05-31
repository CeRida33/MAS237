%% Question 1
clear; clc; close all;
format long g;
%Hydraulic orifice . 
% Refer to Figure 3.1 in support material for QH3 . 
% Liquid density (rho) = 878 kg/m^3 . 
% Discharge coefficient (C_d) = 0.64 . 
% Discharge area (A_d) = 28 mm^2 . 
% Pressure difference (dp_AB) = 63 bar . 
% What is the flow (Q) in l/min?

rho = 878; %kg/m^3
c_d = 0.64;
A_d = 28*10^(-6); %m^2
dp_AB = 63*10^5; 

Q = (c_d*A_d*sqrt((2/rho)*dp_AB))*60000

%% Question 2
clear; clc; close all;
format long g;
%Directional control valve . Refer to Figure 3.2 in support material for QH3 .
%  A 4/3-way directional control valve is in position "a" . 
% The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% 'The 4/3-way directional control valve has identical discharge areas: 
% A_dPA = A_dBT = A_dPB = A_dAT = A_d . 
% Liquid density (rho) = 876 kg/m^3 . 
% Discharge coefficient (C_d) = 0.52 . 
% Discharge area (A_d) = 26 mm^2 . 
% Pressure (p_P) = 22 bar . 
% Pressure (p_A) = 12 bar . 
% Pressure (p_B) = 6 bar . 
% Pressure (p_T) = 0 bar . 
% What is the flow (Q_PA) in l/min?

rho = 876; %kg/m^3
c_d = 0.52;
a_dmax = 26*10^(-6); %m^2
p_P = 22*10^5; %Pa
p_A = 12*10^5; %Pa
p_B = 6*10^5; %Pa
p_T = 0*10^5; %Pa

Q_pa = (c_d*a_dmax*sqrt((2/rho)*(p_P-p_A)))*60000

%% Question 3
clear; clc; close all;
format long g;
%Proportional directional control valve . 
% Refer to Figure 3.3 in support material for QH3 . 
% The 4/3-way proportional directional control valve is symmetric: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way proportional directional control valve is symmetric: '
% A_dMax,PA = A_dMax,BT = A_dMax,PB = A_dMax_AT = A_dMax .
%  Liquid density (rho) = 881 kg/m^3 . 
% Discharge coefficient (C_d) = 0.79 . 
% Max valve spool travel (x_Max) = 10.0 mm . 
% Valve spool travel (x) = 5.9 mm .
%  Maximum discharge area (A_dMax) = 39 mm^2 . 
% Pressure (p_P) = 40 bar . 
% Pressure (p_A) = 11 bar .
% Pressure (p_B) = 26 bar .
%  Pressure (p_T) = 0 bar . 
% What is the flow (Q_PA) in l/min?

rho = 881; %kg/m^3
C_d = 0.79;
x_max = 10*10^(-3); %m
x = 5.9*10^(-3); %m
a_dmax = 39*10^(-6); %m^2
p_P = 40*10^5; %Pa
p_A = 11*10^5; %Pa
p_B = 26*10^5; %Pa
p_T = 0*10^5; %Pa


Q_pa = (C_d*a_dmax*(x/x_max)*sqrt((2/rho)*(p_P-p_A)))*60000

%% Question 4
clear; clc; close all;
format long g;
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

rho = 883;
c_d = 0.84;
a_d = 9.0*10^(-6);
p_cr = 160*10^(5);
p_b = 20*10^(5);
p_t = 0*10^(5);
Q_in = 77/60000; 
Q_2 = ?

%% Question 5
clear; clc; close all;
format long g;
%4/3 directional control valve and ideal hydraulic cylinder . 
% Refer to Figure 3.5 (right) in support material for QH3 . 
% The 4/3-way directional control valve is in position "b" .
%  The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way directional control valve has symmetrical discharge areas: 
% A_dPA = A_dPB and A_dBT = A_dAT . 
% The cylinder is retracting . 
% The cylinder is subjected to an assistive (negative) load . 
% Cylinder diameter (d) = 40 mm . 
% Cylinder rod diameter (dR) = 20 mm . 
% Cylinder load force (F_L) = 16.9 kN . 
% Liquid density (rho) = 880 kg/m^3 . 
% Discharge coefficient (C_d) = 0.60 . 
% Flow (Q_in) = 5.1 l/min . 
% Discharge area (A_dPB) = 2.5 mm^2 . 
% Discharge area (A_dAT) = 1.0 mm^2 .
%  What is the pressure (p_B) in bar?

d_c = 40*10^(-3); %m
d_r = 20*10^(-3); %m
F_L = 16.9*10^3; %N
rho = 880; %kg/m^3
c_d = 0.60;
Q_in = 5.1/60000; %l/s Q_pb
a_dpb = 2.5*10^(-6); %m^2
a_dat = 1.0*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in; %Qat
p_t =  0;



%p_a = ((Q_at/(C_d*A_d))^2 *(rho/2))*10^(-5)

%q_at = c_d * a_at * sqrt((2/rho)*(pa-pt))

p_a = ((Q_out/(c_d*a_dat))^2 *(rho/2));

