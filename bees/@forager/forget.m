function forget(forager)

global N_IT PARAM
% if days between current iteration and last iteration it find food is
% greater than memory duration
if N_IT - forager.lastMemory > PARAM.memoryDuration
    forager.lastMemory = nan; % assign NaN to last memory parameter
    forager.memorySource = 0; % assign 0 to memory source 
end
    
end

