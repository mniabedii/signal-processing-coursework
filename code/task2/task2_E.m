[y, Fs_original] = audioread('../audio/MaxRichter-Path.wav');

Fs_22050 = 22050;
Fs_11025 = 11025;

% Downsample to 22.05 kHz and 11.025 kHz
y_22050 = resample(y, Fs_22050, Fs_original);
y_11025 = resample(y, Fs_11025, Fs_original);

figure;
% ---- Original ----
N1 = length(y);
f1 = Fs_original * (0:floor(N1/2)) / N1;
Y1 = fft(y)/N1;
A1 = 2 * abs(Y1(1:floor(N1/2)+1));

subplot(3,1,1);
plot(f1, A1);
title('Original (44.1 kHz) Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
xlim([0 Fs_original/2]);

% ---- 22.05 kHz ----
N2 = length(y_22050);
f2 = Fs_22050 * (0:floor(N2/2)) / N2;
Y2 = fft(y_22050)/N2;
A2 = 2 * abs(Y2(1:floor(N2/2)+1));

subplot(3,1,2);
plot(f2, A2);
title('Downsampled (22.05 kHz) Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
xlim([0 Fs_22050/2]);

% ---- 11.025 kHz ----
N3 = length(y_11025);
f3 = Fs_11025 * (0:floor(N3/2)) / N3;
Y3 = fft(y_11025)/N3;
A3 = 2 * abs(Y3(1:floor(N3/2)+1));

subplot(3,1,3);
plot(f3, A3);
title('Downsampled (11.025 kHz) Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
xlim([0 Fs_11025/2]);
