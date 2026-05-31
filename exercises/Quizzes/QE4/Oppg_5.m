%% What is the mechanical output power (P_M) in W?
%star(wye)-connected.
%Number of poles: 4
clear; clc; close all;

U_L   = 280;   %V
f     = 60;    %Hz
RS    = 0.7;   %ohm
RR    = 0.6;   %ohm
X_lS  = 0.8;   %ohm
XM    = 30;    %ohm
X_lR  = 0.8;   %ohm
s     = 0.09;  %Nm
np    = 2;
w = 2*pi*f;

%U_p = U_L/sqrt(3); %y
U_p = U_L; %Delta

wb = w/(np/2);
wm = (1-s)*wb;

RM = ((1-s)/s)*RR;

ZS = RS+j*X_lS;
ZR = RR+(1-s)/s*RR+j*X_lR;
ZM = j*XM;

Z1 = ZR*ZM/(ZR+ZM);
Z_eff = ZS + Z1;

Is = U_p/Z_eff;

U_R = U_p - Is*ZS;
IR = U_R/ZR;

I_M = abs(U_R/ZM) 

PM = 3*abs(IR^2)*RM;

tau_M = PM/wm

Is1 = abs(U_p/Z_eff)
