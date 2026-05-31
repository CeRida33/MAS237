% Task 1
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

%% Task 2 slide 12
clc; clear;
UsA  = 895;     % V
RA   = 5.51;    % ohm
wM   = 38.8;    % rad/s
tauL = 729.7;   % Nm

K = roots([wM, -UsA, tauL*RA])   % two solutions for K_Mphi

%% Task 3
clc; clear;

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

u_sA = K_Mphi*w_M+(tau_L*R_A/(K_Mphi));

%% Task 4
clc; clear;

% --- Given values (SHDC, SEDC & SHDC motors 1) ---
u_sA   = 859;     % V    (armature supply voltage)
R_A    = 3.87;    % Ohm  (armature resistance)
R_F    = 264.7;   % Ohm  (field resistance)
i_Fkp = 2.60;    % A    (knee-point field current)
e_Akp0 = 538.3;  % V    (knee-point induced armature voltage)
w_M0   = 80.8;    % rad/s (reference motor speed, w_M(0))
m      = 0.21;    % (-)  (induced armature voltage shape factor)
w_M    = 42.1;    % rad/s (motor angular speed)

% Find i_A

a = e_Akp0/i_Fkp;
b = e_Akp0/((m*i_Fkp)^m);
c = (1-m)*i_Fkp;

if i_F < i_Fkp
    e0A_iF = a*i_F;
else 
    e0A_iF = b*(i_F-c)^m;
end

K_Mphi = e0A_iF/w_M0;

i_A = (u_sA/R_A)-w_M/(K_Mphi*R_A);

