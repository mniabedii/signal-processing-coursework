[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

% Filter settings
fc = 2000;            % Crossover frequency = 2 kHz
order = 4;            % Filter order
Wn = fc / (Fs / 2);   % Normalize cutoff frequency (Nyquist)

% Design Butterworth filters
[bl, al] = butter(order, Wn, 'low');   % Low-pass filter (woofer)
[bh, ah] = butter(order, Wn, 'high');  % High-pass filter (tweeter)

% Apply filters
low_freq_signal = filter(bl, al, y);   % Woofer output
high_freq_signal = filter(bh, ah, y);  % Tweeter output

disp('Playing low-frequency (bass) audio...');
sound(low_freq_signal, Fs);

pause(15);

disp('Playing high-frequency (trble) audio...');
sound(high_freq_signal, Fs);

% Save outputs
audiowrite('output_low_freq.wav', low_freq_signal, Fs);
audiowrite('output_high_freq.wav', high_freq_signal, Fs);