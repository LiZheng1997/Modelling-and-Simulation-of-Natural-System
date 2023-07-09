function unemployee()
% foragers become naive bees
global MESSAGES PARAM ENV_DATA

            pos=400*rand(1,2)+400; 
                if isempty(MESSAGES.NaiveBees)
                    MESSAGES.NaiveBees{1} = naiveBee(PARAM.speed, pos, PARAM.huntRadius, 0, PARAM.memoryContent, 0);
                else
                    MESSAGES.NaiveBees{length(MESSAGES.NaiveBees) + 1} = naiveBee(PARAM.speed, pos, PARAM.huntRadius, 0, PARAM.memoryContent, 0);
                end


end

