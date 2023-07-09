%IF neuron
clc;
clear;

fs=16;% font size

V0=30;%mV
T=150;%msec
dt=0.1; %msec
taum=10;%ms Time constant
taum_adapt=130;%

Vrest=-75;
Vthres=-50;
theta0=-46;

%this is the initial simulation with 0.9 times theta0
theta_1 = -0.9*theta0;
%this is the set vaule of theta_1, and it is 0.2 times theta0
theta_2 = -0.2*theta0;
%this is the higer theta_1 value with 1.1 times theta0
theta_3 = -1.1*theta0;

tf=175;
C = (-theta_1/taum_adapt)*exp(tf*0.1/taum_adapt);
C_2 = (-theta_2/taum_adapt)*exp(tf*0.1/taum_adapt);
C_3 = (-theta_2/taum_adapt)*exp(tf*0.1/taum_adapt);

maxsteps=round(T/dt);
V=zeros(1,round(T/dt));
V_1=zeros(1,round(T/dt));
V_2=zeros(1,round(T/dt));
V_3=zeros(1,round(T/dt));

V(1,1)=Vrest;
V_1(1,1)=Vrest;
V_2(1,1)=Vrest;
V_3(1,1)=Vrest;

beta=dt/taum;
alpha=1-beta;
theta_t = [];
theta_t_2 = [];
theta_t_3 = [];

count_time = [];
count_time_2 = [];
count_time_3 = [];
t= [];
t_2= [];
t_3= [];

% for timestep=2:1:maxsteps
%     V_1(1,timestep)=alpha*V_1(1,timestep-1)+beta*Vrest+beta*V0;
%     if V_1(1,timestep)>Vthres
%        V_1(1,timestep)=Vrest;
%        V_1(1,timestep-1)=1; %trick to make spikes look good
%     end
% end

for timestep=2:1:maxsteps
    V(1,timestep)=alpha*V(1,timestep-1)+beta*Vrest+beta*V0;
    if V(1,timestep)>Vthres
       V(1,timestep)=Vrest;
       V(1,timestep-1)=1; %trick to make spikes look good
       count_time(end+1) = timestep;
       for i = 1:length(count_time)-1
           t(end+1) = count_time(i)-timestep;
       end
       theta_t = sum(exp(t*0.1/taum_adapt))* (1/taum_adapt) *theta_1+theta0+exp(-(timestep*0.1)/taum_adapt)*C;
       if theta_t <theta0 
        Vthres = theta_t;
       end
    end
end

for timestep=2:1:maxsteps
    V_2(1,timestep)=alpha*V(1,timestep-1)+beta*Vrest+beta*V0;
    if V_2(1,timestep)>Vthres
       V_2(1,timestep)=Vrest;
       V_2(1,timestep-1)=1; %trick to make spikes look good
       count_time_2(end+1) = timestep;
       for i = 1:length(count_time_2)-1
           t_2(end+1) = count_time_2(i)-timestep;
       end
       theta_t_2 = sum(exp(t_2*0.1/taum_adapt))* (1/taum_adapt) *theta_2+theta0+exp(-(timestep*0.1)/taum_adapt)*C_2;
       if theta_t_2 <theta0 
        Vthres = theta_t_2;
       end
    end
end

for timestep=2:1:maxsteps
    V_3(1,timestep)=alpha*V(1,timestep-1)+beta*Vrest+beta*V0;
    if V_3(1,timestep)>Vthres
       V_3(1,timestep)=Vrest;
       V_3(1,timestep-1)=1; %trick to make spikes look good
       count_time_3(end+1) = timestep;
       for i = 1:length(count_time_3)-1
           t_3(end+1) = count_time_3(i)-timestep;
       end
       theta_t_3 = sum(exp(t_3*0.1/taum_adapt))* (1/taum_adapt) *theta_3+theta0+exp(-(timestep*0.1)/taum_adapt)*C_3;
       if theta_t_3 <theta0 
        Vthres = theta_t_3;
       end
    end
end

time=0:dt:T-dt;
% plot(theta,interval,'LineWidth',2);
% This is the plot function using time as the x axis and y as the 
% y axis, uncomment it to see the spiking neuro model with Eluer method,
plot(time,V,'LineWidth',0.5)
xlabel('Time (ms)','fontsize',fs);
ylabel('Membrane potential (mV)','fontsize',fs);
set(gca,'fontsize',fs);
hold on
plot(time,V_2,'LineWidth',0.5)
xlabel('Time (ms)','fontsize',fs);
ylabel('Membrane potential (mV)' ,'fontsize',fs);
set(gca,'fontsize',fs);
hold on
plot(time,V_3,'LineWidth',0.5)
xlabel('Time (ms)','fontsize',fs);
ylabel('Membrane potential (mV)' ,'fontsize',fs);
set(gca,'fontsize',fs);
