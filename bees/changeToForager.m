function changeToForager(naiveBee, source)

% if naive bee successfully finds food source, it becomes to forager

global PARAM IT_STATS N_IT MESSAGES ENV_DATA

loc = 400*rand(1,2)+400; 
% generate new forager with memory of food source location and food content
if source == 1
    newForager = forager(naiveBee.speed, loc, PARAM.huntRadius, source, ENV_DATA.source1.content, 0);
elseif source == 2
    newForager = forager(naiveBee.speed, loc, PARAM.huntRadius, source, ENV_DATA.source2.content, 0);
end
MESSAGES.Foragers{length(MESSAGES.Foragers)+1} = newForager; 

end