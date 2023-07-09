function [Foragers, NaiveBees] = create_messages(prop, nb)
 % creat message list
global MESSAGES PARAM
MESSAGES=struct('isFound',[],'efficiency',[], 'foundSource',[], 'idxFindForagers', [], 'naiveFound', []);
[NaiveBees, Foragers]=create_agents(prop, nb);
MESSAGES.isFound(1) = 0; % whether food source is found
MESSAGES.Foragers = Foragers; % cell array of forgaers
MESSAGES.NaiveBees = NaiveBees; % cell array of naive bees

MESSAGES.findForagers = {}; % forgers which find food
MESSAGES.employee = {}; % naive bees which are employed to collect food

end

