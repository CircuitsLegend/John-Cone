fclk = 500e6;     % Main clock frequency
fpwm = fclk/256;  % PWM signal frequency, 256 cycles per pwm period

f_low = 65.406; % Frequency of a low C

% Number of samples:
% If all samples are played at the sample rate equal to
% fpwm, then the resulting audio signal will be f_low:
Nsamp = round(fpwm/f_low)

% Generate 8-bits per sample, unsigned.

dt = 2*pi/Nsamp;
t = 0:dt:(2*pi-dt);
y = round(255*(0.5 + 0.5*sin(t)));


% Save samples in hexadecimal format:
fid = fopen('sin_samples.dat','w');
for i=1:numel(y)
    fprintf(fid,'%x\n',y(i));
end

fclose(fid);

