function create_environment(nb)

% creat environment parameters

global ENV_DATA

ENV_DATA.shape='square'; % shape
ENV_DATA.units='meters'; % units of length
ENV_DATA.bm_size=1200;    % size of environment
ENV_DATA.hiveSize = 400; % hive size
ENV_DATA.source1 = struct('pos',[600, 1000], 'content', 1); % food source1
ENV_DATA.source2 = struct('pos', [600, 200], 'content', 1); % food source2
ENV_DATA.totalBees = nb; % initial number of bees 
ENV_DATA.sourceIncrease = 0.03; % change in source content in each iteration
ENV_DATA.sourceDecrease = 0.025; % change in source content in each iteration
ENV_DATA.minNorthZone = 600;
ENV_DATA.maxNorthZone = 1200;
ENV_DATA.minSouthZone = 0;
ENV_DATA.maxSouthZone = 600;
ENV_DATA.leftSource = 400;
ENV_DATA.rightSource = 800;
ENV_DATA.minEdgeSource1 = 800;
ENV_DATA.maxEdgeSource2 = 400;
ENV_DATA.approxZoneRadius = 200;
ENV_DATA.minFlyZoneX = 100;
ENV_DATA.maxFlyZoneX = 1100;
ENV_DATA.maxFlyZoneY = 1100;
ENV_DATA.minFlyZoneY = 100;
ENV_DATA.maxContent = 2; % maximum content
ENV_DATA.minContent = 0.75; % minimum content
end

