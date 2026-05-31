%% Spørsmål 1
clear; clc; close all;
format long g;
%Hydraulic cylinder, ideal, basic flow/speed relations.
%The cylinder is extracting (out stroke)

d_c = 200; %mm
d_r = 100; %mm
Q_o = 105; %l/min

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

%What is Q_i?
v = Q_o/(phi*A);
Q_i = v * A

%% Spørsmål 2
clear; clc; close all;
format long g;
%Hydraulic cylinder, ideal, basic pressure/force relations. 
% The cylinder is extracting (Out stroke). 
% The cylinder is subjected to an assistive (negative) load. 
% Cylinder diameter (d) = 250 mm. 
% Cylinder rod diameter (d_R) = 150 mm. 
% Cylinder rod side pressure (p_2) = 183 bar. 
% Cylinder piston side pressure (p_1) = 10 bar. 
% What is the cylinder load force (F_L) in kN?

d_c = 250*10^(-3); %m
d_r = 150*10^(-3); %m
p_2 = 183*10^5; %Pa
p_1 = 10*10^5; %Pa

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

F_L = ((p_2 * phi * A)-(p_1*A))*10^(-3)

%% Spørsmål 3
clear; clc; close all;
format long g;
%Hydraulic cylinder, basic pressure/force relations. 
% The cylinder is retracting (in stroke). 
% The cylinder is subjected to an assistive (negative) load. 
% Cylinder diameter (d) = 80 mm. 
% Cylinder rod diameter (d_R) = 50 mm. 
% Cylinder piston side pressure (p_1) = 52 bar. 
% Cylinder hydromechanical efficiency (eta_hmC) = 0.87. 
% Cylinder load force (F_L) = 22.8 kN. 
% What is the cylinder rod side pressure (p_2) in bar?

d_c = 80*10^(-3); %m
d_r = 50*10^(-3); %m
p_1 = 52*10^5; %Pa
eta_hmc = 0.87;
F_L = 22.8*10^(3); %N

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

F_C = F_L/(2-eta_hmc);
p_2 = ((p_1-(F_C/A))/phi)*10^(-5)

%% Spørsmål 4
clear; clc; close all;
format long g;
%Hydraulic cylinder, buckling, basic relations. 
% End mounted, steel rod. 
% Cylinder rod diameter (d_R) = 100 mm. 
% Cylinder base length (L_1) = 1974 mm. 
% Cylinder total length (L) = 2785 mm. 
% What is the cylinder buckling force (F_bck) in kN?

d_r = 100*10^(-3); %m
L_1 = 1974*10^(-3); %m
L = 2785*10^(-3); %m
L_2 = L-L_1; %m
E = 2.1*10^11; %Pa

I_2 = (pi*d_r^4)/64; %m^4


F_bck = ((pi^2*E*I_2)/(L*L_2))*10^(-3)

%% Spørsmål 5
clear; clc; close all;
format long g;
%Hydraulic cylinder, buckling, design considerations. 
% Foot mounted, steel rod. 
% Cylinder base length (L_1) = 0 mm. 
% Cylinder total length (L) = 122 mm. 
% Safety against buckling (S) = 6. 
% Cylinder load force (F_L) = 1450.1 kN. 
% What is the minimum cylinder rod diameter (d_R) in mm?

L_1 = 0*10^(-3); %m
L = 122*10^(-3); %m
L_2 = L-L_1; %m
S = 6;
F_L = 1450.1*10^3; %N
E = 2.1*10^11; %Pa

F_bck = S*F_L; %N
I_2 = (F_bck*L*L_2)/(E*pi^2); %m^4
d_r = (((I_2*64)/pi)^(1/4))*10^3  %mm

%% Spørsmål 6
clear; clc; close all;
format long g;
%Accumulator, basic relations.
%Isothermal process, 1 -> 2. 
% Final accumulator volume (V_2) = 21.2 l. 
% Initial accumulator pressure (p_1) = 157 bar.
% Final accumulator pressure (p_2) = 49 bar. 
% What is the initial accumulator gas volume (V_1) in l?

v_2 = 21.2; %l
p_1 = 157; %Pa
p_2 = 49; %Pa
v_1 = ((p_2*v_2)/p_1) %l

%% Spørsmål 7
clear; clc; close all;
format long g;
%Accumulator, design considerations I. 
%Compute accumulator preload (total) volume. 
% Accumulator polytropic coefficient (n_L) = 1.4. 
% Change in volume (DeltaV) = 4.7 l. 
% Accumulator minimum load pressure (p_min) = 63 bar. 
% Accumulator maximum load pressure (p_max) = 119 bar. 
% Accumulator load pressure (p_L) = 69 bar. 
% Accumulator preload pressure (p_0) = 57 bar. 
% What is the preload (total) accumulator gas volume (V_0) in l?

n_L = 1.4;
dV = 4.7; %l
p_min = 63*10^5; %Pa
p_max = 119*10^5; %Pa
p_L = 69*10^5; %Pa
p_0 = 57*10^5; %Pa

Vg_min = 1*dV/((p_max/p_min)^(1/n_L)-1);
Vg_max = 1*dV/(1-(p_max/p_min)^(1/n_L));
Vg_L = Vg_min*(p_max/p_L)^(1/n_L);
V_0 = (p_L/p_0)*Vg_L

%% Spørsmål 8
clear; clc; close all;
format long g;
%Accumulator, design considerations II. 
% Accumulator connected to ideal motor. 
% Motor compressing accumulator in adiabatic process. 
% Motor displacement (D) = 500 cm^3/rev. 
% Motor revolutions during process (DeltaI_M) = 11 rev. 
% Initial accumulator pressure (p_1) = 51 bar. 
% Final accumulator pressure (p_2) = 67 bar. 
% Accumulator polytropic coefficient (n_L) = 1.4. 
% What is the final accumulator gas volume (V_2) in l?

D = 500*10^(-6); %rev/s
dIM = 11; %rev
p_1 = 51*10^5; %Pa
p_2 = 67*10^5; %Pa
n_L = 1.4;

dV = D*dIM;

Vg_min = 1* dV/((p_2/p_1)^(1/n_L)-1)
Vg_max = 1* dV/(1 - (p_1/p_2)^(1/n_L)) %m^3 tilhører p1
Vg_min_l = Vg_min* 10^3 % Liter



