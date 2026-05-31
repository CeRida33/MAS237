%% Question 1
clear; clc; close all;
format long g;

rho = 868;
a_d = 27*10^(-6);
p_b = 9*10^5;
p_a = 29*10^5;
Q = 60/60000;

c_d = Q/(a_d*sqrt((2/rho)*(p_a-p_b)))

%% Question 2
clear; clc; close all;
format long g;
rho = 882;
c_d = 0.79
a_d = 27*10^(-6);
Pp = 18*10^5;
p_a = 9*10^5;
p_b = 11*10^5;
p_t = 0*10^5;

Q_bt = (c_d*a_d*sqrt((2/rho)*(p_b-p_t)))*60000

%% Question 3
clear; clc; close all;
format long g;
rho = 871;
c_d = 0.92;
x_max = 10*10^(-3); %m
x = 7.6*10^(-3); %m
a_dmax = 24*10^(-6); %m^2
p_P = 24*10^5; %Pa
p_A = 7*10^5; %Pa
p_B = 21*10^5; %Pa
p_T = 0*10^5; %Pa

Q_bt = (c_d*a_dmax*(x/x_max)*sqrt((2/rho)*(p_B-p_T)))*60000

%% Question 4
clear; clc; close all;
format long g;

rho = 885;
c_d = 0.90
a_d = 9*10^(-6);
p_B = 20*10^5;
p_T = 0*10^5;
Q_in = 34/60000;

%p_a = 

Q_2 = c_d*a_d*sqrt((2/rho)*(p_a-p_T))

%% Question 5
clear; clc; close all;
format long g;

d_c = 50*10^(-3); %m
d_r = 25*10^(-3); %m
F_L = 32.6*10^3; %N
rho = 870; %kg/m^3
c_d = 0.62;
Q_in = 11/60000; %l/s Q_pb
a_dPA = 3.9*10^(-6); %m^2
a_dBT = 4.2*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in; %Qat
p_t =  0;


v = (Q_in)/A *10^3

%% Question 6
clear; clc; close all;
format long g;

D = 200*10^(-6); %m^2/rev
M_L = 905; %Nm
rho = 883; %kg/m^3
c_d = 0.52;
Q_in = 201/60000; %l/s = Q_out
a_dpa = 122*10^(-6); %m^2
a_dbt = 110*10^(-6); %m^2

p_a  = (rho/2)*(Q_in/(c_d*a_dpb))^2;