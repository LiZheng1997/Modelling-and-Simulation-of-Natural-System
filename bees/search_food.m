function [count1,count2] = search_food(Foragers)
% foragers find food
global MESSAGES N_IT IT_STATS  PARAM ENV_DATA
global count; % the total number of food which is found in current iteration

count1 = 0; % the total number of food in source1 which is found in current iteration
count2 = 0; % the total number of food in source2 which is found in current iteration

% shuffle Foragers cell arrays
r_idx = randperm(numel(Foragers));
MESSAGES.Foragers = Foragers(r_idx);

% forager seraches food
for i = 1:length(Foragers)
    forager = MESSAGES.Foragers{i};
    % calculate the probability the bees do NOT abandon the source
    propInsist = forager.memoryContent * 0.57 - 0.425;
    
    % if forager doesn't abandon to search food
    if isnan(forager.memoryContent) ||  propInsist >= 0.5
        % foragers which have memory directly fly to known source
        if MESSAGES.Foragers{i}.memorySource ~= 0
            directlyFlyToSource(forager.memorySource, i);
        end
            
        
        [found,source] = forager.eat();

        if found == 1 && source ==1 % if source1 is found
            count1 = count1 + 1;
            if forager.memorySource == 1 % if forager has memory in source1

                forager.remember(1); % update memory
                MESSAGES.findForagers{length(MESSAGES.findForagers) + 1} = forager;
                MESSAGES.idxFindForagers(length(MESSAGES.idxFindForagers) + 1) = i;
                MESSAGES.Foragers{i} = forager; % add on 3.7
            end
            % if no memory
            forager.remember(1); % update memory
            MESSAGES.findForagers{length(MESSAGES.findForagers) + 1} = forager;
            MESSAGES.idxFindForagers(length(MESSAGES.idxFindForagers) + 1) = i;
            MESSAGES.Foragers{i} = forager;  
            
        end
        if found ==1 && source ==2 % if source2 is found
            count2 = count2 + 1;
            if forager.memorySource == 2 % if forager has memory in source2
                forager.remember(2); % update memory
                MESSAGES.findForagers{length(MESSAGES.findForagers) + 1} = forager;
                MESSAGES.idxFindForagers(length(MESSAGES.idxFindForagers) + 1) = i;
                MESSAGES.Foragers{i} = forager;
            end
            % if no memory 
            forager.remember(2); % update memory
            MESSAGES.findForagers{length(MESSAGES.findForagers) + 1} = forager;
            MESSAGES.idxFindForagers(length(MESSAGES.idxFindForagers) + 1) = i;
            MESSAGES.Foragers{i} = forager;
           
        end
        if found == 0
            MESSAGES.Foragers{i}.move(i); % forager is unable to find source, then randomly move
            MESSAGES.Foragers{i}.memoryContent = MESSAGES.Foragers{i}.memoryContent*0.9;
        end
    else
        % if forager abandons to search food, set as empty, it becomes
        % naive bee
        MESSAGES.Foragers{i} = [];
        unemployee();
    end
end

% control the food content
if ENV_DATA.source1.content < ENV_DATA.maxContent
    ENV_DATA.source1.content = ENV_DATA.source1.content + ENV_DATA.sourceIncrease;
end

if ENV_DATA.source2.content < ENV_DATA.maxContent
    ENV_DATA.source2.content = ENV_DATA.source2.content + ENV_DATA.sourceIncrease;
end

end