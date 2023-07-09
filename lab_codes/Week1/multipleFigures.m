% Vector from 2 with step 2 up to 20
x = 2:2:20;
% Random 10 numbers (0,1)
y = rand(1,10);

% Plot a line connecting all the random numbers
f1 = figure;    %create an empty figure
ax1 = axes(f1); %add axes to the figure
plot(x,y)       %plot x-axis = x and y-axis = y

pause(2);

% Do the same plot but with points
f2 = figure;    %create an empty figure
ax2 = axes(f2); %add axes to the figure
scatter(x,y);   %plot x-axis = x and y-axis = y

pause(2);

%%

% Vector from 1 (with step 1) up to 10
x = 1:10;
% Random 10 numbers (0,1)
y = rand(1,10);

% Plot a line connecting all the random numbers in the first figure
plot(x,y,'parent',ax1)

pause(2);

% Do the same plot but with points in the second figure
scatter(x,y,'parent',ax2); %plot x-axis = x and y-axis = y

pause(2);

%%

% Hold on the first figure and plot 2*y
hold(ax1,'on')
plot(x,2.*y,'parent',ax1);