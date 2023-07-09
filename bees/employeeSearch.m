function success = employeeSearch()
% employed naive bees search food
global MESSAGES N_IT IT_STATS isMemory totalMemory PARAM ENV_DATA
global count; % the total number of food which is found in current iteration
for i = 1:length(MESSAGES.employee)
    source = MESSAGES.employee{i}.memorySource;
    
    if source == 1
        success=MESSAGES.employee{i}.eat(1);
    elseif source ==2
        success=MESSAGES.employee{i}.eat(2);
    end
    
    if success == true
        if source == 1
             MESSAGES.employee{i}.memoryContent = ENV_DATA.source1.content;
            if ENV_DATA.source1.content > 0
                ENV_DATA.source1.content = ENV_DATA.source1.content - ENV_DATA.sourceDecrease; 
            end
        end
        
        if source == 2
            MESSAGES.employee{i}.memoryContent = ENV_DATA.source2.content;
            if ENV_DATA.source2.content > 0
                ENV_DATA.source2.content = ENV_DATA.source2.content - ENV_DATA.sourceDecrease;
            end
        end
        % successfully find source, change to forager
        MESSAGES.employee{i}.changeToForager(source);
        MESSAGES.employee{i} = [];
    else
        naiveBee = MESSAGES.employee{i}.moveAroundSource(source);
        % if total travel distance > max travel distance, fly back to hive
        if naiveBee.travelDistance > PARAM.maxTravelDistance
            MESSAGES.employee{i}.changeToForager(source);
            MESSAGES.employee{i} = [];
        else
            MESSAGES.employee{i} = naiveBee;
        end
    end

    
end

end