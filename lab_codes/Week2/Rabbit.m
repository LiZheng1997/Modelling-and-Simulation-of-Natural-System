classdef Rabbit
    properties 
        eating = 0;
        moving = 0;
        alive = 1;
        days_alive = 0;
        food = '';
    end
    
    methods
        % Constructor
        function inst = Rabbit(eat,move,alive,dalive)
            inst.eating = eat;
            inst.moving = move;
            inst.alive = alive;
            inst.days_alive = dalive;
        end
        
        function animal = setFood(animal,f)
            animal.food = f;
        end
    end
end

% Try in command window:
% rabbit1 = Rabbit(0,1,1,40)
% rabbit1 = rabbit1.setFood('carrot')