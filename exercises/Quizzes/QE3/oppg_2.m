%% Q2 solutions for different variations
%% =======================================================
% Task 2 slide 12 
%Finding K_Mphi
clc; clear;
UsA  = 895;     % V
RA   = 5.51;    % ohm
wM   = 38.8;    % rad/s
tauL = 729.7;   % Nm

K = roots([wM, -UsA, tauL*RA])   % two solutions for K_Mphi

%% =======================================================
%Finding RF SEDC, motor speed control 2
%Constant load tau_L
clear; clc; close all;

u_sA = 597;     %V
R_A = 3.04;     %ohm
i_Fkp = 2.91;   %A
e_Akp0 = 381.1; %V
w_M0 = 70.6;    %rad/s
m = 0.22;
w_M = 71.0;     %rad/s
tau_L = 372.4;  %Nm
u_sF = 616;     %V

%What is the field resistance (RF) in Ohm?

a = e_Akp0/i_Fkp;         %ohm
b = e_Akp0/(m*i_Fkp)^m;   %V/A^0.1
c = (1-m)*i_Fkp;          %A


K = roots([w_M, -u_sA, tau_L*R_A])

%here we are using the largest for smallest replace
%max(K) with min(K)

u_sA = max(K)*w_M+(tau_L*R_A)/max(K);

%i_F = (max(K)*w_M0)/a %i_F <= i_Fkp
i_F = ((max(K)*w_M0)/b)^(1/m)+c % i_Fkp <= i_F


R_F = u_sF/i_F %ohm
