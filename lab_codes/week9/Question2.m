%IF neuron
clc;
clear;

fs=16;% font size

V0=40;%mV
T=100;%msec
dt=0.1; %msec
taum=10;%ms Time constant

Vrest=-75;
Vthres=-50;

maxsteps=round(T/dt);
V=zeros(1,round(T/dt));
V(1,1)=Vrest;

beta=dt/taum;
alpha=1-beta;
theta = [];
interval = [];
% theta(1) =Vthres;
% interval(1)=0;
count = 0;
for timestep=2:1:maxsteps
    V(1,timestep)=alpha*V(1,timestep-1)+beta*Vrest+beta*V0;
    if V(1,timestep)>Vthres
       V(1,timestep)=Vrest;
       V(1,timestep-1)=1; %trick to make spikes look good
       theta(end+1)= Vthres;
       interval(end+1) = 0.1*(timestep-count);
%       Vrest = Vthres;
       Vthres = Vthres + 1.35;
       count = timestep;
    end
end

time=0:dt:T-dt;
% This is the plot function using time as the x axis and y as the 
% y axis, uncomment it to see the spiking neuro model with Eluer method,
% plot(theta,interval,'LineWidth',2);
% xlabel('Threshold (mV)','fontsize',fs);
% ylabel('Time (ms)','fontsize',fs);
% set(gca,'fontsize',fs);

plot(time,V,'LineWidth',2)
xlabel('Time (ms)','fontsize',fs);
ylabel('Threshold (mV)','fontsize',fs);
set(gca,'fontsize',fs);
