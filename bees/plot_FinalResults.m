function plot_FinalResults()
global ENV_DATA MESSAGES N_IT PARAM IT_STATS
        
        % if source is found, set the value to 1. Otherwise, it is set to 0.
        f3=figure(3);

        set(f3,'Units','Normalized');
        set(f3,'Position',[0.55 0.05 0.45 0.4]);
        
        % plot source1
        subplot(2,1,1),cla
        subplot(2,1,1),plot(IT_STATS.findS1,'b');
        hold on
        subplot(2,1,1),axis([1 inf 0 2]);
            
        % plot source2
        subplot(2,1,2),cla   
        subplot(2,1,2),plot(IT_STATS.findS2,'b');
        hold on
        subplot(2,1,2),axis([1 inf 0 2]);

        subplot(2,1,1),title('Source1 found');
        ylabel('Found');
        xlabel('No. Iterations');
        
        subplot(2,1,2),title('Source2 found'); 
        ylabel('Found');
        xlabel('No. Iterations');

        drawnow

end
