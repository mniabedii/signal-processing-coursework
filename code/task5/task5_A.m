%
Fs = 5000;
t = 0:1/Fs:1-1/Fs;

f = 440;                  % Fundamental frequency (A note)
x = sawtooth(2*pi*f*t);   % Generate sawtooth wave

plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sawtooth Wave at 440 Hz');
grid on;
