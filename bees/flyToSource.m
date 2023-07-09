function flyToSource(source, index)
    % bees directly fly to area around source
global MESSAGES
    if source == 1
        locX = rand*400 + 400;
        locY = rand*400 + 800;
        pos = [locX, locY];
        MESSAGES.NaiveBees{index}.travelDistance = sqrt(sum((MESSAGES.NaiveBees{index}.pos - pos).^2));
        MESSAGES.NaiveBees{index}.pos = pos;
        MESSAGES.NaiveBees{index}.memorySource = 1;
        
    elseif source == 2
        locX = rand*400 + 400;
        locY = rand*400;
        pos = [locX, locY];
        MESSAGES.NaiveBees{index}.travelDistance = sqrt(sum((MESSAGES.NaiveBees{index}.pos - pos).^2));
        MESSAGES.NaiveBees{index}.pos = pos;
        MESSAGES.NaiveBees{index}.memorySource = 2;
    end
end

