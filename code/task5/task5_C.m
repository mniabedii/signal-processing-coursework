%
fs = 44100;            % Sampling frequency 
t = 0:1/fs:1-1/fs;
f0 = 440;

% Generate sawtooth wave
y = sawtooth(2 * pi * f0 * t);

% Apply Fourier Transform
Y = abs(fft(y));
n = length(Y);
f = (0:n-1)*(fs/n); 

% Plot the magnitude spectrum (one-sided)
figure;
plot(f(1:n/2), Y(1:n/2));
title('Frequency Spectrum of Sawtooth Wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
xlim([0 5000]);        % Focus on first few harmonics
