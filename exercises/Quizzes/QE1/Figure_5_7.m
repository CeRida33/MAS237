% Figure 5_7
clear; clc; close all;
format("longG")

% Electromagnetics III – L-shaped wire in uniform B (Figure Q5.7)


% --- Inputs ---
I  = 3.9;              % A (current)
l1_cm = 19.5;          % cm (horizontal length, pointing LEFT)
l2_cm = 18.7;          % cm (vertical length, pointing UP)
Bx = 0.14; By = 0.60; Bz = 0.90;   % Tesla (magnetic flux density components)

% --- Convert to SI ---
l1 = l1_cm/100;        % m
l2 = l2_cm/100;        % m

% --- Geometry (as drawn): L1 along -x, L2 along +y ---
L1 = [-l1, 0,   0];    % m
L2 = [  0, l2,  0];    % m
B  = [Bx, By, Bz];     % T

% --- Forces on each segment: F = I * (L x B) ---
F1 = I * cross(L1, B); % N
F2 = I * cross(L2, B); % N
F  = F1 + F2;          % total force
f  = norm(F);          % absolute magnitude

% --- Output ---
fprintf('F1 = [%.6f, %.6f, %.6f] N\n', F1(1), F1(2), F1(3));
fprintf('F2 = [%.6f, %.6f, %.6f] N\n', F2(1), F2(2), F2(3));
fprintf('F_total = [%.6f, %.6f, %.6f] N\n', F(1), F(2), F(3));
fprintf('Absolute force f = %.6f N\n', f);
