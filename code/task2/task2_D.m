[y, Fs] = audioread('../audio/MaxRichter-Path.wav');  % relative path to the audio file

N = length(y);
f = Fs*(0:floor(N/2))/N;              % Frequency vector (one-sided)

Y = fft(y)/N;   % Compute normalized FFT
amplitude = 2*abs(Y(1:floor(N/2)+1));

figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of the Music File');
grid on;
xlim([0 Fs/2]);