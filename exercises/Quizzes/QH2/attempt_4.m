%% Spørsmål 1
clear; clc; close all;
format long g;
%Hydraulic cylinder, ideal, basic flow/speed relations. 
% The cylinder is retracting. 
% Cylinder diameter (d) = 250 mm. 
% Cylinder rod diameter (d_R) = 150 mm. 
% Cylinder in-flow (Q_i) = 58 l/min. 
% What is the cylinder out-flow (Q_o) in l/min?

d_c = 250 *10^(-3);
d_r = 150*10^(-3);
Q_i = 58/60000;

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

%What is Q_o?
v = Q_i/(phi*A);
Q_o = (v*A)*60000

%% Spørsmål 2
clear; clc; close all;
format long g;
%Hydraulic cylinder, ideal, basic pressure/force relations. 
% The cylinder is retracting. 
% The cylinder is subjected to a resistive (positive) load. 
% Cylinder diameter (d) = 160 mm. 
% Cylinder rod diameter (d_R) = 100 mm. 
% Cylinder load force (F_L) = 161.5 kN. 
% Cylinder rod side pressure (p_2) = 151 bar. 
% What is the cylinder piston pressure (p_1) in bar?
d_c = 160*10^(-3); %m
d_r = 100*10^(-3); %m
p_2 = 151*10^5; %Pa
F_L = 161.5*10^3; %N

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

%F_c = p_2 * phi * A - p_1*A = F_L

p_1 = ((p_2*phi) - (F_L/A))*10^(-5);

%% Spørsmål 3
clear; clc; close all;
format long g;
%Hydraulic cylinder, basic pressure/force relations . 
% The cylinder is extracting . 
% The cylinder is subjected to a resistive (positive) load . 
% Cylinder diameter (d) = 200 mm . 
% Cylinder rod diameter (d_R) = 100 mm . 
% Cylinder piston side pressure (p_1) = 220 bar .
%  Cylinder rod side pressure (p_2) = 19 bar . 
% Cylinder load force (F_L) = 595.1 kN . 
% What is the cylinder hydromechanical efficiency (eta_hmC)?

d_c = 200*10^(-3); %m
d_r = 100*10^(-3); %m
p_1 = 220*10^5; %Pa
p_2 = 19*10^5; %Pa
F_L = 595.1*10^3; %N

A = (pi*(d_c/2)^2); %m^2
A_r = (pi*(d_r/2)^2); %m^2
A_a = A-A_r; % m^2
phi = A_a/A; % m^2

eta_hmC = F_L/(A*p_1-p_2*A*phi)

%% Spørsmål 4
clear; clc; close all;
format long g;
%Hydraulic cylinder, buckling, basic relations . 
% Foot mounted, steel rod . 
% Cylinder rod diameter (d_R) = 90 mm . 
% Cylinder base length (L_1) = 0 mm . 
% Cylinder total length (L) = 707 mm . 
% What is the cylinder buckling force (F_bck) in kN?

d_r = 90*10^(-3); %m
L_1 = 0*10^(-3); %m
L = 707*10^(-3); %m
L_2 = L-L_1; %m
E = 2.1*10^11; %Pa

I_2 = (pi*d_r^4)/64; %m^4


F_bck = ((pi^2*E*I_2)/(L*L_2))*10^(-3)

%% Spørsmål 5
clear; clc; close all;
format long g;
%Hydraulic cylinder, buckling, design considerations . 
% End mounted, steel rod . 
% Cylinder base length (L_1) = 1304 mm . 
% Cylinder total length (L) = 1603 mm . 
% Safety against buckling (S) = 3 . 
% Cylinder load force (F_L) = 704.0 kN . 
% What is the minimum cylinder rod diameter (d_R) in mm?

L_1 = 1304*10^(-3); %m
L = 1603*10^(-3); %m
L_2 = L-L_1; %m
S = 3;
F_L = 704*10^3; %N
E = 2.1*10^11; %Pa

F_bck = S*F_L; %N
I_2 = (F_bck*L*L_2)/(E*pi^2); %m^4
d_r = (((I_2*64)/pi)^(1/4))*10^3  %mm

%% Spørsmål 6
clear; clc; close all;
format long g;
%Accumulator, basic relations . 
% Isothermal process, 1 -> 2 . 
% Initial accumulator volume (V_1) = 11.7 l . 
% Initial accumulator pressure (p_1) = 23 bar . 
% Final accumulator pressure (p_2) = 156 bar . 
% What is the final accumulator gas volume (V_2) in l?

v_1 = 11.7; %l
p_1 = 23; %Pa
p_2 = 156; %Pa
v_2 = ((p_1*v_1)/p_2) %l

%% Spørsmål 7
clear; clc; close all;
format long g;
%Accumulator, design considerations I . 
% Compute accumulator preload (total) volume . 
% Accumulator polytropic coefficient (n_L) = 1.4 . 
% Change in volume (DeltaV) = 4.3 l . 
% Accumulator minimum load pressure (p_min) = 51 bar .
%  Accumulator maximum load pressure (p_max) = 72 bar . 
% Accumulator load pressure (p_L) = 57 bar . 
% Accumulator preload pressure (p_0) = 46 bar . 
% What is the preload (total) accumulator gas volume (V_0) in l?

n_L = 1.4;
dV = 4.3; %l
p_min = 51*10^5; %Pa
p_max = 72*10^5; %Pa
p_L = 57*10^5; %Pa
p_0 = 46*10^5; %Pa

Vg_min = 1*dV/((p_max/p_min)^(1/n_L)-1);
Vg_max = 1*dV/(1-(p_max/p_min)^(1/n_L));
Vg_L = Vg_min*(p_max/p_L)^(1/n_L);
V_0 = (p_L/p_0)*Vg_L

%% Spørsmål 8
clear; clc; close all;
format long g;
%Accumulator, design considerations II . 
% Accumulator connected to ideal cylinder (piston side) . 
% Cylinder compressing accumulator in adiabatic process . 
% Cylinder diameter (d) = 160 mm . Cylinder travel during 
% process (DeltaX_C) = 489 mm . 
% Initial accumulator pressure (p_1) = 78 bar . 
% Final accumulator pressure (p_2) = 112 bar . 
% Accumulator polytropic coefficient (n_L) = 1.4 . 
% What is the final accumulator gas volume (V_2) in l?

d = 160*10^(-3); %m
dxc = 489*10^(-3); %m
p_1 = 78*10^5; %Pa
p_2 = 112*10^5; %Pa
n_L = 1.4;

A = (pi*(d/2)^2); %m^2
dV = A*dxc;

Vg_min = 1* dV/((p_2/p_1)^(1/n_L)-1)
Vg_max = 1* dV/(1 - (p_1/p_2)^(1/n_L)) %m^3 tilhører p1
Vg_min_l = Vg_min* 10^3 % Liter