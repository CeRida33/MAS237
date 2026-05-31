%% What is the torque margin, 
%% see Figure Q8.2, against overheating (tau_m) in N*m?
% AC induction motor, RMS control 1 . 
% An AC induction motor is subjected to a 
% work cycle with three (3) sequences. 
%Number of poles: 6
clear; clc; close all;

np = 6;
f = 50; %Hz
tau_nom = 91; %Nm
tau_min = 52; %Nm
n0 = 416 %rev/min 
w = 2*pi*f;
j = sqrt(-1);
wSync = w/(np/2);

%Sequence nr 1
n1 = 414; %rev/min
tau1 = 26; %Nm
proc1 = 0.26; %

%Sequence nr 2
n2 = 458; %rev/min
tau2 = 97; %Nm
proc2 = 0.29; %

%Sequence nr 3
n3 = 1646; %rev/min
tau3 = 32; %Nm
proc3 = 0.45; %
 
%What is the torque margin (tau_M) against overheating

wb = w/(np/2);
n_nom = wb/(2*pi)*60
n_avg = (n1*proc1+n2*proc2+n3*proc3)

tau_rms = sqrt(tau1^2*proc1 + tau2^2*proc2 + tau3^2*proc3);


%tau_m1 = tau_min+(n_avg/n0)*(tau_nom-tau_min)-tau_rms;
tau_m2 = tau_nom-tau_rms
%tau_m3 = (2*pi*n_nom*tau_nom)/(2*pi*n_avg)-tau_rms;