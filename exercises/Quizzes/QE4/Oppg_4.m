%% What is the rotor current (I_R) in A?
% delta-connected.
% Number of poles: 2 
clear; clc; close all;

U_L   = 360;   %V
f     = 50;    %Hz
RS    = 1.0;   %ohm
RR    = 0.5;   %ohm
X_lS  = 0.9;   %ohm
XM    = 36;    %ohm
X_lR  = 0.9;   %ohm
s     = 0.08;  %Nm
np    = 2;
w = 2*pi*f;

U_P = U_L;

b = sqrt((RS+(RR/s))^2+(abs(X_lS)+abs(X_lR))^2);

I_R = U_P/b

%% What is the mechanical output power (P_M)?
%AC induction motor, equivalent circuit, simplified 1 
%Consider an AC induction motor delta-connected.
clear; clc; close all;
np = 6;
U_L = 450; %V
f  = 60; %Hz
R_S = 0.6; %ohm
R_R = 0.5; %ohm
X_lS = 0.9; %ohm
X_M = 25; %ohm
X_lR = 0.8; %ohm
s = 0.10; 

%What is the mechanical output power (P_M) in W?
%U_P = U_L; %delta
U_P = U_L/sqrt(3); %Y_way

R_M = ((1-s)/s)*R_R;

I_R = U_P/sqrt((R_S+(R_R/s))^2+(abs(X_lS)+abs(X_lR))^2);

P_M = 3*abs(I_R^2)*R_M

%%  What is the maximum slip (s_max) ?
%AC induction motor, equivalent circuit, simplified 1 . 
% Consider an AC induction motor star(wye)-connected.
clear; clc; close all;
np = 2;
U_L = 180; %V
f  = 60; %Hz
R_S = 0.6; %ohm
R_R = 0.4; %ohm
X_lS = 0.8; %ohm
X_M = 30; %ohm
X_lR = 0.8; %ohm

U_P = U_L/sqrt(3);

s_max = R_R/(sqrt(R_S^2+(abs(X_lS)+abs(X_lR))^2))

%% What is the motor torque (tau_M)?
%AC induction motor, equivalent circuit, simplified 1 
%Consider an AC induction motor delta-connected.
clear; clc; close all;
np = 6;
U_L = 200; %V
f  = 60; %Hz
R_S = 0.7; %ohm
R_R = 0.6; %ohm
X_lS = 1.0; %ohm
X_M = 35; %ohm
X_lR = 0.9; %ohm
s = 0.08; 
w = 2*pi*f;

U_P = U_L;

wb = w/(np/2);

R_M = ((1-s)/s)*R_R;

I_R = U_P/sqrt((R_S+(R_R/s))^2+(abs(X_lS)+abs(X_lR))^2);

P_M = 3*abs(I_R^2)*R_M;

wm = (1-s)*wb;

tau_m = P_M/wm

