clear; clc; close all;
%Electromagnetics IV
%Figure 5.9
format long g

l1 = 10.7/10^2; %m (Wire length)
theta_1 = 192.4; %deg (Rotational angle)
 
v_x = 35.8; %m/s (Wire velocity)
v_y = 48.6; %m/s (Wire velocity)
v_z = 28.8; %m/s (Wire velocity)

B_x = 0.55; %Tesla (Magnetic flux density)
B_y = 0.08; %Tesla (Magnetic flux density)
B_z = 0.72; %Tesla (Magnetic flux density)

Us = 12; %V

V = [v_x v_y v_z];
B = [B_x B_y B_z];
la_a = [l1*cosd(theta_1) l1*sind(theta_1) 0];

vB = cross(V,B);

U = la_a * cross(V,B);

R1 = 2; %ohm

%What is the current i_1 in A?

i_1  = (Us-U)/R1 
