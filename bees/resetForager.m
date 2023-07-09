function resetForager()
% reset proporties of forager whose travel distance > max travel distance
global MESSAGES PARAM ENV_DATA N_IT 
    for i = 1:length(MESSAGES.Foragers)
        if (MESSAGES.Foragers{i}.travelDistance > PARAM.maxTravelDistance && MESSAGES.Foragers{i}.memorySource == 0) 
                pos=400*rand(1,2)+400; 

                MESSAGES.Foragers{i}.travelDistance = 0;
                MESSAGES.Foragers{i}.memorySource = 0;
                MESSAGES.Foragers{i}.pos = pos;
        end     
    end

end

