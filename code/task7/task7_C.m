[y, Fs] = audioread('../audio/MaxRichter-Path.wav');
y = y(1:Fs * 5);  % first 5 seconds of the audio

h = [0.25, 0.25, 0.25, 0.25];

% Time-domain convolution
y_conv = conv(y, h);

% Frequency-domain convolution
N = length(y) + length(h) - 1;
Y = fft(y, N);
H = fft(h, N);
G = Y .* H;
g = ifft(G);

% Create time vectors for plotting
t_yconv = (0:length(y_conv)-1) / Fs;
t_g = (0:length(g)-1) / Fs;

% Plotting
figure;
plot(t_yconv, y_conv, 'b', 'LineWidth', 1.5, 'DisplayName', 'Time-domain convolution (y\_conv)');
hold on;
plot(t_g, real(g), 'r--', 'LineWidth', 1.5, 'DisplayName', 'Freq-domain convolution (g)');

xlabel('Time (seconds)');
ylabel('Amplitude');
title('Comparison of Time-domain & Frequency-domain Convolution');
legend;
grid on;

% Plot time-domain convolution on first figure
figure;
plot(t_yconv, y_conv, 'r', 'LineWidth', 1.5);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time-domain Convolution (y\_conv)');
grid on;

% Plot frequency-domain convolution on second figure
figure;
plot(t_g, real(g), 'b', 'LineWidth', 1.5);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Frequency-domain Convolution (g)');
grid on;