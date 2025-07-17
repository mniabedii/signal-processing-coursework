[y, Fs] = audioread('../audio/MaxRichter-Path.wav');  % relative path ti the audio file
t = (0:length(y)-1) / Fs;

figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal in Time Domain');
grid on;