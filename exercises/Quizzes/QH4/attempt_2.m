%% Task 1
clear; clc; close all;
format long g;
%Figure Q 4.7
%retracting cylinger with an resistive load (positive)

%Variabler
D = 56*10^(-6); % m^3/rev
n = 1030/60; %rev/sek
eta_vp = 0.92; 
P_cr_m = 190*10^5; %Pa
rho = 875; %kg/m^3
c_d = 0.70;
A_dmax_PB = 39*10^(-6); %m^2
A_dmax_AT = 45*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = -8.0*10^(-3); %m
p_cr = 240*10^5; %Pa

d_c = 25*10^(-3); %m
d_r = 16*10^(-3); %m

eta_hmc = 0.92;
FL = 4.93*10^3; %N

%Figure Q 4.5 for the equations based on the given information

%Starten av utregninger
A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

p_t = 0;

K_PB = c_d * (abs(x)/x_max)*A_dmax_PB*sqrt(2/rho);
K_AT = c_d * (abs(x)/x_max)*A_dmax_AT*sqrt(2/rho);

p_eq = (FL/(eta_hmc*A));

%P_in = p_crm assuming the relief valve is open

a = (phi * P_cr_m)-p_eq;
b = K_PB^2+(phi^3*K_AT^2);

Q_in = K_PB*K_AT*phi * sqrt(a/b);
p_a = (Q_in/(phi*K_AT))^2;
P_b = (p_a+p_eq)/phi;
p_b_bar = P_b*10^(-5)

%% Task 2
clear; clc; close all;
%Figure 4.10
beta = 1053 * 10^6; %Pa
D = 250*10^(-6); %m^3/rev
V_L = 0.63*10^(-3); %l
J = 5.63; %Kg*m^2


K_theta = (beta*D^2)/(pi^2*(D+V_L));

omega_n = sqrt(K_theta/J) %Neutral eigenfrequency

%% Task 3
clear; clc; close all;
%figure 4.12

D = 160*10^(-6); %m^3/rev
J = 2.70; %kg/m^2
p_s = 250*10^5; %Pa
delta_theta = 73.1; %rad
delta_t = 2.525; %s
t_R = 0.569; %s
m_1 = 49; %Nm
m_2 = -347; %Nm
m_3 = 334; %Nm
t = 1.810; %s

%What is the no-load flow (Q_NL) at the considered time (t) in l/min?

delta_t - t_R; 
% We are in region 2

sigma = t_R/delta_t;
omega_0 = delta_theta/(delta_t-t_R);
alpha_max = omega_0/t_R;
alpha_min = -omega_0/t_R;
alpha_hold = 0;

% reigion 1 = t/t_R 
% region 2 the difference is 1 so nothing needs to be added halleluja!
% region 3 = 1-((t-(delta_t-t_R))/t_R) 


Q_l = D*(omega_0/(2*pi));

p_l_topp = 2*pi*(m_2+(J*alpha_hold));

p_l = p_l_topp/D;

root = p_s/(p_s-p_l);
Q_NL = (Q_l*sqrt(root))*60000


%% Task 4
clear; clc; close all;
%figure 4.12

D = 355*10^(-6); %m^3/rev
J = 9.63; %kg/m^2

p_s = 250*10^5; %Pa
p_r = 70*10^5; %Pa

delta_theta = 81.8; %rad
delta_t = 6.149; %s

t_R = 1.703; %s
m_1 = 453; %Nm
m_2 = -217; %Nm
m_3 = -19; %Nm

%What is the minimum required valve flow (Q_r,min) in l/min?

%Starting equations

sigma = t_R/delta_t;
omega_0 = delta_theta/(delta_t-t_R);
alpha_max = omega_0/t_R;
alpha_min = -omega_0/t_R;
alpha_hold = 0;

% reigion 1 = t/t_R 
% region 2 the difference is 1 so nothing needs to be added halleluja!
% region 3 = 1-((t-(delta_t-t_R))/t_R) 

Q_l = D*(omega_0/(2*pi));

p_l1 = (2*pi*(m_1+(J*alpha_max)))/D;
p_l2 = (2*pi*(m_2+(J*alpha_hold)))/D;
p_l3 = (2*pi*(m_3+(J*alpha_min)))/D;

Q_NL1 = Q_l*sqrt(p_s/(p_s-p_l1));
Q_NL2 = Q_l*sqrt(p_s/(p_s-p_l2));
Q_NL3 = Q_l*sqrt(p_s/(p_s-p_l3));

Q_NL_max = Q_NL1;

Q_r_min = (Q_NL_max*sqrt(p_r/p_s))*60000