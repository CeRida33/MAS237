%% Question 1
clear; clc; close all;
format long g;

rho = 883; %kg/m^3
c_d = 0.84;
A_d = 11*10^(-6); %m^27
p_b = 9*10^5;
p_a = 61*10^5;
delta_p = p_a-p_b;
Q = (c_d*A_d*sqrt((2/rho)*delta_p))*60000

%% Question 2
clear; clc; close all;
format long g;

rho = 872; %kg/m^3
C_d = 0.72;
A_d = 16*10^(-6); %m^2
Q_PA = 20/60000; %l/s

dp_PA = ((Q_PA/(C_d*A_d))^2 *(rho/2))*10^(-5)

%% Question 3
clear; clc; close all;
format long g;


rho = 873; %kg/m^3
c_d = 0.88;
x_max = 10*10^(-3); %m
a_dmax = 12*10^(-6); %m^2
p_P = 17*10^5; %Pa
p_A = 6*10^5; %Pa
p_B = 8*10^5; %Pa
p_T = 0*10^5; %Pa
Q_PA = 28/60000; %m^3/s

x = (Q_PA*x_max)/(c_d*a_dmax*sqrt((2/rho)*(p_P-p_A)))*10^3

%% Question 4
clear; clc; close all;
format long g;
%figur 3.4 d

rho = 873; %kg/m^3
c_d1 = 0.94;
a_d1 = 19*10^(-6); %m^2
c_d2 = 0.94;
a_d2 = 33*10^(-6); %m^2
p_0 = 10*10^5; %Pa
Q_0 = 40/60000; %l/s
p_cl = 50*10^5; %pa
Q_in = 119/60000; %l/s
p_T = 0 *10^5; %Pa

p_b = (Q_in/(c_d1*a_d1))^2 * (rho/2);
p_bar = p_b * 10^(-5) %P_b >= p_cl

%% Question 5
clear; clc; close all;
format long g;
%figure 3.5 left

d_c = 50*10^(-3); %m
d_r = 25*10^(-3); %m
F_L = 18.0*10^3; %N
rho = 878; %kg/m^3
c_d = 0.72;
Q_in = 21/60000; %l/s Q_pb
a_dPA = 9.9*10^(-6); %m^2
a_dBT = 6.6*10^(-6); %m^2

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in; %Qat
p_t =  0;


v = (Q_in)/A *10^3

%% Question 6
%figure 3.6 (right)
clear; clc; close all;
format long g;


D = 250*10^(-6); %m^3/rev
M_L = 556; %Nm
rho = 875; %kg/m^3
c_d = 0.74;
Q_in = 260/60000; %m^3/s
a_dPB = 78*10^(-6); %m^2
a_dAT = 31*10^(-6); %m^2
Q_out = Q_in;



p_a  = (rho/2)*(Q_out/(c_d*a_dAT))^2;
p_m = ((M_L*2*pi)/D);

p_b = p_a-p_m;
p_b_bar = p_b * 10^(-5) %sjekk for å se at P-p blir større enn p_b

P_p = ((Q_in/(c_d*a_dPB))^2*(rho/2)+p_b)*10^(-5)

%% Question 7
clear; clc; close all;
format long g;
%figure 3.7 b
%resistive (positive) load

rho = 882; %kg/m^3
c_d = 0.78;
a_dmax_PA = 26*10^(-6); %m^2
a_dmax_BT = 29*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 6.7*10^(-3); %m
d_c = 80*10^(-3);%m
d_r = 50*10^(-3);%m
eta_hmC = 0.96;
F_L = 59.8*10^3; %N
Q_in = 33/60000; %l/s

A = pi*(d_c/2)^2;
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

Q_out = phi*Q_in; %Qat
p_t =  0;

K_BT = c_d*(x/x_max)*a_dmax_BT*sqrt(2/rho);
P_b = ((phi*Q_in)/K_BT)^2;
P_b*10^(-5)

%% Question 8
clear; clc; close all;
format long g;
%figure 3.8 a

rho = 873; %kg/m^3
c_d = 0.93;
a_dmax_PA = 39*10^(-6); %m^2
a_dmax_BT = 38*10^(-6); %m^2
x_max = 10*10^(-3); %m
x = 4.9*10^(-3); %m
D = 125*10^(-6); %m^3/rev
eta_vm = 0.96;
eta_hmM = 0.98;
M_L = 275; %Nm
alpha = 2.4;
p_cr = 230*10^5; %Pa
Q_in = 45/60000; %l/s


%what is n in rev/min?

n = (Q_in/(eta_vm*D))*60

