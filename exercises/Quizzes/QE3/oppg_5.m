%% Q5 solutions for different variations
%% ============================================================
%SHDC motor (values only, no calculations)
%Finding tau_ST
clc; clear;

% Given (from problem text)
u_sA   = 274;     % V   - armature supply voltage
R_A    = 1.28;    % Ohm - armature resistance
R_F    = 90.9;   % Ohm - field resistance
i_Fkp  = 3.05;    % A   - knee-point field current
e_Akp0 = 198.9;   % V   - knee-point induced armature voltage at ref speed
w_M0   = 98.6;    % rad/s - induced armature voltage reference motor speed
m      = 0.10;    % (-) - induced armature voltage shape factor

% (Optional placeholders — keep as NaN; do NOT compute)

i_F = u_sA/R_F;

a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

tau_ST = (K_Mphi*u_sA)/R_A

%% ============================================================
%SEDC motor (values only, no calculations)
%Finding w_NL
clc; clear;

% Given (from problem text)
u_sA   = 697;     % V   - armature supply voltage
R_A    = 2.68;    % Ohm - armature resistance
u_sF   = 685;     % V
R_F    = 309.0;   % Ohm - field resistance
i_Fkp  = 2.19;    % A   - knee-point field current
e_Akp0 = 518.7;   % V   - knee-point induced armature voltage at ref speed
w_M0   = 96.7;    % rad/s - induced armature voltage reference motor speed
m      = 0.17;    % (-) - induced armature voltage shape factor

%What is the no-load speed (w_NL) in rad/s?

i_F = u_sF/R_F;

a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

w_NL = u_sA/K_Mphi