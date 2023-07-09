function create_params(tot_it)

% crear agents parameters
global PARAM

    PARAM.speed = 200;         %speed of movement - units per itn (rabbit)
    PARAM.huntRadius = 45;         %speed of movement - units per itn 
    PARAM.memoryContent = nan;     % the number of iteration forager finds source last time
    PARAM.memorySource = 0; % memory of source location last time found  
    PARAM.collectRadius = 45; % collect radius of nave bbes
    PARAM.maxTravelDistance = 2000; % max travel distance
    PARAM.tot_it = tot_it; % the number of total iterations
    PARAM.searchRadius = 200; % radius of area the foragers can search
end

    
    
    