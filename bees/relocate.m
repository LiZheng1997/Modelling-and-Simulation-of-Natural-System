function Foragers = relocate()
global ENV_DATA MESSAGES PARAM
% relocate foragers which find food in hive

    loc=400*rand(length(MESSAGES.findForagers),2)+400; 
    for i = 1:length(MESSAGES.findForagers)
        idx = MESSAGES.idxFindForagers(i);
        memorySource = MESSAGES.findForagers{i}.memorySource;
        memoryContent = MESSAGES.findForagers{i}.memoryContent;
        newForager = forager(PARAM.speed, loc(i,:), PARAM.huntRadius, memorySource, memoryContent, 0);
        MESSAGES.Foragers{idx} = newForager;
   
    end

end