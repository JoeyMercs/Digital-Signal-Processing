% Jen Tashman, Joe Marcedes, John Biswakarma
% ECE 114
% MATLAB Assignment #3 (2005b): Removing Noise from a Speech Signal


clear all; close all; clc;

load projIB.mat

%% Butterworth Filter

mybutt = myButter();

load ButSOS-G.mat

%ButterworthOrder = filtord(ButSOS)

figure('Name','Butterworth Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(mybutt);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(mybutt);
plot(w,gd);
axis([0 pi min(gd) max(gd)])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Butterworth Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(mybutt,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
[z,p,k] = sos2zp(ButSOS, ButG);
zplane(z,p);
title('Pole-Zero Plot');

%soundsc(noisy,fs);
%soundsc(x,fs);

%% Chebyshev Type I Filter

mycheb1 = myCheby1();

load Cheby1SOS-G.mat

%Chebyshev1Order = filtord(Cheby1SOS)

figure('Name','Chebychev Type I Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(mycheb1);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(mycheb1);
plot(w,gd);
axis([0 pi min(gd) max(gd)])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Chebychev Type I Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(mycheb1,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
[z,p,k] = sos2zp(Cheby1SOS, Cheby1G);
zplane(z,p);
title('Pole-Zero Plot');

%soundsc(noisy,fs);
%soundsc(x,fs);

%% Chebyshev Type II Filter

mycheb2 = myCheby2();

load Cheby2SOS-G.mat

%Chebyshev1Order = filtord(Cheby2SOS)

figure('Name','Chebychev Type II Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(mycheb2);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(mycheb2);
plot(w,gd);
axis([0 pi min(gd) max(gd)])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Chebychev Type II Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(mycheb2,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
[z,p,k] = sos2zp(Cheby2SOS, Cheby2G);
zplane(z,p);
title('Pole-Zero Plot');

%soundsc(noisy,fs);
%soundsc(x,fs);

%% Elliptic Filter

myellip = myEllip();

load EllipSOS-G.mat

%EllipticOrder = filtord(EllipSOS)

figure('Name','Elliptic Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(myellip);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(myellip);
plot(w,gd);
axis([0 pi min(gd) max(gd)])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Elliptic Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(myellip,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
[z,p,k] = sos2zp(EllipSOS, EllipG);
zplane(z,p);
title('Pole-Zero Plot');

%soundsc(noisy,fs);
%soundsc(x,fs);

%% Parks McClellan

rp = 3;           % Passband ripple
rs = 95;          % Stopband ripple
fs = 44100;       % Sampling frequency
f = [2500 4000];  % Cutoff frequencies
a = [1 0];        % Desired amplitudes
% Compute deviations
dev = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)]; 
[n,fo,ao,w] = firpmord(f,a,dev,fs);
myparksm = firpm(n,fo,ao,w);
% freqz(b,1,1024,fs);
% title('Lowpass Filter Designed to Specifications');

%ParksMcClellanOrder = n

figure('Name','Parks McClellan Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(myparksm);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(myparksm);
plot(w,gd);
axis([0 pi 36 40])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Parks McClellan Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(myparksm,1,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
zplane(myparksm);
title('Pole-Zero Plot');

%soundsc(noisy,fs);
%soundsc(x,fs);

%% Kaiser

mykai = myKai();

load KaiCoef.mat

%KaiserOrder = filtord(KaiCoef)

figure('Name','Kaiser Filter','NumberTitle','on');
subplot(3,1,1);
[h,w] = freqz(mykai);
h1 = 20*log10(abs(h));
plot(w, h1);
axis([0 pi min(h1) max(h1)+50]);
title('Magnitude Response');
xlabel('Frequency (w)');
ylabel('Magnitude (dB)');

subplot(3,1,2)
[gd] = grpdelay(mykai);
plot(w,gd);
axis([0 pi 89 90])
title('Group Delay');
xlabel('Frequency (w)');
ylabel('Group Delay (in samples)');

subplot(3,1,3)
plot(w,abs(h))
axis([0 pi min(abs(h)) max(abs(h))+.5]);
title('Magnitude Response of Passpand Ripple');
xlabel('Frequency (w)');
ylabel('Magnitude (linear)');

figure('Name','Kaiser Filter','NumberTitle','on');
subplot(2,1,1);
x = filter(mykai,noisy);
y = x(1:100);
stem(y);
title('Implulse Response');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
zplane(KaiCoef);
title('Pole-Zero Plot');

% soundsc(noisy,fs);
% soundsc(x,fs);

% Each of the above filters took away most if not all of the noise
% surrounding the original speech.