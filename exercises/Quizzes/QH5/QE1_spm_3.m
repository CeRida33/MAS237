%% Variation 1
clear; clc

% Given (SI units)
i1   = 6.4;                   % A
N1   = 870;                   % turns
phi  = 225e-3;                % Wb (225 mWb)
l1   = 5.3e-2;                % m
mur1 = 37400;                 
l2   = 17.7e-2;               % m
mur2 = 21200;
A2   = 2.9e-4;                % m^2  (2.9 cm^2)
mu0  = 4*pi*1e-7;             % H/m

% Total reluctance from MMF and flux
Rtot = (N1*i1)/phi;

% Reluctance of section 2
R2 = l2/(mu0*mur2*A2);

% Solve for A1 from: Rtot = l1/(mu0*mur1*A1) + R2
A1 = l1/(mu0*mur1*(Rtot - R2));   % [m^2]

% Convert to cm^2
A1_cm2 = A1*1e4;

fprintf('A1 = %.6f m^2 = %.4f cm^2\n', A1, A1_cm2);


A1 = 0.000614 m^2 = 6.1407 cm^2


%% Variation 2
%figure 5.4
clear; clc

% Given (SI units)
i1 = 22; % A
i2 = 33; % A

N1 = 730; % turns
N2 = 170; % turns

l1 = 3.8e-2; % m
l2 = 17.7e-2;% m
l3 = 4347.3e-2;% m

mur2 = 49900;
mur3 = 41900; 
mu0 = 4*pi*1e-7; % H/m


A1 = 1.2e-4;% m^2
A2 = 5.8e-4; % m^2  (2.9 cm^2)
A3 = 12.1e-4;% m^2

%What is the magnetic flux (phi_1) in mWb = milliWb?

% Reluctance of section 2
R2 = l2/(mu0*mur2*A2);

% Reluctance of section 3
R3 = l3/(mu0*mur3*A3);

Rtot = R2 + R3

% Total reluctance from MMF and flux
 phi = Rtot/(N1*i1)


% Solve for A1 from: Rtot = l1/(mu0*mur1*A1) + R2
A1 = l1/(mu0*mur1*(Rtot - R2));   % [m^2]

% Convert to cm^2
A1_cm2 = A1*1e4;

fprintf('A1 = %.6f m^2 = %.4f cm^2\n', A1, A1_cm2);


A1 = 0.000614 m^2 = 6.1407 cm^2