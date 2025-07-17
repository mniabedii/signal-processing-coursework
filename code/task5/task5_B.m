fs = 44100;
t = 0:1/fs:1;
f = 440;           

% Generate waves
saw_wave = sawtooth(2*pi*f*t);
sine_wave = sin(2*pi*f*t);

disp('Playing sawtooth wave');
sound(saw_wave, fs);
pause(1.5);

disp('Playing sine wave');
sound(sine_wave, fs);