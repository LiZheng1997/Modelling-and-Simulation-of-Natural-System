function getEfficiency()

% calculate the efficiency
global MESSAGES PARAM IT_STATS
% efficiency of searching source1
e1 = sum(IT_STATS.findS1)/ PARAM.tot_it;
str1 = ['Efficiency of searching Source1:'  num2str(e1*100) '%'];
disp(str1);

% efficiency of searching source2
e2 = sum(IT_STATS.findS2)/ PARAM.tot_it;
str2 = ['Efficiency of searching Source2:'  num2str(e2*100) '%'];
disp(str2);

IT_STATS.e1 = e1;
IT_STATS.e2 = e2;
end


