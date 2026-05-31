%% Oppgave 1
clear; clc; close all; 
D_cyl = 100*10^(-3); %m
D_rod = 50*10^(-3); %m
A = pi*(D_cyl/2)^2; % m^2
Ar = pi*(D_rod/2)^2; % m^2
Aa = A-Ar; %m^2
Q_i = (39*10^(-3))/60; %m^3/s
v = (Q_i/Aa)* 10^3; % mm/s

%% Oppgave 2 retracting, assistive (negative)
clear; clc; close all;
D_cyl = 50*10^(-3); % m 
D_rod = 35*10^(-3); % m 
A = pi*(D_cyl/2)^2; % m^2
Ar = pi*(D_rod/2)^2; % m^2
Aa = A-Ar; %m^2
phi = Aa/A;
F_L = 7.1*10^3; % N
p_1 = 45*10^5; % Pa
p_2 = ((p_1-F_L/A)/phi)*10^(-5)

%% Oppgave 3 extracting, resistive
clear; clc; close all;
format long g
D_cyl = 63*10^(-3); % m 
D_rod = 40*10^(-3); % m 
A = pi*(D_cyl/2)^2; % m^2
Ar = pi*(D_rod/2)^2; % m^2
Aa = A-Ar; %m^2
phi = Aa/A;
p_1 = 159*10^5; % Pa
p_2 = 13*10^5; % Pa
F_L = 41.6*10^3; % N
eta_hmC = F_L/(A*p_1-p_2*A*phi);

%% Oppgave 4
clear; clc; close all;
format long g
D_r = 90*10^(-3); %m
L = 1243*10^(-3); %m
L_1 = 0; % m
L_2 = L-L_1; %m
E = 2.1 * 10^11;
I_2 = pi*D_r^4/64;
F_L = 736.2*10^3 % N
F_bck = (pi^2)*E*I_2/(L*L_2)
S = F_bck/F_L 
%% Oppgave 5
clear; clc; close all;
format long g
L_1 = 540*10^(-3); % m
L = 686*10^(-3); % m
L_2 = L-L_1;
S = 6;
F_L = 155.9*10^3; % N
F_bck = S*F_L % N
E = 2.1*10^11;
d_r = nthroot((F_bck* L*L_2 * 64 )/(pi^2*E *pi),4)*10^(-3); %mm

%% Oppgave 6
clear; clc; close all;
format long g 
V_1 = 16.4; % L
V_2 = 25.3; % L
p_1 = 78; % Bar
p_2 = V_1*p_1/V_2; 

%% Oppgave 7
clear; clc; close all;
format long g
n_L = 1.4; 
dV = 3.8; %L
p_min = 71*10^5; % Pa
p_max = 99*10^5; % Pa
p_L = 97*10^5; % Pa
p_0 = 64*10^5; % Pa

V_g_min = 1*dV/((p_max/p_min)^(1/n_L)-1);
V_g_max =  1*dV/(1-(p_max/p_min)^(1/n_L));
V_g_L = V_g_min*(p_max/p_L)^(1/n_L);
V_0 = (p_L/p_0)*V_g_L;


%% Oppgave 8
clear; clc; close all;
format long g
D_M = 1000*10^(-6); % m^3/rev
dM = 13; % rev
p_2 = 63*10^5; % Pa
p_1 = 85*10^5; % Pa
n_L = 1.4;
dV = dM*D_M
Vg_min = 1* dV/((p_1/p_2)^(1/n_L)-1);
Vg_max = 1* dV/(1 - (p_2/p_1)^(1/n_L)) % m^3
Vg_max_l = Vg_max * 10^3; % Liter / dm^3

%% Oppgave 6
V_2 = 21.1;
P_1 = 157 * 10^5;
P_2 = 49*10^5;
V_1 = P_2*V_2/P_1;