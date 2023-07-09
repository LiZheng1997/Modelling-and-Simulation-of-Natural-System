%EV COM3001
clear; % clears the variables 
close all;
clc;

%slope field
N=20; % number of samples
tmin=0; 
tmax=10;  
xmin=0; 
xmax=1.3;
fs=18;

a=2;
[t,x]=meshgrid(tmin:(tmax-tmin)/N:tmax,xmin:(xmax-xmin)/N:xmax); 
dx=a*x.*(1-x); 
dt=ones(size(x));
L=sqrt(dt.^2 + dx.^2); 
L=L+1e-10; % just in case L==0 
dx=dx./L; % normalizeation
dt=dt./L;  
h=quiver(t,x,dt,dx); 
set(h,'linewidth',1.5);
axis tight
set(gca,'fontsize',fs);
xlabel('time','fontsize',fs);
ylabel('fraction of population','fontsize',fs);
title('slope field','fontsize',fs)



%-------------------------------------------------------
%analytical solution - different alpha

t=0:0.01:50;

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
    y=k*exp(a(i)*t) ./ (1-k+k*exp(a(i)*t)); %analytical solution
    h=plot(t,y,'LineWidth',2,'Color',colour(i));
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('a=0.1','a=0.2','a=0.3','a=0.4','Location','best')


%analytical solution - different x0

tmin=0;
tmax=5;

dt=0.01;

a=2;

t1=tmin:dt:tmax;
xinit=[0 0.1 1 1.1];
lx=length(xinit);

colour=['r','g','b','k'];

figure;


for i=1:lx %analytical solution
    xsol=xinit(i)*exp(a*t1)./(1-xinit(i)+xinit(i)*exp(a*t1));
    plot(t1,xsol,'LineWidth',2,'Color',colour(i))
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);
legend('x(0)=0','x(0)=0.1','x(0)=1','x(0)=1.1','Location','best')




%-------------------------------------------------------
%Stability analysis

tmin=0;
tmax=5;

dt=0.01;

a=2;

t1=tmin:dt:tmax;
xinit=[0:0.1:5];
lx=length(xinit);


figure;


for i=1:lx %analytical solution
    xsol=xinit(i)*exp(a*t1)./(1-xinit(i)+xinit(i)*exp(a*t1));
    plot(t1,xsol,'LineWidth',2)
    hold on
end

xlabel('time','fontsize',fs);
ylabel('Population size','fontsize',fs);
set(gca,'fontsize',fs);


