clc; clear; close all;
n_p = 6;
U_L = 570; % V
f = 60; % Hz
R_S = 0.8; % ohm
R_R = 0.8; % ohm
X_IS = 0.8; % ohm
X_M = 28; % ohm
X_IR = 1.0; % ohm
s_nom = 0.08;
tau_min = 299; % Nm
n0 = 442; % rev/min

s1 = 0.09;
prec1 = 24; % %
s2 = 0.06;
prec2 = 24; % %
s3 = 0.01;
prec3 = 52; % %

U_p = U_L; %Delta connection
%U_p = U_L/sqrt(3) %Y_connection

w_b = (2*pi*f)/(n_p/2);
n_b = 60/(2*pi)*w_b;
a_nom = s_nom*w_b*((R_S+(R_R/s_nom))^2 + (abs(X_IS)+abs(X_IR))^2);
a1 = s1*w_b*((R_S+(R_R/s1))^2 + (abs(X_IS)+abs(X_IR))^2);
a2 = s2*w_b*((R_S+(R_R/s2))^2 + (abs(X_IS)+abs(X_IR))^2);
a3 = s3*w_b*((R_S+(R_R/s3))^2 + (abs(X_IS)+abs(X_IR))^2);

tau_nom = 3*U_p^2*R_R/a_nom;
tau_1 = 3*U_p^2*R_R/a1;
tau_2 = 3*U_p^2*R_R/a2;
tau_3 = 3*U_p^2*R_R/a3;

tau_rms = sqrt((tau_1^2*prec1+ tau_2^2*prec2+ tau_3^2*prec3)/100);

n_nom = (1-s_nom)*n_b
n1 = (1-s1)*n_b;
n2 = (1-s2)*n_b;
n3 = (1-s3)*n_b;

n_avg = (n1*prec1+n2*prec2+n3*prec3)/100

%tau_m1 = tau_min + (n_avg/n0)*(tau_nom-tau_min)-tau_rms
%tau_m2 = tau_nom - tau_rms
tau_m3 = (n_nom*tau_nom/n_avg)-tau_rms