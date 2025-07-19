Fs = 5000;                     % Sampling frequency
t = 0:1/Fs:0.01;               % Time vector (10 ms)

freqs = [200, 400, 600];
amps = [1, 0.5, 0.2];

disp('Playing sounds...');

for i = 1:length(freqs)

    % Generate sinusoid
    x = amps(i) * sin(2*pi*freqs(i)*t);
    
    % Playback
    disp(['Playing ', num2str(freqs(i)), ' Hz...']);
    sound(x, Fs);
    pause(1.5);
end