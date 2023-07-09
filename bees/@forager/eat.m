function [found, source] = eat(forager)


global  IT_STATS N_IT MESSAGES ENV_DATA PARAM

pos=forager.pos;    % current position of forager                        
spd=forager.speed;      % speed of forager  
radius = forager.collectRadius; % disocver radius of forager


% calculate distance between the current location and source1, source2
dis1=sqrt((ENV_DATA.source1.pos(:,1)-pos(:,1)).^2+(ENV_DATA.source1.pos(:,2)-pos(:,2)).^2); 
dis2=sqrt((ENV_DATA.source2.pos(:,1)-pos(:,1)).^2+(ENV_DATA.source2.pos(:,2)-pos(:,2)).^2);

% minimum of distance1 and distance2
min_dis = min(dis1, dis2);


%if min_dis is smalller than discover radius
if min_dis < radius
    % dis1 and dis2 both equal min_dis
    if min_dis == dis1 && min_dis == dis2
        % randomly choose source (using Gaussian distribution)
        r = randn;
        
        if r > 0 && ENV_DATA.source1.content > 0.75 % choose Source1
            dis = dis1;
            source = 1;
            ENV_DATA.source1.content = ENV_DATA.source1.content - ENV_DATA.sourceDecrease;

            found = 1;
            IT_STATS.findS1(N_IT+1) = 1;
        elseif r <= 0 && ENV_DATA.source2.content > 0.75 % choose Source2
            dis = dis2;
            source = 2;

            ENV_DATA.source2.content = ENV_DATA.source2.content - ENV_DATA.sourceDecrease;
            found = 1;
            IT_STATS.findS2(N_IT+1) = 1;
        end
    elseif min_dis == dis1 && ENV_DATA.source1.content > 0.75 % if min_dis equals dis1
        dis = dis1;
        source = 1;
        ENV_DATA.source1.content = ENV_DATA.source1.content - ENV_DATA.sourceDecrease;

        found = 1;
        IT_STATS.findS1(N_IT+1) = 1;
    elseif min_dis == dis2 && ENV_DATA.source2.content > 0.75 % if min_fis equals dis2
        dis = dis2;
        source = 2;
        IT_STATS.findS2(N_IT+1) = 1;

        ENV_DATA.source2.content = ENV_DATA.source2.content - ENV_DATA.sourceDecrease; 
        found = 1;
    else
        source = 0;
        found = 0;
    end
else % no source found
    source = 0;
    found = 0;
end

end



   
