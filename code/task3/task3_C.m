[y, Fs] = audioread('../audio/MaxRichter-Path.wav');
t = (0:length(y)-1)' / Fs;

noise_500Hz = 0.15 * sin(2 * pi * 500 * t);
noise_1000Hz = 0.15 * sin(2 * pi * 1000 * t);
y_noisy = y + noise_500Hz + noise_1000Hz;

% Design notch filter for 500 Hz
f0_1 = 500;                    % Notch frequency
Q = 35;                        % Quality factor (sharpness of the notch)
w0_1 = f0_1/(Fs/2);            % Normalized frequency
[b1, a1] = iirnotch(w0_1, w0_1/Q);

% Design notch filter for 1000 Hz
f0_2 = 1000;
w0_2 = f0_2/(Fs/2);
[b2, a2] = iirnotch(w0_2, w0_2/Q);

% Apply filters
y_filtered = filter(b1, a1, y_noisy);
y_filtered = filter(b2, a2, y_filtered);