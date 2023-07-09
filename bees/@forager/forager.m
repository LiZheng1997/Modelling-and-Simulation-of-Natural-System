classdef forager           %declares fox object
    properties         %define fox properties (parameters) 
        pos;
        speed;
        collectRadius;
        memoryContent;
        memorySource;
        travelDistance;
    end
    methods    
        % counstructor
        function f= forager(speed, pos, radius, memorySource, memoryContent, travelDistance) 
                f.speed = speed; % speed
                f.pos = pos;    % current position
                f.collectRadius = radius;  % discover radius
                f.memorySource = memorySource;  % memory of source it find last time
                f.memoryContent = memoryContent;  % last time it finds source(initialized as NaN)
                f.travelDistance = travelDistance; % travel distance
        end
    end
end