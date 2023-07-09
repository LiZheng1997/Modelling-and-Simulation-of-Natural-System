%EV - COM3001
%setenv ("GNUTERM", "x11") 

close all
clear
clc
t=0:0.01:5;

fs=18;

figure

a=[0.1 0.2 0.3 0.4 ];
colour=['r','g','b','k'];

la=length(a);

% k: depends on the intitial value x0 
% for this equation
% k=x0

x0=0.2;
k=x0;

for i=1:la 
    y=k*exp(a(i)*t); %analytical solution
    h=plot(t,y,'LineWidth',2,'Color',colour(i));
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('a=0.1','a=0.2','a=0.3','a=0.4','Location','best')


%----------------------

t=0:0.01:1E3;

fs=18;

figure

a=[0 1E-5];
colour=['r','g','b','k'];

la=length(a);


x0=0.2;
k=x0;

for i=1:la
    y=k*exp(a(i)*t); % analytical solution
    h=plot(t,y,'LineWidth',2,'Color',colour(i));
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('a=0','a=10^{-5}')

%---
figure

t=0:0.01:5;

a=[0.3 0.3+1E-5];
colour=['r','g','b','k'];

la=length(a);


x0=0.2;
k=x0;

for i=1:la
    y=k*exp(a(i)*t); % analytical solution
    h=plot(t,y,'LineWidth',2,'Color',colour(i));
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('a=0.3','a=0.3+10^{-5}')



%--------------------------------------------------------

