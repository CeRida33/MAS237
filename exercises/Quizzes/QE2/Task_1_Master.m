%Task 1

% Q6.1 – Step-load PMDC (Power for given dataset)
clear; clc; format longG


% Forsøk 1
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% The load torque can have two values, see Figure Q6.1 . 
% Armature supply voltage (u_sA) = 191 Volt . 
% Armature resistance (R_A) = 0.93 Ohm . 
% DC Motor constant (K_Mphi) = 0.65 Wb . 
% Speed where torque load changes (w_0) = 162.4 rad/s . 
% Lower load torque (tau_1) = 29.2 N*m . 
% Higher load torque (tau_2) = 76.5 N*m . 
% What is the motor power (P) in W?


% Given
U      = 159;      % V
R      = 0.33;     % Ohm
K      = 0.27;     % Wb (N·m/A and V·s/rad)
omega0 = 162.4;    % rad/s  (switch speed)
tau1   = 29.2;     % N·m    (LOW-speed load)
tau2   = 76.5;     % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point  (NOTE: τ1 for LOW speed, τ2 for HIGH speed)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    omega = omega0;  tau = tau_ST * (1 - omega0/omega_NL);  regime = "switch point omega = omega0";
end

% Power
P = tau * omega;

% Print results
fprintf("Regime: %s\n", regime);
fprintf("tau_ST = %.6f N*m,  omega_NL = %.6f rad/s\n", tau_ST, omega_NL);
fprintf("Operating point: tau = %.6f N*m,  omega = %.6f rad/s\n", tau, omega);
fprintf("Motor power P = tau * omega = %.6f W (≈ %.3f kW)\n", P, P/1000);


P


%% Q6.1 – Step-load PMDC (Current for given dataset; τ1 at low speed, τ2 at high speed)
clear; clc; format longG


% Forsøk 2
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% The load torque can have two values, see Figure Q6.1 . 
% Armature supply voltage (u_sA) = 147 Volt .
% Armature resistance (R_A) = 0.68 Ohm .
% DC Motor constant (K_Mphi) = 0.86 Wb . 
% Speed where torque load changes (w_0) = 79.6 rad/s .
% Lower load torque (tau_1) = 129.8 N*m . 
% Higher load torque (tau_2) = 164.6 N*m . 
% What is the motor current (i) in A?


% Given
U      = 147;      % V
R      = 0.68;     % Ohm
K      = 0.86;     % Wb (N·m/A and V·s/rad)
omega0 = 79.6;     % rad/s  (switch speed)
tau1   = 129.8;    % N·m    (LOW-speed load)
tau2   = 164.6;    % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point (τ1 valid if omega1 < omega0; τ2 valid if omega2 >= omega0)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    omega = omega0;  tau = tau_ST * (1 - omega0/omega_NL);  regime = "switch point omega = omega0";
end

% Current (two equivalent ways)
i1 = tau / K;               % from τ = K*i  -> i = τ/K
i2 = (U - K*omega) / R;     % from i = (U - e)/R with e = K*omega


% Print results
fprintf("Regime: %s\n", regime);
fprintf("tau_ST = %.6f N*m,  omega_NL = %.6f rad/s\n", tau_ST, omega_NL);
fprintf("Operating point: tau = %.6f N*m,  omega = %.6f rad/s\n", tau, omega);
fprintf("Motor current i = %.6f A  (cross-check (U - K*omega)/R = %.6f A)\n", i1, i2);


%% Linear PMDC – Pure viscous load (Current for given dataset)
clear; clc; format longG

% Forsøk 3
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) .
% Armature supply voltage (u_sA) = 225 Volt .
% Armature resistance (R_A) = 0.57 Ohm . 
% DC Motor constant (K_Mphi) = 0.55 Wb . 
% Viscous load damper (b_Visc) = 0.423 N*s/m .
% What is the motor current (i) in A?


% Given
U = 225;        % V
R = 0.57;       % Ohm
K = 0.55;       % N/A (also V*s/m)
b = 0.423;      % N*s/m

% Steady-state with viscous load only:
% i = U / ( R + K^2 / b )
i = U / ( R + (K^2)/b );

% Useful cross-checks
v = (K/b) * i;        % linear speed (m/s)
e = K * v;            % back-EMF (V)
check = U - R*i;      % should equal e

% Print results
fprintf("Motor current i = %.6f A\n", i);
fprintf("Speed v = %.6f m/s\n", v);
fprintf("Back-EMF e = %.6f V,  U - R*i = %.6f V\n", e, check);

i


%% Linear PMDC – Pure viscous load (Current for given dataset)
clear; clc; format longG


% Forsøk  4
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) .
% Armature supply voltage (u_sA) = 235 Volt . 
% Armature resistance (R_A) = 0.34 Ohm .
% DC Motor constant (K_Mphi) = 0.38 Wb .
% Viscous load damper (b_Visc) = 1.286 N*s/m . 
% What is the motor current (i) in A?


% Given
U = 235;        % V
R = 0.34;       % Ohm
K = 0.38;       % N/A (also V*s/m)
b = 1.286;      % N*s/m

% Steady-state with viscous load only:
% i = U / ( R + K^2 / b )
i = U / ( R + (K^2)/b );

% Useful cross-checks
v = (K/b) * i;        % linear speed (m/s)
e = K * v;            % back-EMF (V)
check = U - R*i;      % should equal e

% Print results
fprintf("Motor current i = %.6f A\n", i);
fprintf("Speed v = %.6f m/s\n", v);
fprintf("Back-EMF e = %.6f V,  U - R*i = %.6f V\n", e, check);

i


%% Q6.1 – Step-load PMDC (Current for given dataset; τ1 at low speed, τ2 at high speed)
clear; clc; format longG


% Forsøk 5
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) .
% The load torque can have two values, see Figure Q6.1 .
% Armature supply voltage (u_sA) = 159 Volt . 
% Armature resistance (R_A) = 0.55 Ohm . 
% DC Motor constant (K_Mphi) = 1.04 Wb . 
% Speed where torque load changes (w_0) = 61.7 rad/s . 
% Lower load torque (tau_1) = 209.6 N*m . 
% Higher load torque (tau_2) = 267.1 N*m . 
% What is the motor current (i) in A?


% Given
U      = 159;      % V
R      = 0.55;     % Ohm
K      = 1.04;     % Wb (N·m/A and V·s/rad)
omega0 = 61.7;     % rad/s  (switch speed)
tau1   = 209.6;    % N·m    (LOW-speed load)
tau2   = 267.1;    % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point (τ1 valid if omega1 < omega0; τ2 valid if omega2 >= omega0)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    omega = omega0;  tau = tau_ST * (1 - omega0/omega_NL);  regime = "switch point omega = omega0";
end

% Current (two equivalent ways)
i1 = tau / K;               % from τ = K*i  -> i = τ/K
i2 = (U - K*omega) / R;     % from i = (U - e)/R with e = K*omega

% Print results
fprintf("Regime: %s\n", regime);
fprintf("tau_ST = %.6f N*m,  omega_NL = %.6f rad/s\n", tau_ST, omega_NL);
fprintf("Operating point: tau = %.6f N*m,  omega = %.6f rad/s\n", tau, omega);
fprintf("Motor current i = %.6f A  (cross-check (U - K*omega)/R = %.6f A)\n", i1, i2);



%% Nonlinear (quadratic) load – PMDC steady state (Power for given dataset)
% Model: tau_load = c_air * omega^2,  tau_motor = K*i,  U = R*i + K*omega
% Steady-state -> solve c_air*omega^2 + (K^2/R)*omega - (K*U)/R = 0, pick omega>0
clear; clc; format longG


% Forsøk 6
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 139 Volt . 
% Armature resistance (R_A) = 0.30 Ohm .
% DC Motor constant (K_Mphi) = 0.53 Wb . 
% Non-linear load damper (cAir) = 12.738 mN*m*s^2 . 
% What is the motor power (P) in W?


% Given
U   = 153;          % V
R   = 0.46;         % Ohm
K   = 1.33;         % Wb (N*m/A and V*s/rad)
c_mNm_s2 = 22.465;  % mN*m*s^2  (quadratic aerodynamic load coeff)

% Units: convert mN*m*s^2 -> N*m*s^2
c_air = c_mNm_s2 * 1e-3;

% Quadratic coefficients: a*omega^2 + b*omega + c = 0
a = c_air;
b = (K^2)/R;
c = -(K*U)/R;

omega = (-b + sqrt(b^2 - 4*a*c)) / (2*a);   % positive physical root
tau   = c_air * omega^2;                     % load torque
P     = tau * omega;                         % mechanical power
i1    = tau / K;                             % current from torque balance
i2    = (U - K*omega)/R;                     % electrical cross-check

fprintf("omega = %.6f rad/s\n", omega);
fprintf("tau   = %.6f N*m\n", tau);
fprintf("Power P = %.6f W (≈ %.3f kW)\n", P, P/1000);
fprintf("Current i (tau/K) = %.6f A,  (U - K*omega)/R = %.6f A\n", i1, i2);

P


%% Q6.1 – Step-load PMDC (Current for given dataset; τ1 at low speed, τ2 at high speed)
clear; clc; format longG;


% Forsøk 7
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% The load torque can have two values, see Figure Q6.1 . 
% Armature supply voltage (u_sA) = 237 Volt . 
% Armature resistance (R_A) = 0.46 Ohm .
% DC Motor constant (K_Mphi) = 2.54 Wb .
% Speed where torque load changes (w_0) = 39.3 rad/s . 
% Lower load torque (tau_1) = 233.0 N*m . 
% Higher load torque (tau_2) = 500.8 N*m . 
% What is the motor current (i) in A?

% Given
U      = 237;      % V
R      = 0.46;     % Ohm
K      = 2.54;     % Wb (N·m/A and V·s/rad)
omega0 = 39.3;     % rad/s  (switch speed)
tau1   = 233.0;    % N·m    (LOW-speed load)
tau2   = 500.8;    % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point (τ1 valid if omega1 < omega0; τ2 valid if omega2 >= omega0)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    omega = omega0;  tau = tau_ST * (1 - omega0/omega_NL);  regime = "switch point omega = omega0";
end

% Current (two equivalent ways)
i1 = tau / K;               % from τ = K*i  -> i = τ/K
i2 = (U - K*omega) / R;     % from i = (U - e)/R with e = K*omega

% Print results
fprintf("Regime: %s\n", regime);
fprintf("tau_ST = %.6f N*m,  omega_NL = %.6f rad/s\n", tau_ST, omega_NL);
fprintf("Operating point: tau = %.6f N*m,  omega = %.6f rad/s\n", tau, omega);
fprintf("Motor current i = %.6f A  (cross-check (U - K*omega)/R = %.6f A)\n", i1, i2);


%% Nonlinear (quadratic) load – PMDC steady state (solve for omega)
% Model: tau_load = c_air * omega^2,  tau_motor = K*i,  U = R*i + K*omega
% Steady state => c_air*omega^2 + (K^2/R)*omega - (K/R)*U = 0  (pick omega > 0)
clear; clc; format longG;


% Forsøk 8
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) .
% Armature supply voltage (u_sA) = 156 Volt .
% Armature resistance (R_A) = 0.92 Ohm .
% DC Motor constant (K_Mphi) = 0.24 Wb . 
% Non-linear load damper (cAir) = 0.146 mN*m*s^2 . 
% What is the motor angular speed (w) in rad/s?

% Given
U   = 230;          % V
R   = 0.73;         % Ohm
K   = 1.64;         % Wb (N*m/A and V*s/rad)
cAir_mNm_s2 = 15.345; % mN*m*s^2  (quadratic aerodynamic load coeff)

% Units: convert mN*m*s^2 -> N*m*s^2
c_air = cAir_mNm_s2 * 1e-3;

% Quadratic coefficients: a*omega^2 + b*omega + c = 0
a = c_air;
b = (K^2)/R;
c = -(K/R)*U;

% Physical (positive) root
omega = (-b + sqrt(b^2 - 4*a*c)) / (2*a);

% Optional cross-checks
tau = c_air * omega^2;   % load torque = motor torque at ss
i1  = tau / K;           % from torque balance
i2  = (U - K*omega)/R;   % from electrical equation
P   = tau * omega;       % mechanical power (not asked, just FYI)

fprintf("omega = %.6f rad/s\n", omega);
fprintf("Checks: tau = %.6f N*m,  i(tau/K)=%.6f A,  i((U-Kw)/R)=%.6f A,  P=%.6f W\n", tau, i1, i2, P);


%% Q6.1 – Step-load PMDC (Angular speed for given dataset; τ1 at low speed, τ2 at high speed)
clear; clc; format longG;


% Forsøk 9
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) .
% The load torque can have two values, see Figure Q6.1 .
% Armature supply voltage (u_sA) = 159 Volt .
% Armature resistance (R_A) = 0.97 Ohm . 
% DC Motor constant (K_Mphi) = 0.68 Wb . 
% Speed where torque load changes (w_0) = 124.3 rad/s . 
% Lower load torque (tau_1) = 22.7 N*m .
% Higher load torque (tau_2) = 88.5 N*m . 
% What is the motor angular speed (w) in rad/s?


% Given
U      = 159;      % V
R      = 0.97;     % Ohm
K      = 0.68;     % Wb (N·m/A and V·s/rad)
omega0 = 124.3;    % rad/s  (switch speed)
tau1   = 22.7;     % N·m    (LOW-speed load)
tau2   = 88.5;     % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point (τ1 valid if omega1 < omega0; τ2 valid if omega2 >= omega0)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    omega = omega0;  tau = tau_ST * (1 - omega0/omega_NL);  regime = "switch point omega = omega0";
end

% Print result
fprintf("Regime: %s\n", regime);
fprintf("omega = %.12f rad/s\n", omega);


%% Q6.1 – Step-load PMDC (Power for given dataset; τ1 at low speed, τ2 at high speed)
clear; clc; format longG;


% Forsøk 10
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% The load torque can have two values, see Figure Q6.1 .
% Armature supply voltage (u_sA) = 207 Volt .
% Armature resistance (R_A) = 0.34 Ohm . 
% DC Motor constant (K_Mphi) = 0.36 Wb .
% Speed where torque load changes (w_0) = 339.4 rad/s . 
% Lower load torque (tau_1) = 32.0 N*m .
% Higher load torque (tau_2) = 153.7 N*m . 
% What is the motor power (P) in W?


% Given
U      = 207;      % V
R      = 0.34;     % Ohm
K      = 0.36;     % Wb (N·m/A and V·s/rad)
omega0 = 339.4;    % rad/s  (switch speed)
tau1   = 32.0;     % N·m    (LOW-speed load)
tau2   = 153.7;    % N·m    (HIGH-speed load)

% Motor line parameters
tau_ST   = K*U/R;      % stall torque
omega_NL = U/K;        % no-load speed

% Intersections of motor line with constant-load branches
omega1 = omega_NL * (1 - tau1/tau_ST);   % with τ = τ1
omega2 = omega_NL * (1 - tau2/tau_ST);   % with τ = τ2

% Choose consistent operating point (τ1 valid if omega1 < omega0; τ2 valid if omega2 >= omega0)
if omega1 < omega0
    omega = omega1;  tau = tau1;  regime = "tau = tau1 branch (low speed)";
elseif omega2 >= omega0
    omega = omega2;  tau = tau2;  regime = "tau = tau2 branch (high speed)";
else
    % Neither branch self-consistent → equilibrium at the switch
    omega = omega0;  
    tau   = tau_ST * (1 - omega0/omega_NL);  
    regime = "switch point omega = omega0";
end

% Power
P = tau * omega;

% Print results
fprintf("Regime: %s\n", regime);
fprintf("tau_ST = %.6f N*m,  omega_NL = %.6f rad/s\n", tau_ST, omega_NL);
fprintf("Operating point: tau = %.6f N*m,  omega = %.6f rad/s\n", tau, omega);
fprintf("Motor power P = tau * omega = %.6f W (≈ %.3f kW)\n", P, P/1000);

P



%% Linear PMDC – Pure viscous load (solve for omega)
% Model: K*i = b*omega,  U = R*i + K*omega  =>  omega = (U*K)/(K^2 + R*b)
clear; clc; format longG;


% Forsøk 14
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 232 Volt .
% Armature resistance (R_A) = 0.76 Ohm .
% DC Motor constant (K_Mphi) = 1.02 Wb .
% Viscous load damper (b_Visc) = 2.040 N*s/m . 
% What is the motor angular speed (w) in rad/s?

% Given
U = 231;        % V
R = 0.58;       % Ohm
K = 0.69;       % N·m/A  (also V·s/rad)
b = 0.257;      % N·m·s/rad

% Angular speed
omega = (U*K) / (K^2 + R*b);

% Cross-check via current
i = U / ( R + (K^2)/b );      % A
omega_check = (K/b) * i;      % should match omega
e = K*omega;                   % back-EMF
fprintf("omega = %.9f rad/s\n", omega);
fprintf("check: omega = %.9f rad/s, i = %.9f A, e = %.9f V, U - R*i = %.9f V\n", ...
         omega_check, i, e, U - R*i);



%% Linear PMDC – Pure viscous load (Power for given dataset)
% Model: K*i = b*omega,  U = R*i + K*omega
% => omega = (U*K)/(K^2 + R*b),  tau = b*omega,  P = tau*omega = b*omega^2
clear; clc; format longG;

%forsøk 24
% Linear DC motor . Consider a PMDC motor in steady state conditions (ss) . 
% Armature supply voltage (u_sA) = 139 Volt . 
% Armature resistance (R_A) = 0.45 Ohm .
% DC Motor constant (K_Mphi) = 0.43 Wb .
% Viscous load damper (b_Visc) = 0.454 N*s/m . 
% What is the motor power (P) in W?


% Given
U = 147;        % V
R = 0.54;       % Ohm
K = 0.17;       % N·m/A (also V·s/rad)
b = 0.017;      % N·m·s/rad (use same formula if linear: N·s/m)

% Solve
omega = (U*K) / (K^2 + R*b);  % rad/s
tau   = b * omega;            % N·m
P     = tau * omega;          % W

% Cross-checks
i  = U / ( R + (K^2)/b );
e  = K * omega;
P2 = K*i*omega;               % should equal P

fprintf("omega = %.6f rad/s\n", omega);
fprintf("tau   = %.6f N*m\n", tau);
fprintf("Power P = %.6f W (check K*i*omega = %.6f W)\n", P, P2);
fprintf("i = %.6f A,  e = %.6f V,  U - R*i = %.6f V\n", i, e, U - R*i);

P



