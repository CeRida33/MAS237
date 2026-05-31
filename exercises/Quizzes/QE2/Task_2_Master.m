%Task 2

% PMDC steady-state power → operating points, Solving for tau_L
clear; clc; format longG

% forsøk 1
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
%  Armature supply voltage (u_sA) = 126 Volt . 
%  Armature resistance (R_A) = 0.41 Ohm . 
%  DC Motor constant (K_Mphi) = 0.79 Wb . 
% Motor power (P) = 7448.6 W . 
% For this power, what is the torque load (tau_L) associated with the larger angular speed in N*m?


% Given
u_sA   = 126;         % V
R_A    = 0.41;        % ohm
K_Mphi = 0.79;        % SI (N·m/A and V·s/rad consistent)
P_req  = 7448.6;      % W

% Key motor line parameters
omega_NL = u_sA / K_Mphi;        % rad/s  (no-load speed)
tau_ST   = (K_Mphi * u_sA) / R_A; % N·m    (stall torque)

% Power parabola check
P_max = (tau_ST * omega_NL) / 4;  % W

% Discriminant factor for quadratic in omega
disc = 1 - 4*P_req/(tau_ST*omega_NL);
if disc < 0
    error('Requested power exceeds P_max (%.6g W). No real operating point.', P_max);
end
root = sqrt(disc);

% Two possible speeds for this power
omega_hi = 0.5*omega_NL*(1 + root);   % larger speed
omega_lo = 0.5*omega_NL*(1 - root);   % smaller speed

% Associated torques
tau_hi = P_req / omega_hi;            % N·m (smaller torque, larger speed)  <-- asked
tau_lo = P_req / omega_lo;            % N·m (larger torque, smaller speed)

% Also verify against the line tau = tau_ST*(1 - omega/omega_NL)
tau_hi_chk = tau_ST*(1 - omega_hi/omega_NL);
tau_lo_chk = tau_ST*(1 - omega_lo/omega_NL);

% Display
fprintf('omega_NL   = %.6f rad/s\n', omega_NL);
fprintf('tau_ST     = %.6f N·m\n',   tau_ST);
fprintf('P_max      = %.6f W\n\n',   P_max);

fprintf('Larger speed solution:\n');
fprintf('  omega_hi = %.6f rad/s\n', omega_hi);
fprintf('  tau_L    = %.6f N·m   (P/omega)\n', tau_hi);
fprintf('  check    = %.6f N·m   (line)\n\n', tau_hi_chk);

fprintf('Smaller speed solution (for reference):\n');
fprintf('  omega_lo = %.6f rad/s\n', omega_lo);
fprintf('  tau      = %.6f N·m   (P/omega)\n', tau_lo);
fprintf('  check    = %.6f N·m   (line)\n',   tau_lo_chk);






%% PMDC back-EMF at smaller-speed operating point, Solving for e_A
clear; clc; format longG

% forsøk 2
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 203 Volt .
% Armature resistance (R_A) = 0.56 Ohm . 
% DC Motor constant (K_Mphi) = 0.24 Wb .
% Motor power (P) = 12935.9 W . 
% For this power, 
% What is the back EMF (e_A) associated with the smaller angular speed in Volt?


% Given
u_sA   = 203;        % V
R_A    = 0.56;       % ohm
K_Mphi = 0.24;       % (SI-consistent torque/back-EMF constant)
P_req  = 12935.9;    % W

% Motor line
omega_NL = u_sA / K_Mphi;          % rad/s (no-load speed)
tau_ST   = (K_Mphi * u_sA) / R_A;  % N·m   (stall torque)

% Power parabola check
P_max = (tau_ST * omega_NL) / 4;   % W
if P_req > P_max
    error('Requested power %.6g W exceeds P_max %.6g W. No real operating point.', P_req, P_max);
end

% Quadratic discriminant for P = tau_ST*omega - (tau_ST/omega_NL)*omega^2
disc = 1 - 4*P_req/(tau_ST*omega_NL);
root = sqrt(disc);

% Two speeds; smaller uses the minus sign
omega_small = 0.5*omega_NL*(1 - root);
omega_large = 0.5*omega_NL*(1 + root);

% Back EMF e_A = K_Mphi * omega
eA_small = K_Mphi * omega_small;   % <-- asked value (Volt)
eA_large = K_Mphi * omega_large;   % (for reference)

% (Optional) torque check
tau_small = P_req / omega_small;
tau_large = P_req / omega_large;

% Display
fprintf('omega_NL = %.6f rad/s\n', omega_NL);
fprintf('tau_ST   = %.6f N·m\n',   tau_ST);
fprintf('P_max    = %.6f W\n\n',   P_max);

fprintf('Smaller-speed operating point:\n');
fprintf('  omega_small = %.6f rad/s\n', omega_small);
fprintf('  eA_small    = %.6f V\n',     eA_small);   % <-- ANSWER
fprintf('  tau_small   = %.6f N·m\n\n', tau_small);

fprintf('Larger-speed operating point (ref):\n');
fprintf('  omega_large = %.6f rad/s\n', omega_large);
fprintf('  eA_large    = %.6f V\n',     eA_large);
fprintf('  tau_large   = %.6f N·m\n',   tau_large);



%% solving for u_sA
clear; clc; format longG

% forsøk 3
% Permanent magnet DC motor (PMDC) in steady state (ss) .
% Consider a PMDC motor in steady state conditions (ss) .
% Armature resistance (R_A) = 0.92 Ohm . 
% DC Motor constant (K_Mphi) = 0.60 Wb . 
% Max motor power (P_max) = 4264 W . 
% What is the armature supply voltage (u_sA) in Volt?


RA    = 0.92;     % ohm
K     = 0.60;     % Wb (not needed for u, included for check)
Pmax  = 4264;     % W

% From Pmax = u^2/(4*RA)  ->  u = 2*sqrt(RA*Pmax)
u = 2*sqrt(RA*Pmax);

% Optional check using K:
tau_st   = (K*u)/RA;   % N·m
omega_NL = u/K;        % rad/s
Pmax_chk = tau_st*omega_NL/4;

fprintf('u_sA      = %.6f V\n', u);
fprintf('Check Pmax= %.6f W (given: %.6f W)\n', Pmax_chk, Pmax);



%% Solving for tau_L
clear; clc; format longG

% forsøk 4
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 219 Volt . 
% Armature resistance (R_A) = 0.79 Ohm . 
% DC Motor constant (K_Mphi) = 1.10 Wb . 
% Motor angular speed (w) = 101.7 rad/s . 
% What is the motor torque load (tau_L) in N*m?


u = 219;         % V
R = 0.79;        % ohm
K = 1.10;        % Wb (SI-consistent torque/back-EMF constant)
w = 101.7;       % rad/s

eA   = K*w;              % back EMF [V]
iA   = (u - eA)/R;       % armature current [A]
tauL = K*iA;             % load torque [N·m]

fprintf('eA   = %.6f V\n', eA);
fprintf('iA   = %.6f A\n', iA);
fprintf('tauL = %.6f N·m\n', tauL);  % ~149.168 N·m


%% Solving for e_A
clear; clc; format longG

% forsøk 5
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 226 Volt . 
% Armature resistance (R_A) = 0.96 Ohm . 
% DC Motor constant (K_Mphi) = 0.46 Wb . 
% Load torque (tau_L) = 71.3 N*m . 
% What is the induced armature voltage = back EMF (e_A) in Volt?

% Given
u_sA   = 162;      % V
R_A    = 0.31;     % ohm
K_Mphi = 0.56;     % SI-consistent torque/back-EMF constant
tau_L  = 71.3;     % N·m

% Armature current from torque: tau = K*i  ->  i = tau/K
i_A = tau_L / K_Mphi;              % A

% Back EMF from voltage balance: u = R*i + eA  ->  eA = u - R*i
eA  = u_sA - R_A * i_A;            % V   <-- asked value

% (Optional) speed check: eA = K*omega  ->  omega = eA/K
omega = eA / K_Mphi;               % rad/s

fprintf('i_A   = %.6f A\n',    i_A);
fprintf('e_A   = %.6f V\n',    eA);        % <-- ANSWER (~77.2 V)
fprintf('omega = %.6f rad/s\n', omega);



%% PMDC steady-state: solve motor current, Solving for i
clear; clc; format longG

% forsøk 6
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 160 Volt . 
% Armature resistance (R_A) = 0.57 Ohm . 
% DC Motor constant (K_Mphi) = 0.69 Wb . 
% Motor angular speed (w) = 161.9 rad/s . 
% What is the motor current (i) in A?


u = 188;      % V
R = 0.73;     % ohm
K = 0.23;     % Wb (SI-consistent torque/back-EMF constant)
w = 245.5;    % rad/s

eA = K*w;         % back EMF [V]
i  = (u - eA)/R;  % armature current [A]

fprintf('eA = %.6f V\n', eA);   % 111.711000 V
fprintf('i  = %.6f A\n', i);    % 84.717544 A



%% PMDC steady-state: torque from speed & voltage, Solving for tau_L
clear; clc; format longG

% forsøk 7
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 127 Volt . 
% Armature resistance (R_A) = 0.97 Ohm . 
% DC Motor constant (K_Mphi) = 0.39 Wb . 
% Motor angular speed (w) = 99.8 rad/s .
% What is the motor torque load (tau_L) in N*m?


u = 127;      % V
R = 0.97;     % ohm
K = 0.39;     % Wb (SI-consistent torque/back-EMF constant)
w = 99.8;     % rad/s

eA   = K*w;          % back EMF [V]
iA   = (u - eA)/R;   % armature current [A]
tauL = K*iA;         % load torque [N·m]  <-- answer

fprintf('eA   = %.6f V\n', eA);    % 38.922000
fprintf('iA   = %.6f A\n', iA);    % 90.802062
fprintf('tauL = %.6f N·m\n', tauL);% 35.412804
% (equivalently: tauL = (K*u - K^2*w)/R)


%% PMDC: solve armature resistance from P_max, Solving for R
clear; clc; format longG

% forsøk 8
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 144 Volt . 
% DC Motor constant (K_Mphi) = 0.56 Wb . 
% Max motor power (P_max) = 13846 W . 
% What is the armature resistance (R_A) in Ohm?


u     = 179;      % V
K     = 0.58;     % Wb (not needed to solve R, used for check)
P_max = 8764;    % W

R = u^2/(4*P_max);   % <-- answer

% Optional checks
tau_st   = (K*u)/R;  % stall torque
omega_NL = u/K;      % no-load speed
Pchk     = tau_st*omega_NL/4;

fprintf('R_A   = %.9f ohm\n', R);      % ~0.374404160
fprintf('Check P_max = %.6f W\n', Pchk); % ~13846 W



%% PMDC: solve armature supply voltage from P_max
clear; clc; format longG

% forsøk 9
% Permanent magnet DC motor (PMDC) in steady state (ss) .
% Consider a PMDC motor in steady state conditions (ss) .
% Armature resistance (R_A) = 0.91 Ohm . 
% DC Motor constant (K_Mphi) = 0.12 Wb .
% Max motor power (P_max) = 11334 W .
% What is the armature supply voltage (u_sA) in Volt?



RA   = 0.91;     % ohm
K    = 0.12;     % Wb (not needed for u, used for check)
Pmax = 11334;    % W

% From Pmax = u^2/(4*RA)
u = 2*sqrt(RA*Pmax);   % <-- answer

% Optional sanity checks
tau_st   = (K*u)/RA;   % stall torque
omega_NL = u/K;        % no-load speed
Pchk     = tau_st*omega_NL/4;

fprintf('u_sA   = %.9f V\n', u);       % ~203.115139761
fprintf('Check: P_max = %.6f W\n', Pchk); % ~11334.000000



%% PMDC steady-state: smaller speed for given power, Solving for w
clear; clc; format longG

% forsøk 10
% Permanent magnet DC motor (PMDC) in steady state (ss) .
% Consider a PMDC motor in steady state conditions (ss) .
% Armature supply voltage (u_sA) = 234 Volt . 
% Armature resistance (R_A) = 0.33 Ohm .
% DC Motor constant (K_Mphi) = 0.67 Wb . 
% Motor power (P) = 28001.6 W . 
% For this power, what is the smaller motor angular speed (w) in rad/s?


u = 162;        % V
R = 0.31;       % ohm
K = 0.56;       % Wb (SI-consistent torque/back-EMF constant)
P = 8651.3;    % W

omega_NL = u / K;           % rad/s
tau_ST   = (K*u) / R;       % N·m
P_max    = tau_ST*omega_NL/4;

disc = 1 - 4*P/(tau_ST*omega_NL);
if disc < 0
    error('Requested power exceeds P_max (%.6f W).', P_max);
end
root = sqrt(disc);

omega_small = 0.5*omega_NL*(1 - root);   % <-- answer
omega_large = 0.5*omega_NL*(1 + root);   % (reference)

fprintf('omega_small = %.6f rad/s\n', omega_small);  % ~75.079304
fprintf('omega_large = %.6f rad/s\n', omega_large);  % ~274.174428



%% PMDC: current at maximum power
clear; clc; format longG


% forsøk 11
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 122 Volt . 
% Armature resistance (R_A) = 0.81 Ohm . 
% DC Motor constant (K_Mphi) = 0.17 Wb . 
% What is the current (i) at maximum power (P_max) in A?


u = 130;     % V
R = 0.74;    % ohm
K = 0.26;    % Wb (not needed for i at Pmax)

i_Pmax = u/(2*R);   % <-- answer

% Optional sanity checks
tau_st   = (K*u)/R;   % stall torque
omega_NL = u/K;       % no-load speed
P_max    = tau_st*omega_NL/4;

fprintf('i_Pmax = %.9f A\n', i_Pmax);   % ~75.308641975
fprintf('P_max  = %.6f W (info)\n', P_max);



%% PMDC steady-state: supply voltage from w and tau_L
clear; clc; format longG


% forsøk 12
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature resistance (R_A) = 0.59 Ohm .
% DC Motor constant (K_Mphi) = 0.14 Wb .
% Motor angular speed (w) = 518.8 rad/s . 
% Load torque (tau_L) = 37.8 N*m .
% What is the armature supply voltage (u_sA) in Volt?


R = 0.57;      % ohm
K = 0.66;      % Wb (SI-consistent torque/back-EMF constant)
w = 231.4;     % rad/s
tauL = 93.7;   % N·m

i  = tauL / K;         % A
eA = K * w;            % V
u_sA  = R * i + eA;       % V  <-- answer

fprintf('i  = %.6f A\n', i);    % 270.000000
fprintf('eA = %.6f V\n', eA);   % 72.632000
fprintf('u_sA  = %.6f V\n', u_sA);    % 231.932000



%% PMDC steady state – solve R_A from U, K, omega, tau_L
% Equations: tau = K*i,  e = K*omega,  U = R_A*i + e  =>  R_A = (U - K*omega)/(tau/K)
clear; clc; format longG;


% forsøk 14
% Permanent magnet DC motor (PMDC) in steady state (ss) . 
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 122 Volt . 
% DC Motor constant (K_Mphi) = 1.00 Wb . 
% Motor angular speed (w) = 71.3 rad/s . 
% Load torque (tau_L) = 193.5 N*m . 
% What is the armature resistance (R_A) in Ohm?


% Given
U     = 122;     % V
K     = 1.00;    % Wb (N*m/A and V*s/rad)
omega = 71.3;    % rad/s
tau_L = 193.5;   % N*m

% Compute
i  = tau_L / K;          % A
e  = K * omega;          % V
RA = (U - e) / i;        % Ohm

fprintf('Armature resistance R_A = %.12f Ohm\n', RA);
fprintf('Check: i = %.6f A, e = %.6f V, U - R_A*i = %.6f V\n', i, e, U - RA*i);


%% PMDC steady state – solve omega from U, R_A, K, tau_L
% Equations: tau = K*i,  e = K*omega,  U = R*i + e
% => omega = (U - R*(tau/K)) / K
clear; clc; format longG;


% forsøk 15
% Permanent magnet DC motor (PMDC) in steady state (ss) .
% Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 174 Volt . 
% Armature resistance (R_A) = 0.83 Ohm . 
% DC Motor constant (K_Mphi) = 1.39 Wb . 
% Load torque (tau_L) = 96.4 N*m . 
% What is the motor angular speed (w) in rad/s?


% Given
U     = 174;    % V
R     = 0.83;   % Ohm
K     = 1.39;   % Wb (N*m/A and V*s/rad)
tau_L = 96.4;   % N*m

% Compute
i     = tau_L / K;               % A
omega = (U - R*i) / K;           % rad/s
e     = K*omega;                 % V (check)

fprintf('omega = %.12f rad/s\n', omega);
fprintf('Checks: i = %.6f A, e = %.6f V, U - R*i = %.6f V\n', i, e, U - R*i);


