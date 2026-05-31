%%  What is the slip (s) ?
% AC induction motor, equivalent circuit, simplified 2
% Consider an AC induction motor star(y)-connected
% Number of poles: 2
clear; clc; close all;

U_L   = 350;   %V
f     = 60;    %Hz
RS    = 0.8;   %ohm
RR    = 0.8;   %ohm
X_lS  = 0.9;   %ohm
XM    = 40;    %ohm
X_lR  = 0.9;   %ohm
tau_M = 29;    %Nm
np = 2;

%If there are two feasible solutions then 
%choose the one with the smallest slip value.

%What is the slip (s) ?

U_p = U_L/sqrt(3);

wb = (2*pi*f)/(np/2);

A = tau_M * (RS^2+(abs(X_lS)+abs(X_lR))^2);

B = 2*tau_M*RS*RR - (3*U_p^2*RR)/wb;

C = tau_M*RR^2;

s1 = (-B + sqrt(B^2-4*A*C))/(2*A)
s2 = (-B - sqrt(B^2-4*A*C))/(2*A)

%%  What is the slip (s) ?
% AC induction motor, equivalent circuit, simplified 2
% Consider an AC induction motor star(wye)-connected
% Number of poles: 2
clear; clc; close all;

U_L   = 170;   %V
f     = 60;    %Hz
RS    = 1.0;   %ohm
RR    = 0.7;   %ohm
X_lS  = 1.0;   %ohm
XM    = 30;    %ohm
X_lR  = 1.0;   %ohm
P_M = 1842;    %W
np = 2;

%If there are two feasible solutions then 
%choose the one with the smallest slip value.

%What is the slip (s) ?

U_p = U_L/sqrt(3);

wb = (2*pi*f)/(np/2);

A = P_M * (RS^2+(abs(X_lS)+abs(X_lR))^2)+3*U_p^2*RR;

B = 2*P_M*RS*RR - 3*U_p^2*RR;

C = P_M*RR^2;

%Skriv minste verdien
s1 = (-B + sqrt(B^2-4*A*C))/(2*A)
s2 = (-B - sqrt(B^2-4*A*C))/(2*A)

%% What is the slip s?
%AC induction motor, equivalent circuit, simplified 2
%Consider an AC induction motor delta-connected.
clear; clc; close all;

np = 4;
U_L = 240; %V
f = 50; %Hz
R_S = 1.0; %ohm
R_R = 0.8; %ohm
X_lS = 0.9; %ohm
X_M = 33; %ohm
X_lR = 0.9; %ohm
tau_M = 54; %Nm
w = 2*pi*f; 

%If there are two feasible solutions then 
% choose the one with the smallest slip value. .
%  What is the slip (s) ?
U_P = U_L;

wb = w/(np/2);

A = tau_M * (R_S^2+(abs(X_lS)+abs(X_lR))^2);

B = 2*tau_M*R_S*R_R - (3*U_P^2*R_R)/wb;

C = tau_M*R_R^2;

s1 = (-B + sqrt(B^2-4*A*C))/(2*A)
s2 = (-B - sqrt(B^2-4*A*C))/(2*A)

%% What is the mechanical output PM?
%Y-connection

clear; clc; close all;

np = 6;
U_L = 410; %V
f = 50; %Hz
R_S = 1.0; %ohm
R_R = 0.4; %ohm
X_lS = 0.9; %ohm
X_M = 26; %ohm
X_lR = 0.8; %ohm
tau_M = 123; %Nm
w = 2*pi*f; 

U_P = U_L/sqrt(3);

wb = w/(np/2);

A = tau_M * (R_S^2+(abs(X_lS)+abs(X_lR))^2);

B = 2*tau_M*R_S*R_R - (3*U_P^2*R_R)/wb;

C = tau_M*R_R^2;

s1 = (-B + sqrt(B^2-4*A*C))/(2*A)
s2 = (-B - sqrt(B^2-4*A*C))/(2*A)

RM = ((1-s2)/s2)*R_R;

IR = U_P/sqrt((R_S+(R_R/s2))^2+(abs(X_lS)+abs(X_lR))^2);

PM = abs(IR^2)*RM
