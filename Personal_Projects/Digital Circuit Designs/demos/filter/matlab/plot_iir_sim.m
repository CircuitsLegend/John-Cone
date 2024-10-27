d = importdata('../iir_sim.txt');

m = d(:,1);
x = d(:,2);
y = d(:,3);

plot(m,x,'k',m,y,'r')
