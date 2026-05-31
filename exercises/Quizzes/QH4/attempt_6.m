%% Task 1
clear; clc; close all;
format long g;
%Figure Q 4.8
%Extracting cylinger with an resistive load (positive)

%Variabler
D_max = 12*10^(-6); % m^3/rev
n = 1470/60; %rev/sek
eta_vp = 0.92; 
P_cr_m = 230*10^5; %Pa
rho = 875; %kg/m^3
c_d = 0.70;
A_dmax_PA = 16*10^(-6); %m^2
A_dmax_BT = 17*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 5.4*10^(-3); %m

d_c = 63*10^(-3); %m
d_r = 40*10^(-3); %m

eta_hmc = 0.92;
FL = 54.3*10^3; %N

p_set = 195*10^5; %Pa

%oppgavens informasjon gir oss at vi må se på figur Q 4.3
%Starten av utregninger
A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2


%Vi skal finne P_a men først må vi finne Q_in

K_PA = c_d*(x/x_max)*A_dmax_PA*sqrt(2/rho);
K_BT = c_d*(x/x_max)*A_dmax_BT*sqrt(2/rho);

P_eq = FL/(eta_hmc*A);

%P_in = pp = p_set pga figur 4.8
a = p_set - P_eq;
b = (phi^3*K_PA^2)+K_BT^2;

Q_in = K_PA*K_BT*sqrt(a/b);
p_b = ((phi*Q_in)/K_BT)^2;

p_a = ((phi*p_b)+P_eq)*10^(-5)


%% Task 2
clear; clc; close all;
%Figure 4.10
beta = 1254 * 10^6; %Pa
D = 710*10^(-6); %m^3/rev
V_L = 0.22*10^(-3); %l
J = 26.98; %Kg*m^2


K_theta = (beta*D^2)/(pi^2*(D+V_L));

omega_n = (sqrt(K_theta/J)*3)/(2*pi) %F_V @90deg in Hz

%% Task 3
clear; clc; close all;
%figure 4.12

D = 32*10^(-6); %m^3/rev
J = 0.31; %kg/m^2
p_s = 250*10^5; %Pa
delta_theta = 79.6; %rad
delta_t = 2.497; %s
t_R = 0.617; %s
m_1 = -48; %Nm
m_2 = 1; %Nm
m_3 = 14; %Nm
t = 0.712; %s

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