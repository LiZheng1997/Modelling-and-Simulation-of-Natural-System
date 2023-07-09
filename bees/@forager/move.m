function forager = move(forager,i)
 % foragers move to search food
global IT_STATS N_IT ENV_DATA PARAM MESSAGES

bm=ENV_DATA.bm_size;   
spd=forager.speed;   %speed
pos=forager.pos;     %extract current position 

mig=0;                
cnt=1;
dir=rand*2*pi;              % move direction

% if no memory, randomly move
if MESSAGES.Foragers{i}.memorySource == 0
    while mig == 0 && cnt<=8        %fox has up to 8 attempts to migrate (without leaving the edge of the model)
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        
        if npos(1)<ENV_DATA.maxFlyZoneX && npos(2) >= ENV_DATA.minFlyZoneY && npos(1)>= ENV_DATA.minFlyZoneX && npos(2)< ENV_DATA.maxFlyZoneY   %check that fox has not left edge of model - correct if so.
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
    end
end

% if forager has memory of source1, moves around source1
if MESSAGES.Foragers{i}.memorySource == 1
    while mig == 0 && cnt<=8        
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if ENV_DATA.leftSource<=npos(1) && ENV_DATA.minEdgeSource1<=npos(2) && npos(1)<=ENV_DATA.rightSource && npos(2)<=ENV_DATA.bm_size  
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         
    end    
end

% if forager has memory of source2, moves around source2
if MESSAGES.Foragers{i}.memorySource == 2
    while mig == 0 && cnt<=8        
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if ENV_DATA.leftSource<=npos(1) && 0<=npos(2) && npos(1)<=ENV_DATA.rightSource && npos(2)<=ENV_DATA.maxEdgeSource2 
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         
    end   
end


if mig==1
    MESSAGES.Foragers{i}.pos = npos;
    MESSAGES.Foragers{i}.travelDistance = MESSAGES.Foragers{i}.travelDistance + PARAM.speed;
    
end
end


    
   
