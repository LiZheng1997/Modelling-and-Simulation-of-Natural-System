
clc
clear
close all


dt=1E-4;
t=0:dt:30;

a=1.2;
b=0.6;
c=0.8;
d=0.8;

x0=1;
y0=1;

lt=length(t)-1;
x=zeros(size(t));
x(1,1)=x0;
y=zeros(size(t));
y(1,1)=y0;

for i=1:lt %numerical solution
    x(1,i+1)=dt*(a*x(1,i)-b*x(1,i)*y(1,i))+x(1,i);
    y(1,i+1)=dt*(-c*y(1,i)+d*x(1,i)*y(1,i))+y(1,i);
end


fs=18;

figure
h=plot(t,x,'LineWidth',2,'Color','b');
hold on
h=plot(t,y,'LineWidth',2,'Color','r');
xlabel('time','fontsize',fs);
ylabel('Population','fontsize',fs);
set(gca,'fontsize',fs);
legend('prey','prediator')

figure
h=plot(x,y,'LineWidth',2,'Color','k');
xlabel('prey','fontsize',fs);
ylabel('predator','fontsize',fs);
title('Euler phase plane plot','fontsize',fs);
set(gca,'fontsize',fs);


