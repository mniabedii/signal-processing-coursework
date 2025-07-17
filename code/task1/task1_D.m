%
Fs = 5000;
t = 0:1/Fs:0.01;

freqs = [200, 400, 600];
amps = [1, 0.5, 0.2];

% Generate signals
x1 = amps(1)*sin(2*pi*freqs(1)*t);
x2 = amps(2)*sin(2*pi*freqs(2)*t);
x3 = amps(3)*sin(2*pi*freqs(3)*t);

% FFT parameters
N = length(t);
halfN = floor(N/2);            % Ensure integer index
f = Fs*(0:halfN)/N;            % Frequency vector for plotting (one-sided spectrum) 

% Compute FFT and magnitude
% The FFT (Fast Fourier Transform) calculates the complex Fourier coefficients of each signal.
X1 = abs(fft(x1)/N);
X2 = abs(fft(x2)/N);
X3 = abs(fft(x3)/N);

% Plot frequency spectra
figure;
plot(f, 2*X1(1:halfN+1), 'b', 'LineWidth', 1); hold on;
plot(f, 2*X2(1:halfN+1), 'r', 'LineWidth', 1);
plot(f, 2*X3(1:halfN+1), 'g', 'LineWidth', 1);
title('Frequency Content of Three Sinusoidal Signals');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
legend('200 Hz, A=1', '400 Hz, A=0.5', '600 Hz, A=0.2');
grid on;
xlim([0 1000]);
