[y, Fs] = audioread('../audio/MaxRichter-Path.wav');

% Plot spectrogram using default settings
figure;
spectrogram(y, [], [], [], Fs, 'yaxis');
title('Spectrogram of Original Audio');
