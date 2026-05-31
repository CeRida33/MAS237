%% What is the total dissipated power in component 1 in W?
%Figure Q8.1
%AC circuits-2 (1-2-3) (Seriekobling) (4-5) (parallellkobling)
clear; clc; close all;

U_0 = 210; %V
F_0 = 100; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 50; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 94*10^(-3); %H
Z2 = j*w*L2; %ohm

%Compontent nr. 3 (Capacitor)
C3 = 97*10^(-6); %F
Z3 = -j/(w*C3);  %ohm

%Compontent nr. 4 (Capacitor)
C4 = 28*10^(-6); %F
Z4 = -j/(w*C4);  %ohm

%Compontent nr. 5 (Capacitor)
C5 = 38*10^(-6); %F
Z5 = -j/(w*C5);  %ohm

%What is the dissipated power in component 1 in W?


%What is the total dissipated power (P_tot) in W?
Zeff = Z4*Z5/(Z4+Z5)+Z3+Z2+Z1;

I0 = U_0/Zeff;

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)); %W

P1 = abs(I0)^2*R1 %mister kun power i resistorer i resistor 1 er I = I_0

%% What is the total dissipated power in component 2 in W?
%Figure Q8.1
%AC circuits-4 (1) (Seriekobling) (2-3-4-5) (parallellkobling)
clear; clc; close all;

U_0 = 300; %V
F_0 = 90; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 130; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 28*10^(-3); %H
Z2 = j*w*L2; %ohm

%Compontent nr. 2 (Inductor)
L3 = 74*10^(-3); %H
Z3 = j*w*L3; %ohm

%Compontent nr. 2 (Inductor)
L4 = 26*10^(-3); %H
Z4 = j*w*L4; %ohm

%Compontent nr. 2 (Inductor)
L5 = 40*10^(-3); %H
Z5 = j*w*L5; %ohm

%What is the dissipated power in component 2 in W?


Z23 = (Z2 * Z3)/(Z2 + Z3);
Z45 = (Z4 * Z5)/(Z4 + Z5);
Zeff = Z1 + (Z23*Z45)/(Z23+Z45);

I0 = U_0/Zeff;

U1 = U_0-I0*Z1;
I2 = U1/Z2;

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)); %W
P1 = abs(I0)^2*R1 %W
%P2 = abs(I2)^2*R2 %W

%mister kun power i resistorer 
% i resistor 1 er I = I_0

%% What is the total dissipated power in component 5 in W?
%Figure Q8.1
%AC circuits-4 (1) (Seriekobling) (2-3-4-5) (parallellkobling)
clear; clc; close all;

U_0 = 570; %V
F_0 = 60; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 230; %ohm
Z1 = R1; %ohm

%Compontent nr. 2 (Inductor)
L2 = 70*10^(-3); %H
Z2 = j*w*L2; %ohm

%Compontent nr. 3 (Capacitor)
C3 = 89*10^(-6); %F
Z3 = -j/(w*C3);  %ohm

%Compontent nr. 4 (Resistor)
R4= 290; %ohm
Z4 = R4;  %ohm

%Compontent nr. 5 (Capacitor)
C5 = 92*10^(-6); %F
Z5 = -j/(w*C5);  %ohm



%What is the dissipated power in component 5 in W?


Z23 = (Z2 * Z3)/(Z2 + Z3);
Z45 = (Z4 * Z5)/(Z4 + Z5);
Zeff = Z1 + (Z23*Z45)/(Z23+Z45);

I0 = U_0/Zeff;

U1 = U_0-I0*Z1;
I4 = U1/Z4;
%I5 = U1/Z5;

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)); %W

P4 = abs(I4)^2*R4 %W
%P5 = abs(I5)^2*R5 %W

%mister kun power i resistorer 
% i resistor 1 er I = I_0


%% What is the dissipated power in component 1?
%Consider circuit number 1
clear; clc; close all;

U_0 = 570; %V
F_0 = 40; %Hz
w = 2*pi*F_0; %rad/s
j = sqrt(-1); %Imaginære tall

%Component nr. 1 (resistors)
R1 = 300; %ohm
Z1 = R1; %ohm

%Component nr. 2 (resistors)
R2 = 130; %ohm
Z2 = R2; %ohm

%Compontent nr. 3 (Resistance)
R3 = 140; %ohm
Z3 = R3; %ohm

%Compontent nr. 4 (Inductor)
L4 = 26*10^-3; %H
Z4 = j*w*L4;   %ohm

%Compontent nr. 4 (Inductor)
L5 = 98*10^-3; %H
Z5 = j*w*L5;   %ohm

%What is the total dissipated power (P_tot) in W?

Zeff = Z1+Z2+Z3+Z4+Z5;

I0 = U_0/Zeff;

PF = cos(angle(I0))

P_tot = abs(U_0)*abs(I0)*cos(angle(I0)) %W

P1 = abs(I0)^2*R1 %W
