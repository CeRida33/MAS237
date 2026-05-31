%% Q1 solutions for different variations
% ============================================================
% Q1: PWM on-time SEDC
% ============================================================
clear; clc;

KMphi_fun = @(iF, iF_kp, eA_kp0, wM0, m) ...
    (iF <= iF_kp) .* ((eA_kp0/iF_kp).*iF / wM0) + ...
    (iF >  iF_kp) .* ((m*(eA_kp0/iF_kp).*iF + (1-m)*(eA_kp0)) / wM0);


RA = 4.75;
LA = 0.170;
u_sF = 334;
RF = 98.2;
iF_kp = 3.74;
eA_kp0 = 243.2;
wM0 = 87.6;
m = 0.16;
wM = 103.5;
tauL = 45.3;
u_on = 421;

iF = u_sF / RF;
KMphi = KMphi_fun(iF,iF_kp,eA_kp0,wM0,m);

% Required average armature supply voltage
u_sA = KMphi*wM + (tauL*RA)/KMphi;

% Duty cycle
d = u_sA / u_on;

% Time constants
TA = LA / RA;
Ts = TA / 200;

T_on_ms = d * Ts * 1000

%fprintf('Q1: PWM on-time T_on = %.4f ms\n', T_on_ms);

%% ============================================================
% Q1: PMDC, PWM on-time 
% ============================================================
clear; clc; 

RA = 5.24;
LA = 0.390;
KMphi = 6.71;
wM = 76.6;
tauL = 401.3;
u_on = 1559;

% Required average supply voltage:
u_sA = KMphi*wM + tauL*RA/KMphi;

% PWM duty:
d = u_sA / u_on;

% Time constants:
TA = LA / RA;
Ts = TA / 200;

T_on_ms = d * Ts * 1000

%fprintf('Q1: PWM on-time T_on = %.4f ms\n', T_on_ms);

%% Q1
clc; clear;
% SHDC, controlled by PWM
%constant load tau_L
TA_Ts = 200;
R_A = 0.88; % Ohm
L_A = 30; % mH
R_F = 61.3; % ohm
i_Fkp = 2.91; % A
e_Akp0 = 112.9; % V
w_M0 = 56.6; % rad/s
m = 0.10;
w_M = 34.4; %rad/s
tau_L = 281.2; % Nm
u_on = 322; % V

% find T_on in ms

a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

C_phi = a/(R_F*w_M0);
Usakp = R_F * i_Fkp;
w_Mkp = 1/C_phi - (tau_L*R_A)/(C_phi^2*Usakp^2)

% sjekker om den er linær eller krummet
if w_M < w_Mkp
    U_sA = sqrt(tau_L*R_A)/(C_phi*(1-C_phi*w_M));
else
    K_sMphi = (b*(2*i_Fkp-c)^m)/w_M0;
    w_sM = (2*Usakp/K_sMphi)*(1-(tau_L*R_A/(2*Usakp*K_sMphi)));
    theta_kp = (w_sM-w_Mkp)/Usakp;
    U_sA = ((w_M - w_Mkp)/theta_kp)+Usakp
end

T_A = L_A/R_A;
T_S = T_A/TA_Ts;
dc = U_sA*100/u_on;
T_on = dc*T_S/100



%% Spørsmål 1 - DC motor speed control 3
% Seperately excited DC motor (SEDC)
clear; clc; 

% SEDC - slide 4..7
% DC general speed control - slide 9-17

% Constant tau_L

T_AT_s = 200 ; % PWM controlling supply voltage
R_A = 2.85 ; % Ohm (Armature resistance)
L_A = 116 * 10^(-3) ; % H, Armature inductance
u_sF = 567 ; % Volt, Field supply voltage
R_F = 216.9 ; % Ohm, Field resistance
i_F_kp = 2.74 ; % A, Knee point field current
e_A_kp0 = 481.2 ; % Volt, Knee point induced armature voltage
w_M0 = 114.7 ; %Rad/s, Induced armature voltage reference motor speed
m = 0.24 ; % Voltage shape factor
wM = 110.2 ; %Rad/s, motor angular speed
tau_L = 200.5 ; % N*m, Load torque
u_on = 948 ; % Volt, PWM on-voltage
% Find T_on in ms

%Ton = dc*ts/100
i_F = u_sF/R_F ; 


% Hvis i_F > i_F_kp så er det b*(i_F-c)^m
% Hvis i_F < i_F_kp så er det a*i_F
a = e_A_kp0/i_F_kp ;
b = e_A_kp0/(m*i_F_kp)^m  ;
c = (1-m)*i_F_kp ;

if i_F_kp < i_F
    e_A_iF = b*(i_F-c)^m 
else 
    e_A_iF = a*i_F
end



K_Mphi = e_A_iF/w_M0 ; 
U_sA = K_Mphi * wM + tau_L * R_A/K_Mphi ;
u_sA_min = tau_L * R_A/K_Mphi;
TA = L_A/R_A ;
Ts = TA/200 ; % eller TS = TA/20
dc = U_sA*100/u_on ;

Ton = dc*Ts/100 ;
Ton_ms = Ton*10^3

%% ============================================================
% Q1: SHDC, PWM, PWM duty cycle
clear; clc; close all;
format long g

TA_Ts = 200;
R_A = 3.64; % Ohm
L_A = 266*10^3; % H
R_F = 299.5; % ohm
i_Fkp = 2.02; % A
e_Akp0 = 429.4; % V
w_M0 = 94.3; % rad/s
m = 0.22;
w_M = 68.2; %rad/s
tau_L = 507.6; % Nm
u_on = 1089; % V

 a = e_Akp0/i_Fkp;
 c = (1-m)*i_Fkp;
 b = e_Akp0/(m*i_Fkp)^m;
 
C_phi = a/(R_F*w_M0);

U_sAkp = R_F*i_Fkp;

w_Mkp = 1/C_phi - (tau_L*R_A)/(C_phi^2*U_sAkp^2);
K_sMphi = (b*(2*i_Fkp-c)^m)/w_M0;

w_Ms = 2*U_sAkp/K_sMphi*(1-(tau_L*R_A)/(2*U_sAkp*K_sMphi));
theta_kp = (w_Ms-w_Mkp)/U_sAkp;

u_sA = (w_M-w_Mkp)/(theta_kp)+U_sAkp; % w_M > w_Mkp
%u_sA = sqrt((tau_L * R_A)/(C_phi*(1-C_phi*w_M))) %w_M <= w_Mkp

dc = (u_sA/u_on)*100 % in % 

%% ============================================================
clear; clc; close all;
format long g
%PMDC, speed control 3, constant load (tau_L)
%Finding d_c


TA_Ts = 200;
R_A = 3.41;     % Ohm
L_A = 79*10^3; % H
K_Mphi = 3.18;  %Wb
w_M = 36.2;     %rad/s
tau_L = 187.7;  % Nm
u_on = 530;     % V

%What is the PWM duty cycle (d_c) in % ?


u_sA = K_Mphi*w_M+(tau_L*R_A)/K_Mphi;

d_c =(u_sA/u_on)*100 %
