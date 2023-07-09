function success=eat(naiveBee, source)

global  ENV_DATA IT_STATS N_IT
pos = naiveBee.pos;

% if source1 is found, calculate distance between current location and
% source
if source == 1
    dis = sqrt((ENV_DATA.source1.pos(:,1)-pos(:,1)).^2+(ENV_DATA.source1.pos(:,2)-pos(:,2)).^2);
end
   
if source == 2
   dis = sqrt((ENV_DATA.source2.pos(:,1)-pos(:,1)).^2+(ENV_DATA.source2.pos(:,2)-pos(:,2)).^2);
end

% if collect radius is smaller than distance, successfully collect
if naiveBee.collectRadius <= dis
    if source == 1
        IT_STATS.findS1(N_IT + 1) = 1;
    elseif source == 2
        IT_STATS.findS2(N_IT + 1) = 1;
    end
    success = true;
else
    success = false;
end
end
    
   
