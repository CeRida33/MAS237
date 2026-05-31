clear; clc; close all;

% n = 1445.2/60;
% Q_p = 16.9/60000;
% eta_vp = 0.93;
% 
% D = (Q_p/(eta_vp*n))*10^6

% D_max = 28*10^(-6);
% n = 2452.9/60;
% qp = 39.1/60000;
% D1 = qp/n;
% alpha = D1/D_max

% D = 160*10^(-6);
% MM = 129;
% delta = ((MM*2*pi)/D)*10^(-5)

% n = 1356.8/60;
% qm = 635/60000;
% etavm=0.92;
% %negative
% D = (qm/(etavm*n))*10^6

% PML = 79*10^3; %positive
% etavm = 0.98;
% etahmm = 0.89;
% etam = etavm*etahmm;
% PFM  = (PML/etam)*10^(-3)

% M1 = 97;
% D2 = 28*10^(-6);
% M2 = 30;
% delta = (M2*2*pi)/D2;
% D1 = ((M1*2*pi)/(delta))*10^6

% M1 = 356;
% D1 = 250*10^(-6);
% D2 = 250*10^(-6);
% %positive
% etahmm = 0.85;
% M2 = 267;
% delta = (M2*2*pi)/(D2*etahmm);
% etahmp = ((D1*delta)/(2*pi*M1))