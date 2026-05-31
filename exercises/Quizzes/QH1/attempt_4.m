clear; clc; close all;

%% question 1
clear; clc; close all;
D_p = 90*10^(-6); %m^3/rev
M_P = 87 %Nm
P_PS_P = 16.2 * 10^3 %W

%What is Q_P?
delta_p = (M_P*2*pi)/D_p; %Pa
Q_P = (P_PS_P/delta_p)*60000 %l/min

%% question 2
clear; clc; close all;
P_PS_P1 = 15.1 * 10^3; %W
delta_p1 = 172*10^5; %Pa
eta_vp = 0.97;
eta_hmp = 0.94; 

Qtp= (P_PS_P1/delta_p1);
Q_p1 = (eta_vp*eta_hmp*Qtp)*60000

%% Question 3
clear; clc; close all;
D_max = 90*10^(-6); %m^3/rev
n1 = 1010.6/60; %rev/s
eta_vp1 = 0.96
Q_p2 = 66.8/60000 %m^3/s

D_1 = Q_p2/(eta_vp1*n1);
alpha = D_1/D_max

%% Question 4 ideal relations
clear; clc; close all;
delta_pm = 217*10^5; %Pa
M_M = 2083 %Nm
D_2 = ((M_M*2*pi)/delta_pm)*10^6 %cm^3/rev

%% Question 5 negative load
clear; clc; close all;
D_3 = 107*10^(-6); %m^3/rev
delta_pm1 = 293*10^5; %Pa = N/m^2
M_M1 = 573; %Nm

eta_hmM = (D_3*delta_pm1)/(2*pi*M_M1)

%% Question 6 Negative load
clear; clc; close all;
P_LM = 83*10^3; %W
n2 = 3196.4/60; %rev/s
D_4 = 32*10^(-6); %m^3/rev
eta_hmM1 = 0.93;
M_M2 = P_LM/(2*pi*n2); %Nm
delta_pm2 = ((M_M2*eta_hmM1*2*pi)/D_4)*10^(-5) %bar 

%% Question 7 ideal components
clear; clc; close all;
n_1 = 809.7/60;
D2 = 80*10^(-6);
n_2 = 121.5/60;
D1 = ((D2*n_2)/n_1)*10^6

%% Question 8 positive load
clear; clc; close all;
eta_vp2 = 0.87
eta_hmp1 = 0.88;
P_ML1 = 12*10^3;
eta_vm = 0.84;
eta_hmM2 = 0.87;
eta_tot = 0.87*0.88*0.84*0.87;

P_PS_P2 = (P_ML1/eta_tot)*10^-3


