[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

fc = 2000;
order = 4;
Wn = fc / (Fs / 2);

[bl, al] = butter(order, Wn, 'low');   % Low-pass filter
[bh, ah] = butter(order, Wn, 'high');  % High-pass filter

low_freq_signal = filter(bl, al, y);   % Output for woofer
high_freq_signal = filter(bh, ah, y);  % Output for tweeter

%----------------------------------------------------------------

% Plot frequency responses
[H_low, f_low] = freqz(bl, al, 1024, Fs);
[H_high, f_high] = freqz(bh, ah, 1024, Fs);

figure;
plot(f_low, abs(H_low), 'b', 'LineWidth', 1.5); hold on;
plot(f_high, abs(H_high), 'r', 'LineWidth', 1.5);
xline(fc, '--k', '2 kHz Crossover');
legend('Low-pass Filter', 'High-pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Response of Crossover Filters');
grid on;
xlim([0 Fs/2]);