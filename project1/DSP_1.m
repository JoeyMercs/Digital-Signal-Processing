%% Joseph Mercedes

%% Overview

% From the frequency spectrum of each given string recording, magnitudes were
% found and used to develop a model based on exponentially decayed
% superpositions of sine waves. The models, in turn, were used to write a
% function that would play a given guitar tab.

%% String 6

clc; clear; close all;

[v, Fs, nbits]= wavread('string06.wav');   % Reads the string06.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n\n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 6 - Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are :\n')
fprintf('0.5435 at 82Hz\n');
fprintf('1.0000 at 164Hz\n');
fprintf('0.5796 at 246Hz\n');
fprintf('0.4323 at 328Hz\n');
fprintf('0.04223 at 410Hz\n');
fprintf('0.01019 at 492Hz\n');
fprintf('0.02961 at 574Hz\n');
fprintf('0.02838 at 656Hz\n');
fprintf('0.03048 at 738Hz\n');
fprintf('0.03249 at 820Hz\n');
fprintf('0.02729 at 902Hz\n');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring6 = exp(-t/1.8).*(0.5435*sin(2*pi*82*t) + sin(2*pi*2*82*t) + 0.5796*sin(2*pi*3*82*t) + 0.4323*sin(2*pi*4*82*t)...
+ 0.04223*sin(2*pi*5*82*t) + 0.01019*sin(2*pi*6*82*t) + 0.02961*sin(2*pi*7*82*t) + 0.02838*sin(2*pi*8*82*t)...
+ 0.03048*sin(2*pi*9*82*t) + 0.03249*sin(2*pi*10*82*t) + 0.02729*sin(2*pi*11*82*t));

% Comparing the recording of string 6 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
plot(t, v, 'b-')
title('String 6 Comparison')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring6, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring6, Fs)

%% String 5 

clc; clear; close all;

[v, Fs, nbits]= wavread('string05.wav');   % Reads the string05.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 5 - Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are:');
fprintf('0.8699 at 110Hz');
fprintf('1.0000 at 220Hz');
fprintf('0.8351 at 330Hz');
fprintf('0.3423 at 440Hz');
fprintf('0.09942 at 550Hz');
fprintf('0.04029 at 660Hz');
fprintf('0.006155 at 770Hz');
fprintf('0.01486 at 880Hz');
fprintf('0.01224 at 990Hz');
fprintf('0.01422 at 1100Hz');
fprintf('0.009308 at 1210Hz');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring5 = exp(-t/1.8).*(0.8699*sin(2*pi*110*t) + sin(2*pi*2*110*t) + 0.8351*sin(2*pi*3*110*t) + 0.3423*sin(2*pi*4*110*t)...
+ 0.09942*sin(2*pi*5*110*t) + 0.04029*sin(2*pi*6*110*t) + 0.006155*sin(2*pi*7*110*t) + 0.01486*sin(2*pi*8*110*t)...
+ 0.01224*sin(2*pi*9*110*t) + 0.01422*sin(2*pi*10*110*t) + 0.009308*sin(2*pi*11*110*t));

% Comparing the recording of string 5 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
plot(t, v, 'b-')
title('String 5 Comparison')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring5, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring5, Fs)

%% String 4

clc; clear; close all;

[v, Fs, nbits]= wavread('string04.wav');   % Reads the string04.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n\n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 4 Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are :\n')
fprintf('1.0000 at 147Hz\n');
fprintf('0.8203 at 294Hz\n');
fprintf('0.6749 at 441Hz\n');
fprintf('0.3867 at 588Hz\n');
fprintf('0.04026 at 735Hz\n');
fprintf('0.02066 at 882Hz\n');
fprintf('0.002542 at 1029Hz\n');
fprintf('0.004651 at 1176Hz\n');
fprintf('0.01059 at 1323Hz\n');
fprintf('0.004409 at 1470Hz\n');
fprintf('0.003416 at 1617Hz\n');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring4 = exp(-t/1.8).*(sin(2*pi*147*t) + 0.8203*sin(2*pi*2*147*t) + 0.6749*sin(2*pi*3*147*t) + 0.3867*sin(2*pi*4*147*t)...
+ 0.04026*sin(2*pi*5*147*t) + 0.02066*sin(2*pi*6*147*t) + 0.002542*sin(2*pi*7*147*t) + 0.004651*sin(2*pi*8*147*t)...
+ 0.01059*sin(2*pi*9*147*t) + 0.004409*sin(2*pi*10*147*t) + 0.003416*sin(2*pi*11*147*t));

% Comparing the recording of string 4 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
title('String 4 Comparison')
plot(t, v, 'b-')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring4, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring4, Fs)

%% String 3

clc; clear all; close all;

[v, Fs, nbits]= wavread('string03.wav');   % Reads the string03.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n\n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 3 - Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are :\n')
fprintf('0.3981 at 196Hz\n');
fprintf('1.000 at 362Hz\n');
fprintf('0.4618 at 588Hz\n');
fprintf('0.1437 at 784Hz\n');
fprintf('0.05462 at 980Hz\n');
fprintf('0.01186 at 1176Hz\n');
fprintf('0.002031 at 1372Hz\n');
fprintf('0.005855 at 1568Hz\n');
fprintf('0.003145 at 1764Hz\n');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring3 = exp(-t/1.8).*(0.3981*sin(2*pi*196*t) + sin(2*pi*2*196*t) + 0.4618*sin(2*pi*3*196*t) + 0.1437*sin(2*pi*4*196*t)...
+ 0.05462*sin(2*pi*5*196*t) + 0.01186*sin(2*pi*6*196*t) + 0.002031*sin(2*pi*7*196*t) + 0.005855*sin(2*pi*8*196*t)...
+ 0.003145*sin(2*pi*9*196*t));

% Comparing the recording of string 3 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
plot(t, v, 'b-')
title('String 3 Comparison')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring3, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring3, Fs)

%% String 2

clc; clear all; close all;

[v, Fs, nbits]= wavread('string02.wav');   % Reads the string02.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n\n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 2 - Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are :\n')
fprintf('1.0000 at 247Hz\n');
fprintf('0.7518 at 494Hz\n');
fprintf('0.3815 at 741Hz\n');
fprintf('0.1095 at 988Hz\n');
fprintf('0.03492 at 1235Hz\n');
fprintf('0.00826 at 1482Hz\n');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring2 = exp(-t/1.8).*(sin(2*pi*247*t) + 0.7518*sin(2*pi*2*247*t) + 0.3815*sin(2*pi*3*247*t) + 0.1095*sin(2*pi*4*247*t)...
+ 0.03492*sin(2*pi*5*247*t) + 0.00826*sin(2*pi*6*247*t));

% Comparing the recording of string 2 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
plot(t, v, 'b-')
title('String 2 Comparison')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring2, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring2, Fs)


%% String 1

clc; clear all; close all;

[v, Fs, nbits]= wavread('string01.wav');   % Reads the string01.wav file and places the amplitudes samples in v
                                           % and the sampling rate used in Fs, and the number of bits in nbits
                                           
fprintf('Sampling rate:    Fs = %6.1f samples/sec \n',Fs);  % Display the sampling rate to the screen
fprintf('nnumber of bits:  n  = %d bits/sample \n\n',nbits);  % Display the number of bits to the screen

Ts = 1/Fs;                                 % Compute the sampling time Ts
N = length(v);                             % Check the number of samples in vector v (the waveform)
t = Ts*[0:1:N-1];                          % Create time samples separated by the sampling time Ts

df = Fs/N;                                 % Compute the frequency resolution df of the frequency spectrum
f = df*[0:1:N-1];                          % Create the frequency samples separated by the frequency resolution df

Vf  = (1/N)*fft(v);                         % Compute the frequency spectrum samples using the FFT
Vfm = abs(Vf)/max(abs(Vf));                 % Compute the magnitude samples and normalize to 0-1

figure(2)
plot(f, Vfm, 'r-')                         % Plot the frequency spectrum (magnitude)
axis([0 2000 0 1])                         % Restrict the plot to 0 to 2000 (x-axis) and to 0 to 1 (y-axis)  
title('String 1 - Frequency Spectrum')
xlabel('frequency (Hz)')
ylabel('amplitude')

fprintf('According to the frequency spectrum of the string the peaks are :\n')
fprintf('1.0000 at 330Hz\n');
fprintf('0.5258 at 660Hz\n');
fprintf('0.2194 at 990Hz\n');
fprintf('0.01046 at 1320Hz\n');
fprintf('0.0158 at 1650Hz\n');

% Taking into account the peaks of the frequency spectrum and the
% exponential decay, we arrive at the following model:

vmodelstring1 = exp(-t/1.8).*(sin(2*pi*330*t) + 0.5258*sin(2*pi*2*330*t) + 0.2194*sin(2*pi*3*330*t) + 0.01046*sin(2*pi*4*330*t)...
+ 0.0158*sin(2*pi*5*330*t));

% Comparing the recording of string 1 with our model, we arrive at the
% following:

figure(3)
subplot(2,1,1)
plot(t, v, 'b-')
title('String 1 Comparison')
legend('recording')
subplot(2,1,2)
plot(t, vmodelstring1, 'r-')
legend('model')
xlabel('time in seconds')

soundsc(v, Fs)
pause(1)
soundsc(vmodelstring1, Fs)

%% Play a Song

% clc; clear all; close all;
% 
% nbits = 16;
% Fs    = 8000;
% Ts    = 1/Fs;
% measure  = 2;
% t1    = [0:Ts:measure];
% t2    = [0:Ts:measure/2];
% t4    = [0:Ts:measure/4];
% 
% vt1 = [(note(5,2,t4)+note(4,4,t4)) (note(5,2,t4)+note(4,4,t4)) (note(5,2,t4)+note(4,6,t4)) (note(5,2,t4)+note(4,7,t4))];
% vt2 = [(note(5,0,t4)+note(4,2,t4)) (note(5,0,t4)+note(4,2,t4)) (note(5,0,t4)+note(4,4,t4)) (note(4,5,t4)+note(4,5,t4))];
% 
% vt = [vt1 vt2];
% 
% vout = vt/max(vt);
% sound(vout, Fs)
% wavwrite(vout, Fs, nbits, 'song.wav');

%% Note Function

% function v = note(string, fret, t)
%     if string == 6
%         fx = 82*2^(fret/12);
%         v = exp(-t/1.8).*(0.5435*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.5796*sin(2*pi*3*fx*t) + 0.4323*sin(2*pi*4*fx*t)...
%         + 0.04223*sin(2*pi*5*fx*t) + 0.01019*sin(2*pi*6*fx*t) + 0.02961*sin(2*pi*7*fx*t) + 0.02838*sin(2*pi*8*fx*t)...
%         + 0.03048*sin(2*pi*9*fx*t) + 0.03249*sin(2*pi*10*fx*t) + 0.02729*sin(2*pi*11*fx*t));
%     end
% 
%     if string == 5
%         fx = 110*2^(fret/12); 
%         v = exp(-t/1.8).*(0.8699*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.8351*sin(2*pi*3*fx*t) + 0.3423*sin(2*pi*4*fx*t)...
%         + 0.09942*sin(2*pi*5*fx*t) + 0.04029*sin(2*pi*6*fx*t) + 0.006155*sin(2*pi*7*fx*t) + 0.01486*sin(2*pi*8*fx*t)...
%         + 0.01224*sin(2*pi*9*fx*t) + 0.01422*sin(2*pi*10*fx*t) + 0.009308*sin(2*pi*11*fx*t));
%     end
%     
%     if string == 4
%          fx = 147*2^(fret/12);
%          v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.8203*sin(2*pi*2*fx*t) + 0.6749*sin(2*pi*3*fx*t) + 0.3867*sin(2*pi*4*fx*t)...
%          + 0.04026*sin(2*pi*5*fx*t) + 0.02066*sin(2*pi*6*fx*t) + 0.002542*sin(2*pi*7*fx*t) + 0.004651*sin(2*pi*8*fx*t)...
%          + 0.01059*sin(2*pi*9*fx*t) + 0.004409*sin(2*pi*10*fx*t) + 0.003416*sin(2*pi*11*fx*t));
%     end
%     
%     if string == 3
%          fx = 196*2^(fret/12);
%          v = exp(-t/1.8).*(0.3981*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.4618*sin(2*pi*3*fx*t) + 0.1437*sin(2*pi*4*fx*t)...
%          + 0.05462*sin(2*pi*5*fx*t) + 0.01186*sin(2*pi*6*fx*t) + 0.002031*sin(2*pi*7*fx*t) + 0.005855*sin(2*pi*8*fx*t)...
%          + 0.003145*sin(2*pi*9*fx*t));
%     end
%     
%     if string == 2
%          fx = 247*2^(fret/12);
%          v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.7518*sin(2*pi*2*fx*t) + 0.3815*sin(2*pi*3*fx*t) + 0.1095*sin(2*pi*4*fx*t)...
%          + 0.03492*sin(2*pi*5*fx*t) + 0.00826*sin(2*pi*6*fx*t));
%     end
%     
%     if string == 1
%          fx = 330*2^(fret/12);
%          v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.5258*sin(2*pi*2*fx*t) + 0.2194*sin(2*pi*3*fx*t) + 0.01046*sin(2*pi*4*fx*t)...
%          + 0.0158*sin(2*pi*5*fx*t));
%     end
% end 

