function [agent]=create_agents(nr,nf)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nr - number of rabbits
%nf - number of foxes

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
%因为位置信息是存在Message List中，所以要先生成位置信息，再创建对象。
%其实也可以在生成对象的时候生成位置信息，再存到MessageList中
 
bm_size=ENV_DATA.bm_size;
%rand(nr,2) nr行2列的矩阵

%原数据
rloc=(bm_size-1)*rand(nr,2)+1;      %generate random initial positions for rabbits
floc=(bm_size-1)*rand(nf,2)+1;      %generate random initial positions for foxes


MESSAGES.pos=[rloc;floc];

%generate all rabbit agents and record their positions in ENV_MAT_R
for r=1:nr
    %将之前生成的位置信息保存到agent的参数里
    pos=rloc(r,:);
    %create rabbit agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    %ceil 朝正无穷四舍五入
    %rand生成0到1的随机数
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.R_BRDFQ);
    agent{r}=rabbit(age,food,pos,PARAM.R_SPD,lbreed);
end

%generate all fox agents and record their positions in ENV_MAT_F
for f=nr+1:nr+nf
    pos=floc(f-nr,:);
    %create fox agents with random ages between 0 and 10 days and random
    %food levels 20-40
    age=ceil(rand*10);
    food=ceil(rand*20)+20;
    lbreed=round(rand*PARAM.F_BRDFQ);
    agent{f}=fox(age,food,pos,PARAM.F_SPD,lbreed);
end
