%% Question 2
clear; clc; close all;
%Electromagnetics III
%Figure 5.8

i_1 = 9.4; %A (current)

l1 = 9.0/100; %m (wire length)
l2 = 20.5/100; %m (wire length)
l3 = 5.3/100; %m (wire length)

B_x = 0.77; %Tesla (Magnetic flux density)
B_y = 0.35; %Tesla (Magnetic flux density)
B_z = 0.07; %Tesla (Magnetic flux density)


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