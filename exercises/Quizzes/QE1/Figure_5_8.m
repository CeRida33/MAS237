% Figure 5_8
clear; clc; close all;
format("longG")

% Q5.8 – Magnetic force on a U-shaped wire


% Electromagnetics III . 
% Consider a U-shaped wire positioned in a magnetic field, see Figure Q5.8 .
%  Current (i_1) = 2.5 A . 
%  Wire length (l_1) = 13.2 cm . 
%  Wire length (l_2) = 14.2 cm .
%  Wire length (l_3) = 16.0 cm . 
%  Magnetic flux density (B_x) = 0.99 Tesla .
%  Magnetic flux density (B_y) = 0.97 Tesla .
%  Magnetic flux density (B_z) = 0.72 Tesla .
% What is the absolute magnetic force (f) acting on the wire in N?


% Given
I  = 17;                 % A
l1 = 11.5e-2;            % m (top, +x)
l2 = 6.4e-2;            % m (vertical, -y)
l3 = 15.3e-2;            % m (bottom, -x)

Bx = 0.28; By = 0.47; Bz = 0.92;   % T

% Vectors
B  = [Bx By Bz];
L1 = [ l1  0    0];      % top segment along +x
L2 = [  0 -l2   0];      % vertical segment along -y
L3 = [-l3  0    0];      % bottom segment along -x

% Force: F = I * sum(L_i x B)
F = I * ( cross(L1,B) + cross(L2,B) + cross(L3,B) );

Fx = F(1); Fy = F(2); Fz = F(3);
f  = norm(F);            % absolute force magnitude

fprintf('F = [Fx Fy Fz] = [%g  %g  %g] N\n', Fx, Fy, Fz);
fprintf('||F|| = %g N\n', f);


% ||F|| = 0.385061 N


%Alternativ kode under: (gir feil svar men er bedre satt opp
%% Electromagnetics III – U-shaped wire in uniform B (Figure Q5.8)
clear; clc; format longG

% --- Inputs ---
I  = 25;                % A
l1_cm = 11.9;           % cm  (bottom segment)
l2_cm = 22.4;           % cm  (left vertical)
l3_cm = 17.5;           % cm  (right vertical)
Bx = 0.55; By = 0.88; Bz = 0.98;   % T

% --- Convert to SI ---
l1 = l1_cm/100;  l2 = l2_cm/100;  l3 = l3_cm/100;   % m

% --- Segment directions (as assumed):
% bottom:  +x ; left leg: +y ; right leg: -y
L1 = [ l1,  0,   0];    % bottom
L2 = [  0, l2,   0];    % left vertical
L3 = [  0,-l3,   0];    % right vertical
B  = [Bx, By, Bz];

% --- Forces on each segment: F = I * (L x B)
F1 = I * cross(L1, B);
F2 = I * cross(L2, B);
F3 = I * cross(L3, B);

F  = F1 + F2 + F3;      % total force vector
f  = norm(F);           % absolute magnitude

% --- Output ---
fprintf('F1 = [%.6f, %.6f, %.6f] N\n', F1(1), F1(2), F1(3));
fprintf('F2 = [%.6f, %.6f, %.6f] N\n', F2(1), F2(2), F2(3));
fprintf('F3 = [%.6f, %.6f, %.6f] N\n', F3(1), F3(2), F3(3));
fprintf('F_total = [%.6f, %.6f, %.6f] N\n', F(1), F(2), F(3));
fprintf('Absolute force f = %.6f N\n', f);