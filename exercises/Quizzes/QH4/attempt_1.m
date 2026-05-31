% A = pi*(d_c/2)^2;
% A_r = (pi*(d_r/2)^2); %m^2
% A_a = A-A_r; %m^2 (total area when the rod is removed)
% phi = A_a/A; %m^2

%% Task 1
clear; clc; close all;
format long g;
%Figure Q 4.8
%Extracting cylinger with an assistive load (negative)

%Variabler
D_max = 23*10^(-6); % m^3/rev
n = 1120/60; %rev/sek
eta_vp = 0.92; 
P_cr_m = 240*10^5; %Pa
rho = 875; %kg/m^3
c_d = 0.70;
A_dmax_PA = 18*10^(-6); %m^2
A_dmax_BT = 18*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 7.5*10^(-3); %m
alpha = 1.7;
p_cr = 240*10^5; %Pa

d_c = 50*10^(-3); %m
d_r = 25*10^(-3); %m

eta_hmc = 0.92;
FL = 34*10^3; %N

p_set = 19*10^5; %Pa

%oppgavens informasjon gir oss at vi må se på figur Q 4.4
%Starten av utregninger
A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2


%Vi skal finne P_bu men først må vi finne Q_in

K_PA = c_d*(x/x_max)*A_dmax_PA*sqrt(2/rho);
K_BT = c_d*(x/x_max)*A_dmax_BT*sqrt(2/rho);

P_eq = FL/((2-eta_hmc)*A);

%P_in = pp = p_set pga figur 4.8
a = ((1+phi*alpha)*p_set) + (P_eq-phi*p_cr);
b = ((1+alpha)*phi^3*K_PA^2)+((1+phi*alpha)*K_BT^2);

Q_in = K_PA*K_BT*sqrt(a/b);
p_b = ((phi*Q_in)/K_BT)^2;

p_bu = (p_cr+alpha*P_eq+(1+alpha)*p_b)/(1+phi*alpha);
p_bu_bar = p_bu*10^(-5)



%% Task 2
clear; clc; close all;
%Figure 4.10
beta = 1382 * 10^6; %Pa
D = 160*10^(-6); %m^3/rev
V_L = 0.81*10^(-3); %l
J = 2.70; %Kg*m^2


K_theta = (beta*D^2)/(pi^2*(D+V_L));

omega_n = (sqrt(K_theta/J)*3)/(2*pi) %F_V @90deg in Hz

%% Task 3
clear; clc; close all;
%figure 4.12

D = 500*10^(-6); %m^3/rev
J = 15.20; %kg/m^2
p_s = 250*10^5; %Pa
delta_theta = 81.5; %rad
delta_t = 5.258; %s
t_R = 1.202; %s
m_1 = 97; %Nm
m_2 = 251; %Nm
m_3 = 661; %Nm
t = 0.868; %s

%What is the no-load flow (Q_NL) at the considered time (t) in l/min?

sigma = t_R/delta_t;
omega_0 = delta_theta/(delta_t-t_R);
alpha_max = omega_0/t_R;
alpha_min = -omega_0/t_R;

% 1-((t-(delta_t-t_R))/t_R) is for if t is in region 3
% t/t_R if in reigion 1
%1 for region 2

r1 = t/t_R;

Q_l = (r1)*D*(omega_0/(2*pi));
p_l = ((2*pi*(m_1+(J*alpha_max)))/D);

Q_NL = (Q_l*sqrt(p_s/(p_s-p_l)))*60000

%% Task 4
clear; clc; close all;
%figure 4.11
d_c = 40*10^(-3); %m
d_r = 20*10^(-3); %m

m = 961; %kg

p_s = 250*10^5; %Pa
p_r = 10*10^5; %Pa

delta_s = 384*10^(-3); %m
delta_t = 0.694; %s

t_R = 0.143; %s
F_1 = 10.6*10^3; %N
F_2 = 6.65*10^3; %N
F_3 = -12.16*10^3; %N

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

%Starting by finding V, and a_max and a_min aswell as sigma

sigma = t_R/delta_t;
v_0 = delta_s/(delta_t-t_R); %m/s
a_max = v_0/t_R; %m/s^2
a_min = -v_0/t_R; %m/s^2

%Compute w_NL
Q_Lt = A_a*v_0;
P_l1 = (F_1 + (m*a_max))/A_a;
P_l2 = F_2/A_a;
P_l3 = (F_3 + (m * a_min))/A_a;

%Square root of each section in their own varaible to not get syntax fail

s1 = p_s/(p_s-P_l1);
s2 = p_s/(p_s-P_l2);
s3 = p_s/(p_s-P_l3);


Q_NL1 = Q_Lt*sqrt(s1)
Q_NL2 = Q_Lt*sqrt(s2)
Q_NL3 = Q_Lt*sqrt(s3)

Q_NL_max = Q_NL1
Q_r_min = (Q_NL_max*sqrt(p_r/p_s))*60000
%What is the minimum required valve flow (Q_r,min) in l/min?
