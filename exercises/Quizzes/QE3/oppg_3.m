%% Q3 solutions for different variations
%% =================================================
clc; clear;
%Finding u_sA for SEDC, DC motor speed control 1

% --- Given values (SEDC, DC motor speed control 1) ---
R_A    = 1.77;     % Ohm  (armature resistance)
u_sF   = 521;      % V     (field supply voltage)
R_F    = 113.5;    % Ohm  (field resistance)
i_Fkp = 3.58;     % A     (knee-point field current)
e_Akp0 = 286.3;   % V     (knee-point induced armature voltage)
w_M0 = 87.1;    % rad/s (induced armature voltage reference motor speed, w_M(0))
m      = 0.16;     % (-)   (voltage shape factor)
w_M    = 83.5;     % rad/s (motor angular speed)
P  = 7382;     % W     (motor output power)

% --- Unknown to be solved later ---
u_sA   = NaN;      % V     (armature supply voltage)
a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

i_F = u_sF/R_F; % A

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

tau_L = P/w_M;

u_sA = K_Mphi*w_M+(tau_L*R_A/(K_Mphi))

%% =================================================
clc; clear; close all;
%SEDC, Speed control 1, u_sA
%subjected to constant c_air, see figure Q7.1

% --- Given values (SEDC, DC motor speed control 1) ---
R_A    = 2.00;     % Ohm  (armature resistance)
u_sF   = 211;      % V     (field supply voltage)
R_F    = 169.8;    % Ohm  (field resistance)
i_Fkp = 1.01;      % A     (knee-point field current)
e_Akp0 = 167.1;    % V     (knee-point induced armature voltage)
w_M0 = 75.0;       % rad/s (induced armature voltage reference motor speed, w_M(0))
m      = 0.20;     % (-)   (voltage shape factor)
w_M    = 41.9;     % rad/s (motor angular speed)
c_Air = 107/10^3;        % mNmm*s^2 (non linear load dampener)

% --- Unknown to be solved later ---
%u_sA   = NaN;      % V     (armature supply voltage)
a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

i_F = u_sF/R_F; % A

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

tau_L = c_Air*w_M^2 ;

u_sA = K_Mphi*w_M+(tau_L*R_A/(K_Mphi))

%% =================================================
%SEDC, Speed control 1, u_sA
%subjected to a viscous dampener b, see figure Q7.1
clear; clc; close all;

% --- Given values (SEDC, DC motor speed control 1) ---
R_A    = 3.11;     % Ohm  (armature resistance)
u_sF   = 614;      % V     (field supply voltage)
R_F    = 156.3;    % Ohm  (field resistance)
i_Fkp = 3.93;      % A     (knee-point field current)
e_Akp0 = 400.7;    % V     (knee-point induced armature voltage)
w_M0 = 89.0;       % rad/s (induced armature voltage reference motor speed, w_M(0))
m      = 0.21;     % (-)   (voltage shape factor)
w_M    = 44.7;     % rad/s (motor angular speed)
b_visc = 13.61;        % N*s/m (viscous load dampener)


a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

i_F = u_sF/R_F; % A

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

tau_L = b_visc*w_M

u_sA = K_Mphi*w_M+(tau_L*R_A/(K_Mphi))