[y, Fs] = audioread('../audio/MaxRichter-Path.wav');
t = (0:length(y)-1)' / Fs;

% Generate sinusoidal noise
noise_500Hz = 0.15 * sin(2 * pi * 500 * t);
noise_1000Hz = 0.15 * sin(2 * pi * 1000 * t);

y_500_1000Hz = y + noise_500Hz + noise_1000Hz;

% FFT
Y_500_1000Hz = abs(fft(y_500_1000Hz));
f = (0:length(Y_500_1000Hz)-1) * Fs / length(Y_500_1000Hz);

figure;
plot(f, Y_500_1000Hz)
title('FFT with 500 Hz & 1000 Hz Noise')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 2000])