function Hd = myCheby2
%MYCHEBY2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 15-Nov-2013 01:31:21

% Chebyshev Type II Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

Fpass = 2500;        % Passband Frequency
Fstop = 4000;        % Stopband Frequency
Apass = 3;           % Passband Ripple (dB)
Astop = 95;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]
