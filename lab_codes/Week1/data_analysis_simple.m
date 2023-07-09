% Load exam grades
% Let's say that each row is a student and each column a module.
load('examgrades.mat');

% What is the average score per module?
average_per_module = mean(grades);
%Or "mean(grades,1);", 1 specifies that we want the mean over the columns. 
%For mean over the rows we would have "mean(grades,2);"

standard_deviation_per_module = std(grades);
%Or "std(grades,[],1);", 1 specifies that we want the mean over the columns. 
%For mean over the rows we would have "std(grades,[],2);"

standard_error_mean = standard_deviation_per_module ./ sqrt(size(grades,1));
%[nrows,ncols] = size(x) returns the dimensions of x; size(x,1) returns
%only the number of rows. n=length(x) returns the largest dimension

f = figure;
hold on
plot(1:length(average_per_module) , average_per_module , 'bo');
plot(1:length(average_per_module) , average_per_module+standard_error_mean , 'r--');
plot(1:length(average_per_module) , average_per_module-standard_error_mean , 'r--');
ylim([50,100]);
xlabel('modules');
ylabel('average grade per module');
legend({'average','standard error (upper)','standard error (lower)'});