clear

% filter parameter:
a = 1/128;

% Discrete time steps:
m = 0:10000;

% Parameters for two superimposed sinusoids:
A1 = 64;     % high-amplitude
f1 = 0.0001; % low-freq

A2 = 16;   % low-amplitude
f2 = 0.01; % high-freq

x = round(A1*sin(2*pi*f1*m) + A2*sin(2*pi*f2*m));

y(1) = 0;
z(1) = 0;  % Use 'z' as a higher-resolution internal signal

for m_idx = 1:(numel(m)-1)
    % When computing z, add THREE extra bits:
    z(m_idx+1) = 2*z(m_idx) + a*(8*x(m_idx+1) - 2*z(m_idx))  ;
    
    % Add 1:
     z(m_idx+1) =  z(m_idx+1) + 1;
     % Remove lowest bit:
     z(m_idx+1) =  floor(z(m_idx+1)/2);
    
    % To extract y, remove 1 bit from z:
    y(m_idx+1) = floor(z(m_idx)/2);

    % Add 1:
    y(m_idx+1) =y(m_idx+1) +1;
    % Chop:
    y(m_idx+1) = floor(y(m_idx+1)/2);

end

figure(1)
plot(m,x,'k',m,y,'r')
legend('x','y')

