% CDMA example

% Use 32-bit LFSR for spreading sequences
state = zeros(1,32);
state(1) = 1;
taps = [32 30 26 25];

for t=1:1000
   state = lfsr_model(state,taps);
   
   % Grab one bit from state and convert it to +1/-1
   seq(t) = 2*state(1)-1;
end


data1 = [ones(1,16) zeros(1,16) ones(1,16) ones(1,16) ones(1,16) zeros(1,16) ones(1,16) ones(1,16) 1];
data1 = 2*data1 - 1;

data2 = [ones(1,16) ones(1,16) zeros(1,16) zeros(1,16)  ones(1,16)  ones(1,16) zeros(1,16) ones(1,16) 1];
data2 = 2*data2 - 1;

spread1 = seq(10:(10+128));
spread2 = seq(410:(410+128));

t = 1:length(spread1);

f=figure(1)
clf
set(f,'Renderer', 'painters', 'Position', [10 500 800 400])

subplot(3,1,1)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,data1,'b')
axis off
ylabel('Data 1')
text(-20,0,'Data 1')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,2)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,spread1,'b')
axis off
ylabel('LFSR 1')
text(-20,0,'LFSR 1')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,3)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,data1.*spread1,'b')
axis off
ylabel('CDMA 1')
text(-20,0,'CDMA 1')
text(-10,1,'+1')
text(-10,-1,'-1')

f=figure(2)
clf
set(f,'Renderer', 'painters', 'Position', [850 500 800 400])

subplot(3,1,1)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,data2,'b')
axis off
ylabel('Data 2')
text(-20,0,'Data 2')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,2)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,spread2,'b')
axis off
ylabel('LFSR 2')
text(-20,0,'LFSR 2')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,3)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,data2.*spread2,'b')
axis off
ylabel('CDMA 2')
text(-20,0,'CDMA 2')
text(-10,1,'+1')
text(-10,-1,'-1')


f=figure(3)
clf
set(f,'Renderer', 'painters', 'Position', [10 50 800 400])

subplot(3,1,1)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
text(-20,0,'Joint Signal')
text(-10,1,'+1')
text(-10,-1,'-1')

stairs(t,data2.*spread2+data1.*spread1,'b')
axis off

subplot(3,1,2)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,0.5*(data2.*spread2+data1.*spread1).*spread1,'b')
hold on

stairs(t,data1,'r:')
axis off
text(-20,0,'Despread 1')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,3)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,movsum((data2.*spread2+data1.*spread1).*spread1,8)/8,'b')
hold on



stairs(t,data1,'r:')
axis off
text(-20,0,'Recovered 1')
text(-10,1,'+1')
text(-10,-1,'-1')


f=figure(4)
clf
set(f,'Renderer', 'painters', 'Position', [850 50 800 400])

subplot(3,1,1)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
text(-20,0,'Joint Signal')
text(-10,1,'+1')
text(-10,-1,'-1')

stairs(t,data2.*spread2+data1.*spread1,'b')
axis off

subplot(3,1,2)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,0.5*(data2.*spread2+data1.*spread1).*spread2,'b')
hold on

stairs(t,data2,'r:')
axis off
text(-20,0,'Despread 2')
text(-10,1,'+1')
text(-10,-1,'-1')

subplot(3,1,3)
plot([-5 129],[1 1],'k:', [-5 129],[-1 -1],'k:')
hold on
stairs(t,movsum((data2.*spread2+data1.*spread1).*spread2,8)/8,'b')
hold on

stairs(t,data2,'r:')

text(-20,0,'Recovered 2')
text(-10,1,'+1')
text(-10,-1,'-1')

axis off
