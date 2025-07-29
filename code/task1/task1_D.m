%
freqs = [200, 400, 600];
amps = [1, 0.5, 0.2];

figure('Name', 'Fourier Series Coefficients of Sine Waves');

for i = 1:3
    f = freqs(i);
    A = amps(i);

    % k = +-1
    a1 =  A / (2j);
    a_neg1 = -A / (2j);

    f_plot = [-f, f];
    a_plot = [a_neg1, a1];

    subplot(3,2,2*i-1);
    stem(f_plot, abs(a_plot), 'filled', 'LineWidth', 2);
    title(['|a_k| for f = ', num2str(f), ' Hz']);
    xlabel('Frequency (Hz)');
    ylabel('|a_k|');
    grid on;

    subplot(3,2,2*i);
    stem(f_plot, angle(a_plot), 'filled', 'LineWidth', 2);
    title(['\angle a_k for f = ', num2str(f), ' Hz']);
    xlabel('Frequency (Hz)');
    ylabel('Phase (rad)');
    ylim([-pi, pi]);
    yticks([-pi, -pi/2, 0, pi/2, pi]);
    yticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'});
    grid on;
    
end