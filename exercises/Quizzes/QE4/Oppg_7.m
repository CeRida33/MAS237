%% What is the absolute value of the real part of the phase current 
%% (I_p = I_aam) in A?
clear; clc; close all;
%Three-phase voltage supply with balanced load 1
%load in star(Y)-connection

U_L = 270;      %V
f = 50;         %Hz
R = 30;         %ohm
L = 41*10^(-3); %H


%What is the absolute value of the real part of the phase current 
% (I_p = I_aam) in A?


I_L = sqrt(3)*U_L/Z

%% What is the absolute value of the imaginary part of 
%the phase voltage (U_p = U_aam) in Volt?
%Three-phase voltage supply with balanced load 1
%Consider a three-phase voltage supply with a balanced load in 
%delta-connection. 
clear; clc; close all;

U_L = 270;      %V
f = 100;         %Hz
R = 12;         %ohm
L = 81*10^(-3); %H
w = 2*pi*f;    
j = sqrt(-1);

U_p = U_L; %kun reel del

%% What is the magnitude of the phase voltage U_P = U_aam in V
%Three-phase voltage supply with balanced load 1 . 
% Consider a three-phase voltage supply with a 
% balanced load in star(Y)-connection. .

clear; clc; close all;

U_L = 570;      %V
f = 50;         %Hz
R = 44;         %ohm
L = 16*10^(-3); %H
w = 2*pi*f;    
j = sqrt(-1);

U_P = U_L/sqrt(3)

%% What is the absolute value of the real part of 
% the line current (I_L) in A?
% balanced load in star(Y)-connection
clear; clc; close all;
U_L = 120;      %V
f = 100;         %Hz
R = 64;         %ohm
L = 11*10^(-3); %H
w = 2*pi*f;    
j = sqrt(-1);

%What is the absolute value of the 
% real part of the line current (I_L) in A?

Z = R+j*w*L;
thetaz = angle(Z);
Zmag =abs(Z);

I_Lmag = U_L/(sqrt(3)*Zmag);
I_L =I_Lmag*cos(-pi/6-thetaz) + j*I_Lmag*sin(-pi/6-thetaz)