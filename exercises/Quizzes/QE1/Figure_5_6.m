% Figure 5_6
clear; clc; close all;
format("longG")

% I-shaped wire force in magnetic field (Figure Q5.6)


% Given
I   = 14;            % A
l1  = 0.104;         % m  (10.4 cm)
th1 = 141.3;         % deg

Bx = 0.06;           % T
By = 0.63;           % T
Bz = 0.48;           % T

% Build vectors
L = [l1*cosd(th1); l1*sind(th1); 0];   % wire length vector in xy-plane
B = [Bx; By; Bz];                       % magnetic flux density

% Force
F = I * cross(L, B);    % N
f = norm(F);            % absolute force (magnitude), N

% Print
fprintf('F = [%.6f, %.6f, %.6f] N\n', F);
fprintf('||F|| = %.6f N\n', f);
