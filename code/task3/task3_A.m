[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

t = (0:length(y)-1)' / Fs;

% Generate sinusoidal noise at 500 Hz and 1000 Hz
noise_500Hz = 0.15 * sin(2 * pi * 500 * t);
noise_1000Hz = 0.15 * sin(2 * pi * 1000 * t);

% Combine noise signals
total_noise = noise_500Hz + noise_1000Hz;

% Add noise to the original signal
y_noisy = y + total_noise;

sound(y_noisy, Fs)