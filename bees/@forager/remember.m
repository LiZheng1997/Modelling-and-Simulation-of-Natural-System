function remember(forager, source)
 % set memory parameter
% if forager find food, update properties
global N_IT ENV_DATA
if source == 1
    
forager.memoryContent = ENV_DATA.source1.content;
else
    forager.memoryContent = ENV_DATA.source2.content;
end
forager.memorySource = source;
end

