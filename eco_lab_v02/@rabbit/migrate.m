function [agt]=migrate(agt,cn)

%migration functions for class RABBIT
%agt=rabbit object
%cn - current agent number

%SUMMARY OF RABBIT MIGRATE RULE
%Rabbits will migrate only if they have not eaten 只有在当前区域没有食物才会移动到其他区域猎食
%Rabbits will always try to migrate towards the nearest food source
%只会在最近的地方找，并且只会在距离小于每天移动距离的地方猎食
%The rabbit will extract the distibution of food in its LOCAL environment (at
%distances < its daily migration limit)

%It will identify the location of the nearest food and migrate into it.
%It's new position will be randomly placed within this square
%如果在附近区域没有找到食物，会随机移动（找到了就移动到食物的位置）
%If no food is detected within its search radius it will move randomly (up
%to 8 atempts without leaving the model edge)

global ENV_DATA IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%interpolated to each grid point
%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

mig=0;                               %indicates whether rabbit has successfully migrated
pos=agt.pos;                         %extract current position 
cpos=round(pos);                     %round up position to nearest grid point（因为地图其实是一个数组，所以要取整对矩阵中的元素，即食物进行操作）   
spd=agt.speed;                       %rabbit migration speed in units per iteration - this is equal to the food search radius

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function reduces the computational overhead. Only LOCAL area
%只会在当前区域觅食
%is searched for food, as opposed to entire environment
%loc_food is food distribution in local search area
%xmin in minimum x co-ord of this area
%ymin is minimum y co-ord of this area
%得到附近区域的食物分布
[loc_food,xmin,ymin]=extract_local_food(cpos,spd);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
mig=0;                          %flag will be reset to one if rabbit migrates
%寻找非零元素的index，(x,y)
[xf,yf]=find(loc_food);        %extract all rows (=x) and columns (=y) of food matrix where food is present
if ~isempty(xf)      %如果X不是一个空数组
    %因为xf和yf是从1开始算的，但是要还原到原来的空间中，是从xmin,ymin到xmax,ymax之间取得，所以要加回去，还要-1。
    %不减的话，index最小值就是xmin+1+xf
    xa=xmin+xf-1;                  %x co-ordiantes of all squares containing food
    ya=ymin+yf-1;                  %y co-ordiantes of all squares containing food
    csep=sqrt((xa-pos(:,1)).^2+(ya-pos(:,2)).^2);   %calculate distance to all food
    [d,nrst]=min(csep);     %d is distance to closest food, nrst is index of that food
    if d<=spd       %if there is at least one lot of food within the search radius        
        if length(nrst)>1       %if more lot of food located at same distance then randomly pick one to head towards
            s=round(rand*(length(nrst)-1))+1;
            nrst=nrst(s);
        end
        
        %调整到刚吃掉的食物的位置
        nx=xa(nrst)+rand-0.5;
        ny=ya(nrst)+rand-0.5;
        npos=[nx ny];
        %if agent has left edge of model, then adjust slightly
        shft=find(npos>=ENV_DATA.bm_size);
        npos(shft)=ENV_DATA.bm_size-rand;
        shft=find(npos<=1);
        npos(shft)=1+rand;
        mig=1;
    end
end
    
if mig==0                                   %rabbit has been unable to find food, so chooses a random direction to move in      
    cnt=1;
    dir=rand*2*pi;              
    while mig==0&cnt<=8                     %如果Mig==0的话，最多可以随机移动8次
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if npos(1)<ENV_DATA.bm_size&npos(2)<ENV_DATA.bm_size&npos(1)>=1&npos(2)>=1   %check that fox has not left edge of model - correct if so.
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
    end
end

if mig==1
    %更新位置
    agt.pos=npos;                                   %update agent memory
    IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;    %update model statistics
end