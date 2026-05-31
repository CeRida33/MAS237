% Figure 5_9
clear; clc; close all;
format("longG")

% Electromagnetics IV – current in a moving straight wire (Fig. Q5.9)

% Electromagnetics IV . 
% Consider an I-shaped wire connecting the terminals [a' and a while moving in a magnetic field,
% see Figure Q5.9 .
%  Wire length (l_1) = 22.1 cm . 
%  Rotation angle (theta_1) = 339.1 deg . 
%  Wire velocity (v_x) = 42.6 m/s . 
%  Wire velocity (v_y) = 37.6 m/s .
%  Wire velocity (v_z) = 45.0 m/s . 
%  Magnetic flux density (B_x) = 0.92 Tesla .
%  Magnetic flux density (B_y) = 0.42 Tesla . 
%  Magnetic flux density (B_z) = 0.55 Tesla . 
% What is the current (i_1) in A?]




% --- Given ---------------------------------------------------------------
l1_cm      = 21.7;          % cm
theta1_deg = 160.1;         % deg (direction from a' to a)
v          = [40.8, 34.9, 38.7];   % m/s  (vx, vy, vz)
B          = [0.53, 0.49, 0.14];   % T    (Bx, By, Bz)
Us         = 12;            % V (source)
R1         = 2;             % Ohm (series resistor)

% --- Convert & geometry --------------------------------------------------
l1 = l1_cm/100;                                % m
ell = l1*[cosd(theta1_deg), sind(theta1_deg), 0];  % m, vector a'->a

% --- Motional emf on the segment ----------------------------------------
vxB = cross(v, B);               % (v × B), V/m
emf = dot(vxB, ell);             % V, sign per a'->a orientation

% --- Circuit (KVL) -------------------------------------------------------
i1 = (Us - emf)/R1;              % A

% --- Print ---------------------------------------------------------------
fprintf('l-vector (m)       = [%.6f, %.6f, %.6f]\n', ell);
fprintf('v x B (V/m)        = [%.3f, %.3f, %.3f]\n', vxB);
fprintf('Motional emf (V)   = %.6f\n', emf);
fprintf('Current i_1 (A)    = %.6f\n', i1);


% Current i_1 (A)    = 6.524621