%% What is the phase resistance (R) in Ohm?
%Three-phase voltage supply with balanced load 2 
%Consider a three-phase voltage supply with a 
%balanced load in star(Y)-connection
clear; clc; close all;

j = sqrt(-1);
U_L = 360; %V
f   = 40; %Hz
L = 22*10^(-3); %H
I_p =  7.517197 - j*8.082620; %I_p = I_aam
w = 2*pi*f;

%What is the phase resistance (R) in Ohm?
tetha_z = -pi/6 - angle(I_p)
R = (w*L )/tan(tetha_z) % ohm
 
%% What is the phase inductance (L) in mH?
%delta-connection
clear; clc; close all;

j = sqrt(-1);
U_L = 540; %V
f   = 60; %Hz
R   = 28; %ohm
I_P = 19.443032 - j*24.293549; %A
w = 2*pi*f;

U_P = U_L;
tetha_z =- angle(I_L);
L = ((R*tan(tetha_z))/w)*10^3 % mH

%% What is the phase inductance (L) in mH?
%delta-connection
clear; clc; close all;

j = sqrt(-1);
U_L = 540; %V
f   = 60; %Hz
R   = 28; %ohm
I_L = 19.443032 - j*24.293549; %A
w = 2*pi*f;

U_P = U_L;
I_P = 
tetha_z =- angle(I_L);
L = ((R*tan(tetha_z))/w)*10^3 % mH

%% What is the line voltage?
%delta-connection
clear; clc; close all;

j = sqrt(-1);
f   = 90; %Hz
R   = 32; %ohm
L   = 23*10^(-3);
I_p = 16.091708 - j*6.540371; %A
w = 2*pi*f;

Z = abs(R+j*w*L)
I_Lmag = sqrt(3)*abs(I_p)
U_L = ((abs(I_Lmag)*Z)/sqrt(3)) 