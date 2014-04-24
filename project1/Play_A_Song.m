%% Play a Song

clc; clear all; close all;

nbits = 16;
Fs    = 8000;
Ts    = 1/Fs;
measure  = 2;
t1    = [0:Ts:measure];
t2    = [0:Ts:measure/2];
t4    = [0:Ts:measure/4];

vt1 = [(note(5,2,t4)+note(4,4,t4)) (note(5,2,t4)+note(4,4,t4)) (note(5,2,t4)+note(4,6,t4)) (note(5,2,t4)+note(4,7,t4))];
vt2 = [(note(5,0,t4)+note(4,2,t4)) (note(5,0,t4)+note(4,2,t4)) (note(5,0,t4)+note(4,4,t4)) (note(4,5,t4)+note(4,5,t4))];

vt = [vt1 vt2];

vout = vt/max(vt);
sound(vout, Fs)
wavwrite(vout, Fs, nbits, 'song.wav');