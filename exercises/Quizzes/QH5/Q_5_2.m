clear; clc; close all;
%Electromagnetics IV
%Figure 5.9
format long g

l1 = 5.5/100; %m (Wire length)
theta_1 = 43.3; %deg (Rotational angle)
 
v_x = 23.8; %m/s (Wire velocity)
v_y = 49.0; %m/s (Wire velocity)
v_z = 40.5; %m/s (Wire velocity)

B_x = 0.16; %Tesla (Magnetic flux density)
B_y = 0.24; %Tesla (Magnetic flux density)
B_z = 0.97; %Tesla (Magnetic flux density)

Us = 12; %V

V = [v_x v_y v_z];
B = [B_x B_y B_z];
la_a = [l1*cosd(theta_1) l1*sind(theta_1) 0];

vB = cross(V,B);

U = la_a * cross(V,B)';

R1 = 2; %ohm

%What is the current i_1 in A?

i_1  = (Us-U)/R1 

%% Question 2
clear; clc; close all;
%Electromagnetics III
%Figure 5.8

i_1 = 26; %A (current)

l1 = 17.3/100; %m (wire length)
l2 = 20.1/100; %m (wire length)
l3 = 12.9/100; %m (wire length)

B_x = 0.79; %Tesla (Magnetic flux density)
B_y = 0.36; %Tesla (Magnetic flux density)
B_z = 0.39; %Tesla (Magnetic flux density)


%What is the absolute magnetic force (f) acting on the wire in N?

i2 = [i_1 0 0];
i3 = [0 -i_1 0];
i4 = [-i_1 0 0];

B = [B_x B_y B_z];

F1 = l1*cross(i2,B)'
F2 = l2*cross(i3,B)'
F3 = l3*cross(i4,B)'

sum = F1 + F2 + F3

F  = sqrt((sum(1))^2+(sum(2))^2+(sum(3))^2)