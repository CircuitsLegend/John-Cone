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

for m_idx = 1:(numel(m)-1)
    y(m_idx+1) = round(y(m_idx) + a*(x(m_idx+1) - y(m_idx)))  ;
end

figure(1)
plot(m,x,'k',m,y,'r')
legend('x','y')

    title('Integer Model')
  xlabel('Time (Samples)')
