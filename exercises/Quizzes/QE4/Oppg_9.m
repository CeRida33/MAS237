%% What is the total dissipated power (P_tot) in W?
%Figure Q8.1
%AC circuits 1 (seriekobling)
%Consider circuit nr 1
clear; clc; close all;

U_0 = 570; %V
F_0 = 90; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 290; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 91*10^-3; %H
Z2 = j*w*L2;   %ohm

%Compontent nr. 3 (Inductor)
L3 = 33*10^-3; %H
Z3 = j*w*L3;   %ohm

%Compontent nr. 4 (Resistance)
R4 = 300; %ohm
Z4 = R4; %ohm

%Compontent nr. 5 (Resistance)
R5 = 240; %ohm
Z5 = R5; %ohm

%What is the total dissipated power (P_tot) in W?

Zeff = Z1+Z2+Z3+Z4+Z5;

I0 = U_0/Zeff;

PF = cos(angle(I0))

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)) %W


%% What is the power factor (PF) ?
clear; clc; close all;
%see Figure Q8_1
%AC circuits 1 . 
%Consider circuit number 4 
%(1)-(Seriekobling) (2-3-4-5)-(parallellkobling)

U_0 = 30; %V
F_0 = 80; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 210; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 59*10^-3; %H
Z2 = j*w*L2;   %ohm

%Compontent nr. 3 (resistor)
R3 = 100;  %ohm
Z3 = R3;   %ohm

%Compontent nr. 4 (Inductor)
L4 = 100*10^-3; %H
Z4 = j*w*L4;   %ohm

%Compontent nr. 5 (Capacitor)
C5 = 100*10^(-6); %F
Z5 = -j/(w*C5);  %ohm

%What is the power factor (PF) ?
%PF = cos(theta)

Z23 = (Z2 * Z3)/(Z2 + Z3);
Z45 = (Z4 * Z5)/(Z4 + Z5);
Zeff = Z1 + (Z23*Z45)/(Z23+Z45);

I0 = U_0/Zeff

P = abs(U_0)*abs(I0)*cos(angle(U_0)-angle(I0)); %W

PF = cos(angle(I0))

%% What is the power factor (PF) ?
clear; clc; close all;
%see Figure Q8_1
%AC circuits 1 . 
%Consider circuit number 3 
%(1-2)-(Seriekobling) (-3-4-5)-(parallellkobling)

U_0 = 540; %V
F_0 = 20; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 110; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 85*10^-3; %H
Z2 = j*w*L2;   %ohm

%Compontent nr. 3 (Inductor)
L3 = 69*10^-3; %H
Z3 = j*w*L3;   %ohm

%Compontent nr. 4 (Capacitor)
C4 = 68*10^(-6); %F
Z4 = -j/(w*C4);  %ohm

%Component nr. 5 (resistors)
R5 = 280; %ohm
Z5 = R5; %ohm

%What is the power factor (PF) ?
%PF = cos(theta)

Z45 = (Z4 * Z5)/(Z4 + Z5);
Zeff = Z1 + Z2 + (Z3*Z45)/(Z3+Z45);

I0 = U_0/Zeff;

P = abs(U_0)*abs(I0)*cos(angle(U_0)-angle(I0)); %W

PF = cos(angle(I0))

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)) %W

%% What is the P_tot
clear; clc; close all;
%see Figure Q8_1
%AC circuits 1 . 
%Consider circuit number 2 
%(1-2-3)-(Seriekobling) (4-5)-(parallellkobling)

clear; clc; close all;

U_0 = 360; %V
F_0 = 70; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 280; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Capacitor)
C2 = 101*10^(-6); %F
Z2 = -j/(w*C2);  %ohm

%Compontent nr. 3 (Resistance)
R3 = 140; %ohm
Z3 = R3; %ohm

%Compontent nr. 4 (Capacitor)
C4 = 32*10^(-6); %F
Z4 = -j/(w*C4);  %ohm

%Compontent nr. 5 (Resistance)
R5 = 100; %ohm
Z5 = R5; %ohm

%What is the total dissipated power (P_tot) in W?

Zeff = Z1+Z2+Z3+(Z4*Z5)/(Z4+Z5);

I0 = U_0/Zeff;

PF = cos(angle(I0))

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)) %W