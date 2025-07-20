[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

y = y(1:Fs * 5);

h = [0.25, 0.25, 0.25, 0.25];

N = length(y) + length(h) - 1;
Y = fft(y, N);
H = fft(h, N);

% Frequency-domain multiplication
G = Y .* H;

% Inverse FFT to get the result in time domain
g = ifft(G);