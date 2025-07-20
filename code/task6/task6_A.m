[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

% Define crossover frequency
fc = 2000;  % 2 kHz
order = 4;
Wn = fc / (Fs / 2);

% Design low-pass filter (for woofer)
[bl, al] = butter(order, Wn, 'low');

% Design high-pass filter (for tweeter)
[bh, ah] = butter(order, Wn, 'high');