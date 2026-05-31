%% Question 1
clear; clc; close all;
format long g;

rho = 883; %kg/m^3
c_d = 0.53;
A_d = 18*10^(-6); %m^27
p_b = 7*10^5;
p_a = 46*10^5;
delta_p = p_a-p_b;
Q = (c_d*A_d*sqrt((2/rho)*delta_p))*60000


%% Question 2
%position b
clear; clc; close all;
format long g;

rho = 872;
c_d = 0.58
a_d = 33*10^(-6);
Q_PB = 19/60000;
Pp = 10*10^5;
p_a = 6*10^5;
p_t = 0*10^5;

p_b = ((((Q_PB/(c_d*a_d))^2*(rho/2))-Pp)*-1)*10^(-5)

%% Question 3
%position 
%ideal or?
clear; clc; close all;
format long g;

%Proportional directional control valve . 
% Refer to Figure 3.3 in support material for QH3 . 
% The 4/3-way proportional directional control valve is symmetric:
%  C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way proportional directional control valve is symmetric: 
% A_dMax,PA = A_dMax,BT = A_dMax,PB = A_dMax_AT = A_dMax . 
% Liquid density (rho) = 880 kg/m^3 . 
% Discharge coefficient (C_d) = 0.57 . 
% Max valve spool travel (x_Max) = 10.0 mm . 
% Maximum discharge area (A_dMax) = 37 mm^2 . 
% Flow (Q_BT) = 37 l/min . 
% Pressure (p_P) = 21 bar . 
% Pressure (p_A) = 9 bar . 
% Pressure (p_B) = 10 bar . 
% Pressure (p_T) = 0 bar . 
% What is the spool travel (x) in mm? (remember the sign +/-)


rho = 880; %kg/m^3
c_d = 0.57;
x_max = 10*10^(-3); %m
a_dmax = 37*10^(-6); %m^2
p_P = 21*10^5; %Pa
p_A = 9*10^5; %Pa
p_B = 10*10^5; %Pa
p_T = 0*10^5; %Pa
Q_BT = 37/60000; %m^3/s

x = (Q_BT*x_max)/(c_d*a_dmax*sqrt((2/rho)*(p_B-p_T)))*10^3


%% Question 4
%figure 3.4 d
%valve closed
clear; clc; close all;
format long g;

rho = 881; %kg/m^3
c_d1 = 0.70;
a_d1 = 15*10^(-6); %m^2
c_d2 = 0.70;
a_d2 = 24*10^(-6); %m^2
p_0 = 10*10^5; %Pa
Q_0 = 40/60000; %l/s
p_cl = 120*10^5; %pa
Q_in = 126/60000; %l/s
p_T = 0 *10^5; %Pa

p_b = (Q_in/(c_d1*a_d1))^2 * (rho/2);
p_bar = p_b * 10^(-5) %P_b >= p_cl

p_a = ((Q_in/(c_d2*a_d2))^2 * (rho/2) + p_b)*10^(-5)


%% Question 5
%figure 3.5 (right)
clear; clc; close all;
format long g;

%4/3 directional control valve and ideal hydraulic cylinder . 
% Refer to Figure 3.5 (right) in support material for QH3 . 
% The 4/3-way directional control valve is in position "b" . 
% The 4/3-way directional control valve has identical discharge coefficients: 
% C_dPA = C_dBT = C_dPB = C_dAT = C_d . 
% The 4/3-way directional control valve has symmetrical discharge areas: 
% A_dPA = A_dPB and A_dBT = A_dAT . 
% The cylinder is retracting . 
% The cylinder is subjected to an assistive (negative) load . 
% Cylinder diameter (d) = 180 mm . 
% Cylinder rod diameter (dR) = 90 mm . 
% Cylinder load force (F_L) = 632.5 kN . 
% Liquid density (rho) = 880 kg/m^3 . 
% Discharge coefficient (C_d) = 0.73 . 
% Flow (Q_in) = 126 l/min . 
% Discharge area (A_dPB) = 72 mm^2 . 
% Discharge area (A_dAT) = 16 mm^2 . 
% What is the pressure (p_A) in bar?

%assistive (negative) load 
%Figure 3.5 (right)

d_c = 180*10^(-3); %m
d_r = 90*10^(-3); %m
F_L = 632.5*10^3; %N
rho = 880; %kg/m^3
c_d = 0.73;
Q_in = 126/60000; %l/s Q_pb
a_dPB = 72*10^(-6); %m^2
a_dAT = 16*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in; %Qat
p_t =  0;


p_a = ((Q_out/(c_d*a_dAT))^2*(rho/2))*10^(-5)


%% Question 6
%figure 3.6 (right)
clear; clc; close all;
format long g;


D = 28*10^(-6); %m^3/rev
M_L = 157; %Nm
rho = 874; %kg/m^3
c_d = 0.76;
Q_in = 84/60000; %m^3/s
a_dPB = 31*10^(-6); %m^2
a_dAT = 6.3*10^(-6); %m^2
Q_out = Q_in;



p_a  = (rho/2)*(Q_out/(c_d*a_dAT))^2;
p_m = ((M_L*2*pi)/D);

p_b = p_a-p_m;
p_b_bar = p_b * 10^(-5) %sjekk for å se at P-p blir større enn p_b

P_p = ((Q_in/(c_d*a_dPB))^2*(rho/2)+p_b)*10^(-5)

%% Question 7
clear; clc; close all;
format long g;

rho = 883; %kg/m^3
c_d = 0.80;
a_dmax_PA = 25*10^(-6); %m^2
a_dmax_BT = 24*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 7.7*10^(-3); %m
D = 45*10^(-6); %m^3/rev
eta_vm = 0.96;
eta_hmM = 0.96;
M_L = 16; %Nm
Q_in = 43/60000; %l/s


%positive load

n = eta_vm*(Q_in/D)*60

%% Question 8
clear; clc; close all;
format long g;
%figure 3.8 b

rho = 869; %kg/m^3
c_d = 0.81;
a_dmax_PA = 22*10^(-6); %m^2
a_dmax_BT = 20*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 1.3*10^(-3); %m
d_cyl = 180*10^(-3);%m
d_rod = 90*10^(-3); %m
eta_hmC = 0.97;
F_L = 269.9*10^3; %N
alpha = 3.3;
p_cr = 230*10^5; %Pa
Q_in = 6.2/60000; %l/s


%what is P_a in bar?

A = pi*(d_cyl/2)^2;
A_r = (pi*(d_rod/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

p_eq = (F_L)/((2-eta_hmC)*A);
k_BT = c_d * (x/x_max)*a_dmax_BT*sqrt(2/rho);
p_b = ((phi*Q_in)/k_BT)^2;
p_bu = ((p_cr + (alpha*p_eq) + ((1+alpha)*p_b))/(1+(phi*alpha)));
p_A = ((phi*p_bu)-p_eq)*10^(-5)