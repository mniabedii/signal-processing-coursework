[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

y = y(1:Fs * 5);  % first 5 seconds of the audio file

h = [0.25, 0.25, 0.25, 0.25];

% Perform convolution in time domain
y_conv = conv(y, h);