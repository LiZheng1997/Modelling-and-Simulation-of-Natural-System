
type lotka

%we assume that a = 0.2, b = 0.1, c = 0.3, d = 0.2
a = 1.2;
b = 0.6; 
c= 0.8;
d = 0.8;
dt = 0.1;
t =0:0.1:5;
x = zeros(size(t-1));
y = zeros(size(t-1));

x(1) = 1;
y(1) = 1;
 
for i = 1:50
  x(i+1) = x(i) + ((a*x(i) - b*x(i)*y(i))*dt); 
  y(i+1) = y(i) + ((-c* y(i)+ d* x(i) *y(i))*dt);
end
plot(t,x,'r');
hold on
plot(t,y);

figure
plot(x,y);


% dx = dt * (a*x - b*x*y);

% dy = dt* (-c* y + d*x*Y);
