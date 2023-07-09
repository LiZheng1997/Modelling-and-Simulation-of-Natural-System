function [NaiveBees, Foragers]=create_agents(prop, nb)
  % creat agents
global ENV_DATA MESSAGES PARAM 
 
hiveSize=ENV_DATA.hiveSize;

% generate location
loc=400*rand(nb,2)+400;   

% initialize the number of foragers
numberOfForager = fix(nb* prop * 0.01);
Foragers = cell(1, numberOfForager);

% initialize the number of naive bees
numberOfNaive = nb - numberOfForager;

NaiveBees = cell(1, numberOfNaive);
% creat naive bees agents
for n=1:numberOfNaive
    pos=loc(n,:);
    NaiveBees{n}=naiveBee(PARAM.speed,pos, PARAM.huntRadius, 0,PARAM.memoryContent, 0);
end

% creat foragers agents
for n = numberOfNaive + 1: numberOfNaive + numberOfForager
    pos=loc(n - numberOfNaive,:);
    Foragers{n - numberOfNaive}=forager(PARAM.speed, pos, PARAM.huntRadius, 0, PARAM.memoryContent, 0);
    
end
