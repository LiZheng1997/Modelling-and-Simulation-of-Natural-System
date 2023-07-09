%IF neuron
clc;
clear;

fs=16;% font size

I0=30;%mA
T=100;%msec
dt=0.1; %msec
taum=10;%ms Time constant



Vrest=-75;
Vthres=-50;
C = Vrest-I0; %constant number for the 

maxsteps=round(T/dt);

I=zeros(1,round(T/dt));
I_1 = zeros(1,round(T/dt));

I(1,1)=Vrest;
I_1(1,1)=Vrest;

beta=dt/taum;
alpha=1-beta;


for timestep=2:1:maxsteps
    I(1,timestep)=alpha*I(1,timestep-1)+beta*Vrest+beta*I0;
end
% syms time;
time=0:dt:T-dt;

for timestep=2:1:maxsteps
    Const = exp(-(timestep*0.1)/taum);
    I_1(1,timestep)= C* Const+I0;
end

h1 = plot(time,I,'r--','LineWidth',2);
xlabel('Time (ms)','fontsize',fs);
ylabel('Membrane potential','fontsize',fs);
set(gca,'fontsize',fs);
hold on;
h2 = plot(time,I_1,'LineWidth',2);
xlabel('Time (ms)','fontsize',fs);
ylabel('Membrane potential','fontsize',fs);
set(gca,'fontsize',fs);
axis square;
hold off
xlim auto
legend([h2,h1],'analytical solution','Euler');