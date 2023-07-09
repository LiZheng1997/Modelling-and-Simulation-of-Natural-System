function getAVG()

% avg data
e1 = [2.8, 7.6, 15.2, 20, 27.2, 23.6, 25.2, 37.6, 33, 47.2, 50.8, 48.8, 54];
e2 = [5.6, 17.6, 13.6, 20, 29.6, 39.2, 33.2, 47.6, 43.6, 45.2, 52, 52.8, 48.4];
e = (e1+e2)./2;
x = [5, 10,15,20,25,30,35,40,45,50, 55, 60, 65];
f9=figure(9);

set(f9,'Units','Normalized');
set(f9,'Position',[0.55 0.5 0.45 0.4]);


subplot(3,1,1),plot(x, e1,'b');
subplot(3,1,1),axis([min(x) max(x) 0 100]);

subplot(3,1,2),plot(x, e2,'b');
subplot(3,1,2),axis([min(x) max(x) 0 100]);

subplot(3,1,3),plot(x, e,'b');
subplot(3,1,3),axis([min(x) max(x) 0 100]);

subplot(3,1,1),title('Efficiency of collecting Source1');
ylabel('Efficiency');
xlabel('Proportion of foragers(%)');

subplot(3,1,2),title('Efficiency of collecting Source2');
ylabel('Efficiency');
xlabel('Proportion of foragers(%)');

subplot(3,1,3),title('Average Efficiency');
ylabel('Efficiency');
xlabel('Proportion of foragers(%)');

eval(['save EfficiencySummary_.mat' ]);
end

