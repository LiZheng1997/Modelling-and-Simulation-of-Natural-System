function [agt,eaten]=eat(agt,cn)

%eating function for class FOX
%agt=fox object
%cn - current agent number
%eaten = 1 if fox successfully finds a rabbit, =0 otherwise

%SUMMARY OF FOX EAT RULE
%Fox calculates distance to all rabbits   计算离每个兔子的距离
%Fox identifies nearest rabbits(s)   找到距离最近的兔子
%If more than one equidistant within search radius, one is randomly picked
%如果多个兔子的距离相同，随机选一只

%Probability of fox killing rabbit =1 - distance of rabbit/speed of fox

%If probability > rand, fox moves to rabbit location and rabbit is
%killed

%If fox does not kill rabbit, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES %三个全局变量
   
pos=agt.pos;                        %extract current position 
cfood=agt.food;                     %get current agent food level
spd=agt.speed;                      %fox migration speed in units per iteration - this is equal to the food search radius
hungry=1;
eaten=0;
%找到兔子的index 前面设置了兔子的type是1
typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all rabbits
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all rabbits
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all rabbits
%d是距离
[d,ind]=min(csep);                                            %d is distance to closest rabbit, ind is index of that rabbit
nrst=rb(ind);                                                %index of nearest rabbit(s)

if d<=spd&length(nrst)>0    %if there is at least one  rabbit within the search radius        
    if length(nrst)>1       %if more than one rabbit located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);  %有多只兔子最小距离相同，随机选一只吃
    end
    pk=1-(d/spd);                       %probability that fox will kill rabbit is ratio of speed to distance
    if pk>rand       %如果概率>随机生成的0-1之间的数
        %1是第一列数据X，2是第二列数据Y
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this rabbit
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        agt.food=cfood+1;           %increase agent food by one unit 狐狸食物+1
        agt.pos=npos;               %move agent to position of this rabbit 狐狸移动到被吃兔子的位置
        %更新当前循环被吃的兔子数量，N_IT是全局变量，当前循环数
        IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        eaten=1;
        hungry=0; %捉到兔子，不饿了
        MESSAGES.dead(nrst)=1;       %send message to rabbit so it knows it's dead!
    end
end
if hungry==1
    agt.food=cfood-1;     %if no food, then reduce agent food by one unit 没有新的食物，消耗本身存储的食物
end


   
