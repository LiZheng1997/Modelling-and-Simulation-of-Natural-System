function naiveBee = move(naiveBee)

global IT_STATS N_IT ENV_DATA

% bees move in hive
  
hz=ENV_DATA.hiveSize;   
spd=naiveBee.speed;   
pos=naiveBee.pos;     
mig=0;                 
cnt=1;
dir=rand*2*pi;              
while mig == 0 && cnt<=8        
    npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
    npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
    if ENV_DATA.hiveSize<=npos(1) && ENV_DATA.hiveSize<=npos(2) && npos(1)<=ENV_DATA.hiveSize*2 && npos(2)<=ENV_DATA.hiveSize*2 
       mig=1;
    end
    cnt=cnt+1;
    dir=dir+(pi/4);         
end

if mig==1
    
    naiveBee.pos=npos;                   

end


    
   
