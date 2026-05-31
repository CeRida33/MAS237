%% question 1 ideal conditions
format short
clear; clc; close all;
D_cyl = 200 * 10^-3;
D_rod = 100 * 10^-3;
Q_o = 105/60000;
A = pi*(D_cyl/2)^2;
A_r = (pi*(D_rod/2)^2); %m^2
A_a = A-A_r; %m^2 (total area when the rod is removed)
phi = A_a/A; %m^2

v = Q_o/(A*phi);
Q_i = (v*A)*60000

%% Question 2 ideal conditions assistive load
clear; clc; close all;
d_cyl = 250 *10^(-3);
d_rod = 150*10^(-3);
p_2 = 183*10^5;
p_1 = 10*10^5;
A1 = pi*(d_cyl/2)^2;
A_r1 = (pi*(d_rod/2)^2); %m^2
A_a1 = A1-A_r1; %m^2 (total area when the rod is removed)
phi1 = A_a1/A1; %m^2


F_L = ((p_2 * phi1 * A1) - (p_1*A))*10^(-3) %kN

%% Question 3 Assistive load
clear; clc; close all;
d_cyl1 = 80 *10^(-3);
d_rod1 = 50 * 10^(-3);
A2 = pi*(d_cyl1/2)^2;
A_r2 = (pi*(d_rod1/2)^2); %m^2
A_a2 = A2-A_r2; %m^2 (total area when the rod is removed)
phi2 = A_a2/A2; %m^2
p1 = 52*10^5;
eta_hmC = 0.87;
FL = 22.8*10^3;

Fc = FL/(2-eta_hmC);
p2 = ((p1-(Fc/A2))/phi2)*10^(-5)

%% Question 4 Buckling
d_r = 100*10^(-3);
L_1 = 1974*10^(-3);
L = 2785*10^(-3);
F_bck = %kN

I2 = 

