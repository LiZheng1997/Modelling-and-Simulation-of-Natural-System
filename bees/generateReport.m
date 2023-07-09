function generateReport()
global 
% generate report


e1 = [a10.IT_STATS.e1, a15.IT_STATS.e1, a20.IT_STATS.e1, a25.IT_STATS.e1, a30.IT_STATS.e1, a35.IT_STATS.e1, a40.IT_STATS.e1, a45.IT_STATS.e1, a50.IT_STATS.e1, a55.IT_STATS.e1, a60.IT_STATS.e1];
e2 = [a10.IT_STATS.e2, a15.IT_STATS.e2, a20.IT_STATS.e2, a25.IT_STATS.e2, a30.IT_STATS.e2, a35.IT_STATS.e2, a40.IT_STATS.e2, a45.IT_STATS.e2, a50.IT_STATS.e2, a55.IT_STATS.e2, a60.IT_STATS.e2];
e1 = e1.*100;
e2 = e2.*100;
x = [10,15,20,25,30,35,40,45,50, 55, 60];
f9=figure(9);

set(f9,'Units','Normalized');
set(f9,'Position',[0.55 0.5 0.45 0.4]);


subplot(2,1,1),plot(x, e1,'r');
subplot(2,1,1),axis([min(x) max(x) 0 100]);

subplot(2,1,2),plot(x, e2,'b');
subplot(2,1,2),axis([min(x) max(x) 0 100]);

subplot(2,1,1),title('Efficiency of collecting Source1');
ylabel('Efficiency');
xlabel('Proportion of foragers(%)');

subplot(2,1,2),title('Efficiency of collecting Source2');
ylabel('Efficiency');
xlabel('Proportion of foragers(%)');

eval(['save EfficiencySummary_.mat' ]);
end

