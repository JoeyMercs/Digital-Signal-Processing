% John Biswakarma, Jennifer Tashman, Joseph Mercedes
% ECE 114: MATLAB Assignment #4
% Equation Time Delay Estimation - Angle of Arrival

clc; clear all; close all;

load proj1part1.mat;

fs = 8000;
v = 8/3;
len = length(y1clean);

% y1 and y3
y = xcorr(y1clean,y3clean);
de13 = max(y);
delay13 = find(y==de13);
delay13 = delay13-len;
t13 = delay13/fs;
d13 = t13*v;
theta13 = (180/pi)*acos(d13/.5)

% y1 and y2
y = xcorr(y1clean,y2clean);
de12 = max(y);
delay12 = find(y==de12);
delay12 = delay12-len;
t12 = delay12/fs;
d12 = t12*v;
theta12 = (180/pi)*acos(d12/.25)

% y2 and y3
y = xcorr(y2clean,y3clean);
de23 = max(y);
delay23 = find(y==de23);
delay23 = delay23-len;
t23 = delay23/fs;
d23 = t23*v;
theta23 = (180/pi)*acos(d23/.25)

% The Angle of Arrival is Approximately 82 Degrees