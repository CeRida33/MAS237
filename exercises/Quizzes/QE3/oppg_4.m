%% Q4 solutions for different variations
%% ============================================================
% Q4: SEDC, find motor speed w
clear; clc;
KMphi_fun = @(iF, iF_kp, eA_kp0, wM0, m) ...
    (iF <= iF_kp) .* ((eA_kp0/iF_kp).*iF / wM0) + ...
    (iF >  iF_kp) .* ((m*(eA_kp0/iF_kp).*iF + (1-m)*(eA_kp0)) / wM0);

u_sA = 771;
RA = 4.08;
u_sF = 699;
RF = 353.1;
iF_kp = 2.15;
eA_kp0 = 504.8;
wM0 = 89.3;
m = 0.24;
tauL = 689.8;

iF = u_sF / RF;
KMphi = KMphi_fun(iF,iF_kp,eA_kp0,wM0,m);

% Speed:
w = (u_sA/KMphi) - (tauL*RA)/(KMphi^2);

fprintf('Q4: Motor speed w = %.4f rad/s\n', w);
%% ============================================================
%Finding i_A
%SHDC
clc; clear;

% --- Given values (SHDC, SEDC & SHDC motors 1) ---
u_sA   = 976;     % V    (armature supply voltage)
R_A    = 4.84;    % Ohm  (armature resistance)
R_F    = 355.3;   % Ohm  (field resistance)
i_Fkp = 2.65;    % A    (knee-point field current)
e_Akp0 = 724.7;  % V    (knee-point induced armature voltage)
w_M0   = 73.0;    % rad/s (reference motor speed, w_M(0))
m      = 0.13;    % (-)  (induced armature voltage shape factor)
w_M    = 22.0;    % rad/s (motor angular speed)

% Find i_A

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

tau_L = ((u_sA-K_Mphi*w_M)*K_Mphi)/R_A;

i_A = tau_L/K_Mphi

%% ============================================================
clear; clc; close all;
%SHDC
%find tau_L

u_sA   = 387;     % V    (armature supply voltage)
R_A    = 4.19;    % Ohm  (armature resistance)
R_F    = 99.4;    % Ohm  (field resistance)
i_Fkp = 3.57;     % A    (knee-point field current)
e_Akp0 = 242.9;   % V    (knee-point induced armature voltage)
w_M0   = 95.5;    % rad/s (reference motor speed, w_M(0))
m      = 0.16;    % (-)  (induced armature voltage shape factor)
w_M    = 71.1;    % rad/s (motor angular speed)

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

tau_L = ((u_sA-K_Mphi*w_M)*K_Mphi)/R_A

