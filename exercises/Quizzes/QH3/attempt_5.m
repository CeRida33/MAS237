%% Question 1
clear; clc; close all;
format long g;

rho = 881;
a_d = 36*10^(-6);
p_b = 6*10^5;
p_a = 13*10^5;
Q = 78/60000;

c_d = Q/(a_d*sqrt((2/rho)*(p_a-p_b)))

%% Question 2
clear; clc; close all;
format long g;
%position a
rho = 885;
c_d = 0.80;
a_d = 8.0*10^(-6);
Pp = 17*10^5;
p_a = 11*10^5;
p_b = 9*10^5;
p_t = 0*10^5;

Q_bt = (c_d*a_d*sqrt((2/rho)*(p_b-p_t)))*60000

%% Question 3
clear; clc; close all;
format long g;

rho = 869; %kg/m^3
c_d = 0.59;
x_max = 10*10^(-3); %m
x = 9.5 *10^(-3); %m
a_dmax = 8.0*10^(-6); %m^2
Q_BT = 6.8/60000; %m^3/s

dp_BT = ((Q_BT*x_max)/(c_d*a_dmax*x))^2*(rho/2);
dp_BT_bar = dp_BT*10^(-5)


%% Question 4
%figur 3.4 b
clear; clc; close all;
format long g;

rho = 880; %kg/m^3
c_d = 0.92; 
a_d = 11*10^(-6); %m^2
p_cr = 250*10^5; %Pa
p_b = 20*10^5; %Pa
p_t = 0; 
Q_in = 190/60000; %l/s


p_a = ((Q_in/(c_d*a_d))^2*(rho/2))+p_t

p_b+p_cr

%p_a ikke lik p_b + p_cr dermed er 

Q_1 = 0;

%% Question 5
%figur 3.5 (right)
clear; clc; close all;
format long g;

d_c = 250*10^(-3); %m
d_r = 150*10^(-3); %m
F_L = 949.6*10^3; %N
rho = 884; %kg/m^3
c_d = 0.93;
Q_in = 540/60000; %l/s
a_dPB = 129*10^(-6); %m^2
a_dAT = 70*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in;
p_t =  0;


p_a = (rho/2)*(Q_out/(c_d*a_dAT))^2;


%Mp = Dp * (pb-pa)/2*pi
%p_b = (F_L*2*pi/Dp)+pa;
%pp = (rho/2)*(Q_in/(c_d*a_dAT))^2+p_b


%% Question 6
%figure 3.6 (right)
clear; clc; close all;
format long g;


D = 1000*10^(-6); %m^3/rev
M_L = 4609; %Nm
rho = 881; %kg/m^3
c_d = 0.66;
Q_in = 1043/60000; %m^3/s
a_dPB = 432*10^(-6); %m^2
a_dAT = 102*10^(-6); %m^2
Q_out = Q_in;



p_a  = (rho/2)*(Q_out/(c_d*a_dAT))^2;
p_a*10^(-5)

%% Question 7
clear; clc; close all;
format long g;

rho = 866; %kg/m^3
c_d = 0.76;
a_dmax_PA = 35*10^(-6); %m^2
a_dmax_BT = 29*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 8.0*10^(-3); %m
D = 710*10^(-6); %m^3/rev
eta_vm = 0.98;
eta_hmM = 0.83;
M_L = 1921; %Nm
Q_in = 59/60000; %l/s


%positive load

n = eta_vm*(Q_in/D)*60

%% Question 8
clear; clc; close all;
format long g;
%figure 3.8 b

rho = 867; %kg/m^3
c_d = 0.57;
a_dmax_PA = 34*10^(-6); %m^2
a_dmax_BT = 28*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 2.7*10^(-3); %m
d_cyl = 200*10^(-3);%m
d_rod = 125*10^(-3); %m
eta_hmC = 0.95;
F_L = 46.6*10^3; %N
alpha = 4.0;
p_cr = 40*10^5; %Pa
Q_in = 13/60000; %l/s


%what is P_a in bar?

A = pi*(d_cyl/2)^2;
A_r = (pi*(d_rod/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

p_eq = (F_L)/((2-eta_hmC)*A);
k_BT = c_d * (x/x_max)*a_dmax_BT*sqrt(2/rho);
p_b = ((phi*Q_in)/k_BT)^2;
p_bu = ((p_cr + (alpha*p_eq) + ((1+alpha)*p_b))/(1+(phi*alpha)));
p_A = ((phi*p_bu)-p_eq)*10^(-5);

p_bu*10^(-5);