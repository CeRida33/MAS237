clear; clc; close all;

% d = 140*10^(-3);
% dr = 70*10^(-3);
% qi = 49/60000;
% A = pi*(d/2)^2;
% Ar = (pi*(dr/2)^2); %m^2
% Aa = A-Ar; %m^2 (total area when the rod is removed)
% phi = Aa/A; %m^2
% 
% v = qi/A


% d = 250*10^(-3);
% dr = 150*10^(-3);
% A = pi*(d/2)^2;
% Ar = (pi*(dr/2)^2); %m^2
% Aa = A-Ar; %m^2 (total area when the rod is removed)
% phi = Aa/A; %m^2
% fl = 408.5*10^3;
% p1 = 15*10^5;
% p2 = (((fl/A)+p1)/(phi))*10^-5


% retracting with a resistive load
% d = 80*10^(-3);
% dr = 50*10^(-3);
% A = pi*(d/2)^2;
% Ar = (pi*(dr/2)^2); %m^2
% Aa = A-Ar; %m^2 (total area when the rod is removed)
% phi = Aa/A; %m^2
% p2 = 175*10^5;
% p1 = 16*10^5;
% etahmc = 0.83;
% 
% fl = ((p2*phi*A)-(p1*A))*10^(-3);

% dr = 100*10^(-3);
% l1 = 0*10^(-3);
% l = 1145*10^(-3);
% i2 = ((pi*(dr^4))/64); m^4
% E = 2.1*10^11; %Pa
% l2 = l-l1;
% fbck = ((pi)^2*E*i2)/(l*l2)*10^(-3)

% l1 = 281*10^(-3);
% l = 1687*10^(-3);
% l2 = l-l1;
% s = 3;
% fl = 1126.7*10^3;
% fbck = s * fl;
% E = 2.1*10^11; %Pa
% dr = ((((fl*s*l*l2)/(pi*E))*(64/pi))^(1/4))*10^3

% nl = 1.4;
% v1 = 42.5;
% v2 = 57.3;
% p2 = 156;
% 
% 
% p1 = ?

nl = 1.4;
deltav = 3.8;
pmin = 71*10^5;
pmax = 99*10^5;
pl = 97*10^5;
p0 = 64*10^5;
%vg_min = (1/((1-(pmax/pmin))^(1/nl)))*deltav
% vg_min = -0.01417801322;
% vg_max = 0.1797801322;  Bytta fra riktig til feil så disse er også feil
% vg_l = -1.949389482;
po = 0.9*pmin;
v0 = ((pl/po)*vg_l)*10^3