classdef naiveBee   %declares rabbit object
    properties    %define rabbit properties (parameters) 
        pos;
        speed;
        collectRadius;
        memorySource;
        travelDistance;
        memoryContent;
    end
    methods                        
        function b = naiveBee(speed, pos, collectRadius, memorySource, memoryContent,travelDistance) %constructor method for rabbit - assigns values to rabbit properties

                b.speed = speed;
                b.pos = pos;
                b.collectRadius = collectRadius;
                b.memorySource = memorySource;
                b.travelDistance = travelDistance;
                b.memoryContent = memoryContent;
        end
    end
end
