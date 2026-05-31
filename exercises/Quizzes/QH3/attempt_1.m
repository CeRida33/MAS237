%% Question 1
clear; clc; close all;
format long g;
%Hydraulic orifice . 
% Refer to Figure 3.1 in support material for QH3 . 
% Liquid density (rho) = 871 kg/m^3 . 
% Discharge coefficient (C_d) = 0.89 . 
% Discharge area (A_d) = 27 mm^2 . 
% Flow (Q) = 94 l/min . 
% What is the pressure difference (dp_AB) in bar?

rho = 871; %kg/m^3
C_d = 0.89;
A_d = 27*10^(-6); %m^2
Q = 94/60000; %l/s


dp_AB = (((Q/(C_d*A_d))^2)*(rho/2))*10^(-5)

%% Question 2
clear; clc; close all;
format long g;
%Directional control valve . 
% Refer to Figure 3.2 in support material for QH3 . 
% A 4/3-way directional control valve is in position "b" . 
% The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way directional control valve has identical discharge areas: 
% A_dPA = A_dBT = A_dPB = A_dAT = A_d .
%  Liquid density (rho) = 883 kg/m^3 . 
% Discharge coefficient (C_d) = 0.65 . 
% Discharge area (A_d) = 32 mm^2 . 
% Flow (Q_AT) = 67 l/min . 
% What is the pressure difference (dp_AT) in bar?

rho = 883; %kg/m^3
C_d = 0.65;
A_d = 32*10^(-6); %m^2
Q_at = 67/60000; %l/s

dp_at = ((Q_at/(C_d*A_d))^2 *(rho/2))*10^(-5)

%% Question 3
clear; clc; close all;
format long g;
%Proportional directional control valve . 
% Refer to Figure 3.3 in support material for QH3 . 
% The 4/3-way proportional directional control valve is symmetric: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way proportional directional control valve is symmetric: 
% A_dMax,PA = A_dMax,BT = A_dMax,PB = A_dMax_AT = A_dMax . 
% Liquid density (rho) = 868 kg/m^3 . 
% Discharge coefficient (C_d) = 0.65 . 
% Max valve spool travel (x_Max) = 10.0 mm . 
% Valve spool travel (x) = 8.4 mm . 
% Maximum discharge area (A_dMax) = 38 mm^2 . 
% Pressure (p_P) = 15 bar . 
% Pressure (p_A) = 5 bar . 
% Pressure (p_B) = 15 bar . 
% Pressure (p_T) = 0 bar . 
% What is the flow (Q_BT) in l/min?

rho = 868; %kg/m^3
C_d = 0.65;
x_max = 10*10^(-3); %m
x = 8.4*10^(-3); %m
a_dmax = 38*10^(-6); %m^2
p_P = 15*10^5; %Pa
p_A = 5*10^5; %Pa
p_B = 15*10^5; %Pa
p_T = 0*10^5; %Pa

Q_bt = (C_d*a_dmax*(x/x_max)*sqrt((2/rho)*(p_B-p_T)))*60000

%% Question 4
clear; clc; close all;
format long g;
%Basic valve characteristics . 
% Refer to Figure 3.4d in support material for QH3 . 
% Consider a pressure reduction valve in series with an orifice . 
% Liquid density (rho) = 871 kg/m^3 . 
% Discharge coefficient (C_d1) = 0.71 . 
% Discharge area (A_d1) = 19 mm^2 . 
% Discharge coefficient (C_d2) = 0.71 . 
% Discharge area (A_d2) = 44 mm^2 . 
% Rated pressure (p_0) = 10 bar . 
% Rated flow (Q0) = 40 l/min . 
% Close pressure (p_cl) = 50 bar . 
% Flow (Q_in) = 91 l/min . 
% Pressure (p_T) = 0 bar . 
% What is the pressure (p_A) in bar?

rho = 871; %kg/m^3
c_d1 = 0.71;
a_d1 = 19*10^(-6); %m^2
c_d2 = 0.71;
a_d2 = 44*10^(-6); %m^2
p_0 = 10*10^5; %Pa
Q_0 = 40/60000; %l/s
p_cl = 50*10^5; %pa
Q_in = 91/60000; %l/s
p_T = 0 *10^5; %Pa

p_b = (Q_in/(c_d1*a_d1))^2 * (rho/2);
p_bar = p_b * 10^(-5);

p_a = ((Q_in/(c_d2*a_d2))^2 * (rho/2) + p_b)*10^(-5)


%% Question 5
clear; clc; close all;
format long g;
%4/3 directional control valve and ideal hydraulic cylinder . 
% Refer to Figure 3.5 (left) in support material for QH3 . 
% The valve A-port is connected to the cylinder piston side . 
% The valve B-port is connected to the cylinder rod side . 
% The 4/3-way directional control valve is in position "a" . 
% The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way directional control valve has symmetrical discharge areas: 
% A_dPA = A_dPB and A_dBT = A_dAT . 
% The cylinder is extracting . 
% The cylinder is subjected to a resistive (positive) load . 
% Cylinder diameter (d) = 160 mm . 
% Cylinder rod diameter (dR) = 80 mm . 
% Cylinder load force (F_L) = 279.4 kN . 
% Liquid density (rho) = 867 kg/m^3 . 
% Discharge coefficient (C_d) = 0.69 . 
% Flow (Q_in) = 137 l/min . 
% Discharge area (A_dPA) = 75 mm^2 . 
% Discharge area (A_dBT) = 43 mm^2 . 
% What is the pressure (p_P) in bar?

d_c = 160*10^(-3); %m
d_r = 80*10^(-3); %m
F_L = 279.4*10^3; %N
rho = 867; %kg/m^3
c_d = 0.69;
Q_in = 137/60000; %l/s
a_dpa = 75*10^(-6); %m^2
a_dbt = 43*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in;
p_t =  0;

p_b = (rho/2)*(Q_out/(c_d*a_dbt))^2;
dp_a =(rho/2)*(Q_in/(c_d*a_dpa))^2;
p_a = (F_L/A)+phi*p_b;

Pp = (p_a+dp_a)*10^(-5) 

%% Question 6
clear; clc; close all;
format long g;
%4/3 directional control valve and ideal hydraulic motor . 
% Refer to Figure 3.6 (right) in support material for QH3 . 
% The 4/3-way directional control valve is in position "b" . 
% The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way directional control valve has symmetrical discharge areas: 
% A_dPA = A_dPB and A_dBT = A_dAT . 
% The motor is subjected to an assistive (negative) load . 
% Motor displacement (D) = 250 cm^3/rev . 
% Motor torque load (M_L) = 1120 . 
% Liquid density (rho) = 879 kg/m^3 . 
% Discharge coefficient (C_d) = 0.85 . 
% Flow (Q_in) = 206 l/min . 
% Discharge area (A_dPB) = 60 mm^2 . 
% Discharge area (A_dAT) = 15 mm^2 .
%  What is the pressure (p_B) in bar?

%assistive (negative) load

D = 250*10^(-6); %m^3/rev
M_L = 1120; %Nm
rho = 879; %kg/m^3
c_d = 0.85;
Q_in = 206/60000; %m^3/s
a_dPB = 60*10^(-6); %m^2
a_dAT = 15*10^(-6); %m^2
Q_out = Q_in;



p_a  = (rho/2)*(Q_out/(c_d*a_dAT))^2;
p_m = ((M_L*2*pi)/D);

p_a-p_m;

% p_pb  = (rho/2)*(Q_in/(c_d*a_dPB))^2;
% 
% pp = p_a+p_pb+p_m;
% p_b = pp-p_pb


%% Question 7
clear; clc; close all;
format long g;
%Hydraulic base unit . 
% Refer to Figure 3.7a in support material for QH3 . 
% Consider a 4/3-way proportional DCV and a motor . 
% The 4/3-way proportional directional control valve is symmetric: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way proportional directional control valve has symmetrical discharge areas: 
% A_dMax,PA = A_dMax,PB and A_dMax,BT = A_dMax,AT . 
% Liquid density (rho) = 879 kg/m^3 . 
% Discharge coefficient (C_d) = 0.63 . 
% Maximum discharge area (A_dMax,PA) = 27 mm^2 . 
% Maximum discharge area (A_dMax,BT) = 22 mm^2 . 
% Max valve spool travel (x_Max) = 10.0 mm . 
% Valve spool travel (x) = 8.7 mm . 
% The motor is subjected to a resistive (positive) load . 
% Motor displacement (D) = 45 cm^3/rev . 
% Motor volumetric efficiency (eta_vM) = 0.93 .
%  Motor hydromechanical efficiency (eta_hmM) = 0.91 .
%  Motor load torque (M_L) = 135 N*m . 
% Flow (Q_in) = 41 l/min . 
% What is the motor speed (n) in rev/min?

rho = 879; %kg/m^3
c_d = 0.63;
a_dmax_pa = 27*10^(-6); %m^2
a_dmax_bt = 22*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 8.7*10^(-3); %m
D = 45*10^(-6); %m^3/rev
eta_vm = 0.93;
eta_hmM = 0.91;
M_L = 135; %Nm
Q_in = 41/60000; %l/s
n = eta_vm*(Q_in/D)*60

%% Question 7
clear; clc; close all;
format long g;
%Hydraulic base unit . 
% Refer to Figure 3.8a in support material for QH3 . 
% Consider a 4/3-way proportional DCV, a counterbalance valve, and a motor. 
% The 4/3-way proportional directional control valve is symmetric: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way proportional directional control valve has symmetrical discharge areas:
%  A_dMax,PA = A_dMax,PB and A_dMax,BT = A_dMax,AT . 
% Liquid density (rho) = 880 kg/m^3 . 
% Discharge coefficient (C_d) = 0.66 . 
% Maximum discharge area (A_dMax,PA) = 33 mm^2 . 
% Maximum discharge area (A_dMax,BT) = 39 mm^2 . 
% Max valve spool travel (x_Max) = 10.0 mm . 
% Valve spool travel (x) = 8.9 mm . 
% The motor is subjected to an assistive (negative) load . 
% Motor displacement (D) = 1000 cm^3/rev . 
% Motor volumetric efficiency (eta_vM) = 0.88 . 
% Motor hydromechanical efficiency (eta_hmM) = 0.93 . 
% Motor load torque (M_L) = 1411 N*m . 
% Pilot area ratio (alpha) = 3.8 . 
% Crack pressure (p_cr) = 90 bar . 
% Flow (Q_in) = 42 l/min . 
% What is the pressure (p_Bu) in bar?

rho = 880;
c_d = 0.66;
a_dmax_pa = 33*10^(-6);
a_dmax_bt = 39*10^(-6);
x_max = 10*10^(-3); %m
x = 8.9*10^(-3); %m
D = 1000*10^(-6); %m^3/rev
eta_vm = 0.88;
eta_hmM = 0.93;
M_L = 1411; %Nm
alpha = 3.8;
p_cr = 90*10^5;
Q_in = 42/60000; %l/s

p_eq = eta_hmM*((2*pi*M_L)/D);
k_bt = c_d *(x/x_max)*a_dmax_bt*sqrt(2/rho);
p_b = (Q_in/k_bt)^2;
p_bu = ((p_cr + (alpha*p_eq) + ((1+alpha)*p_b))/(1+alpha))*10^(-5)
