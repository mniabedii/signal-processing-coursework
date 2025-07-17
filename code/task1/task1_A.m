%
Fs = 5000;              % Sampling frequency (Hz) for MATLAB
t = 0:1/Fs:0.01;        % Time vector for 10 ms

freqs = [200, 400, 600];
amps = [1, 0.5, 0.2];

figure;
for i = 1:length(freqs)
    f = freqs(i);
    A = amps(i);
    
    % Sinusoidal Signal
    x = A * sin(2*pi*f*t);
    
    % Plot
    subplot(length(freqs), 1, i);
    plot(t*1000, x);
    title(['Sine Wave: f = ', num2str(f), ' Hz, Amplitude = ', num2str(A)]);
    xlabel('Time (ms)');
    ylabel('Amplitude');
    grid on;
    xlim([0 max(t)*1000]);
end