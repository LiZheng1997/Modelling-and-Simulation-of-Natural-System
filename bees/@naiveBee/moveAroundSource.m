function naiveBee = moveAroundSource(naiveBee, source)
% bees move around source
global IT_STATS N_IT ENV_DATA PARAM

  
hz=ENV_DATA.hiveSize;   
spd=naiveBee.speed;   
pos=naiveBee.pos;     
mig=0;               
cnt=1;
dir=rand*2*pi;  
if source == 1 % around source1
    while mig == 0 && cnt<=8        
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if ENV_DATA.leftSource<=npos(1) && ENV_DATA.minEdgeSource1<=npos(2) && npos(1)<=ENV_DATA.rightSource && npos(2)<=ENV_DATA.bm_size  
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         
    end    
elseif source == 2 % around source2
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
    naiveBee.pos=npos;                   
    naiveBee.travelDistance = naiveBee.travelDistance + PARAM.speed;
end


    
   
