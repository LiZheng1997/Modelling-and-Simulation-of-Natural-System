function directlyFlyToSource(source, i)
% foragers which have memory fly to source in memory
global MESSAGES
if source == 1
    locX = rand*400 + 400;
    locY = rand*400 + 800;
    pos = [locX, locY];
    MESSAGES.Foragers{i}.travelDistance = sqrt(sum((MESSAGES.Foragers{i}.pos - pos).^2));
    MESSAGES.Foragers{i}.pos = pos;
elseif source == 2
        locX = rand*400 + 400;
        locY = rand*400;
        pos = [locX, locY];
        MESSAGES.Foragers{i}.travelDistance = sqrt(sum((MESSAGES.Foragers{i}.pos - pos).^2));
        MESSAGES.Foragers{i}.pos = pos;     
end
    
end

