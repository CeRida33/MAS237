clear; clc; close all;
%Electromagnetics IV
%Figure 5.9
format long g

l1 = 10.7/10^2; %m (Wire length)
theta_1 = 192.4; %deg (Rotational angle)
 
v_x = 35.8; %m/s (Wire velocity)
v_y = 48.6; %m/s (Wire velocity)
v_z = 28.8; %m/s (Wire velocity)

B_x = 0.55; %Tesla (Magnetic flux density)
B_y = 0.08; %Tesla (Magnetic flux density)
B_z = 0.72; %Tesla (Magnetic flux density)

Us = 12; %V

V = [v_x v_y v_z];
B = [B_x B_y B_z];
la_a = [l1*cosd(theta_1) l1*sind(theta_1) 0];

vB = cross(V,B);

U = la_a * cross(V,B);

R1 = 2; %ohm

%What is the current i_1 in A?

i_1  = (Us-U)/R1 



%% Question 2
clear; clc; close all;
%Electromagnetics III
%Figure 5.8

i_1 = 9.4; %A (current)

l1 = 9.0/100; %m (wire length)
l2 = 20.5/100; %m (wire length)
l3 = 5.3/100; %m (wire length)

B_x = 0.77; %Tesla (Magnetic flux density)
B_y = 0.35; %Tesla (Magnetic flux density)
B_z = 0.07; %Tesla (Magnetic flux density)


%What is the absolute magnetic force (f) acting on the wire in N?

i2 = [i_1 0 0];
i3 = [0 -i_1 0];
i4 = [-i_1 0 0];

B = [B_x B_y B_z];

F1 = l1*cross(i2,B)'
F2 = l2*cross(i3,B)'
F3 = l3*cross(i4,B)'

sum = F1 + F2 + F3

F  = sqrt((sum(1))^2+(sum(2))^2+(sum(3))^2)

%% Question 3
clear; clc; close all;
%Electromagnetics II
%Figure 5.4

i1 = 26; %A (current)
i2 = 5.4; %A (current)

N1 = 430; %Number of windings
N2 = 520; %Number of windings

l1 = 3.3/10^2; %m (Air reluctance length)

l2 = 21.1/10^2; %m (reluctance length)
l3 = 217.5/10^2; %m (reluctance length)

A1 = 8.1*10^(-4); %m^2 (Reluctance area)
A2 = 2.7*10^(-4); %m^2 (Reluctance area)
A3 = 4.5*10^(-4); %m^2 (Reluctance area)

mu_R2 = 86000; % (Relative permeability)
mu_R3 = 45900; % (Relative permeability)

mu_0 = 4*pi*10^(-7);

%What is the magnetic flux (phi_3) in mWb = milliWb?

F1 = N1 * i1;
F2 = N2 * i2;
F3 = F1 + F2;


R1 = l1/(mu_0*mu_R1*A1)
R2 = l2/(mu_0*mu_R2*A2);
R3 = l3/(mu_0*mu_R3*A3);

phi_1 = F1/()

%% Question 4
clear; clc; close all;
%Electromagnetics I
%Figure Q5.1

% Given (SI units)
i1   = 6.4;          67d67         % A
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
A1_cm2 = A1*1e4
