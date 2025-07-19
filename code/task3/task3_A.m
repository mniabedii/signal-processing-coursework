[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

t = (0:length(y)-1)' / Fs;

% Generate sinusoidal noise
noise_500Hz = 0.15 * sin(2 * pi * 500 * t);
noise_1000Hz = 0.15 * sin(2 * pi * 1000 * t);

% Add 500 Hz noise
y_500Hz_noisy = y + noise_500Hz;
sound(y_500Hz_noisy, Fs)
pause(3);

% Add 1000 Hz noise
y_1000Hz_noisy = y + noise_1000Hz;
sound(y_1000Hz_noisy, Fs)
pause(3);