%
Fs = 5000;
t = 0:1/Fs:0.01;

freqs = [200, 400, 600];
amps = [1, 0.5, 0.2];

x1 = amps(1) * sin(2*pi*freqs(1)*t);
x2 = amps(2) * sin(2*pi*freqs(2)*t);
x3 = amps(3) * sin(2*pi*freqs(3)*t);

% Plot
figure;
plot(t*1000, x1, 'b', 'LineWidth', 1);
hold on;
plot(t*1000, x2, 'r', 'LineWidth', 1);
plot(t*1000, x3, 'g', 'LineWidth', 1);
title('Time-Domain Comparison of Three Sine Waves');
xlabel('Time (ms)');
ylabel('Amplitude');
legend('200 Hz, A=1', '400 Hz, A=0.5', '600 Hz, A=0.2');
grid on;
