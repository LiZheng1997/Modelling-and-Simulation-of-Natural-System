function [isCollect, dis] = followToCollect(naiveBee, source)
global ENV_DATA MESSAGES PARAM
%     pos = naiveBee.pos;
%     isCollect = false;
%     dis = -1;
%     % if source1 is found, move to random location around source1
%     if source ==1
%         newX = rand*6 + 2;
%         newY = rand*6 + 42;
%         naiveBee.pos = [newX, newY];
%         MESSAGES.NaiveBees{i} = naiveBee;        
%         dis = sqrt((ENV_DATA.source1.pos(:,1)-newX).^2+(ENV_DATA.source1.pos(:,2)- newY).^2);  %calculate distance to all rabbits
%     
%     % if source2 is found, move to random location around source2
%     elseif source ==2
%         newX2 = rand*6 + 42;
%         newY2 = rand*6 + 2;
%         naiveBee.pos = [newX2, newY2];
%         MESSAGES.NaiveBees{i} = naiveBee;
%         dis = sqrt((ENV_DATA.source2.pos(:,1)-newX2).^2+(ENV_DATA.source2.pos(:,2)- newY2).^2);  %calculate distance to all rabbits
%     end
%     
%     % distance is smaller than collect radius, then successfully collect
%     if dis <= PARAM.collectRadius && dis >= 0
%         isCollect = true;
%     else 
%         isCollect = false;
%     end
    if source == 1
        

end

