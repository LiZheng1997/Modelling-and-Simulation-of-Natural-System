function plot_results()
    global ENV_DATA MESSAGES N_IT PARAM IT_STATS



    f1=figure(1);

    set(f1,'Units','Normalized');
    set(f1,'Position',[0.55 0.5 0.45 0.4]);

    subplot(2,1,1),cla
    subplot(2,1,1),plot(IT_STATS.source1Content,'r');
    hold on
    subplot(2,1,1),plot(IT_STATS.source2Content,'b');
    subplot(2,1,1),axis([1 PARAM.tot_it 0 2.5]);

    subplot(2,1,2),cla
    subplot(2,1,2),plot(IT_STATS.nOfForager,'b');
    hold on
    subplot(2,1,2),plot(IT_STATS.nOfNaive,'r');
    subplot(2,1,2),axis([1 PARAM.tot_it 0 ENV_DATA.totalBees]);


    
    subplot(2,1,1),title('Change in surcose concentration'),legend('Source 1', 'Source 2');
    ylabel('No.Food content');
    xlabel('No.Iterations');

    subplot(2,1,2),title('Change in No.Bees'),legend('Forager', 'Naive Bee');
    ylabel('No.Foragers');
    xlabel('No.Iterations'); 

    drawnow

    f2 = figure(2);
    bm=ENV_DATA.bm_size;

    clf                             %clear previous plot
    set(f2,'Units','Normalized');
    set(f2,'Position',[0.0 0.4 0.5 0.5]);

    v=(1:bm);
    [X,Y]=meshgrid(v);
    H=zeros(bm,bm);

    hs=surf(Y,X,H);              
    cm=colormap('gray');
    icm=flipud(cm);
    colormap(icm);
    set(hs,'SpecularExponent',1);       %sets up lighting
    set(hs,'SpecularStrength',0.1);
    hold on

    % plot foragers
    for cn=1:length(MESSAGES.Foragers)                          %cycle through each agent in turn
        pos = MESSAGES.Foragers{cn}.pos;
        ro = plot(pos(1), pos(2), 'c+');
    end
    

    % plot naive bees
    if ~isempty(MESSAGES.NaiveBees)
        for cn=1:length(MESSAGES.NaiveBees)                          %cycle through each agent in turn
            pos = MESSAGES.NaiveBees{cn}.pos;
            bo = plot(pos(1), pos(2), 'b+');
        end     
    end
    
    % plot recruit bees
    if ~isempty(MESSAGES.employee)
        for cn = 1:length(MESSAGES.employee)
            pos = MESSAGES.employee{cn}.pos;
            yo = plot(pos(1), pos(2), 'yo');
        end
    end
    
    
    
    % plot hive
    rectangle('Position',[ENV_DATA.hiveSize ENV_DATA.hiveSize ENV_DATA.hiveSize ENV_DATA.hiveSize]);
    text(ENV_DATA.hiveSize, ENV_DATA.hiveSize,'HIVE', 'Color','w');
    
    % plot source1 and foragers reachable zone, recruit bees reachable
    % zone
    hr = plot(ENV_DATA.source1.pos(1), ENV_DATA.source1.pos(2), 'y.', 'MarkerSize', 15);
   
    
    text(ENV_DATA.source1.pos(1), ENV_DATA.source1.pos(2),'Source1');
    
    rectangle('Position',[ENV_DATA.source1.pos(:,1)-ENV_DATA.approxZoneRadius,ENV_DATA.source1.pos(:,2)-ENV_DATA.approxZoneRadius,2.*ENV_DATA.approxZoneRadius,2.*ENV_DATA.approxZoneRadius],'Curvature',[1,1],'linewidth',1, 'EdgeColor', 'blue');axis equal;
    % plot source2 and foragers reachable zone, recruit bees reachable
    % zone
    plot(ENV_DATA.source2.pos(1), ENV_DATA.source2.pos(2), 'y.', 'MarkerSize', 15);

    text(ENV_DATA.source2.pos(1)+5, ENV_DATA.source2.pos(2),'Source2');
      
    rectangle('Position',[ENV_DATA.source2.pos(:,1)- ENV_DATA.approxZoneRadius,ENV_DATA.source2.pos(:,2)-ENV_DATA.approxZoneRadius,2.*ENV_DATA.approxZoneRadius,2.*ENV_DATA.approxZoneRadius],'Curvature',[1,1],'linewidth',1, 'EdgeColor', 'blue'),axis equal;
    try
    legend([bo, ro],  'Naive bees', 'Foragers');
    catch ErrorInfo
        legend(ro,'forager');
    end
    
    h=findobj(gcf,'type','surface');
    set(h,'edgecolor','none');
    lighting flat
    h=findobj(gcf,'type','surface');
    set(h,'linewidth',0.1)
    set(h,'specularstrength',0.2)
    axis off
    axis equal
    set(gcf,'color',[1 1 1]);
    title({['Iteration no.= ' num2str(N_IT-1) '.  No. Foragers = ' num2str(length(MESSAGES.Foragers))  '.  No. NaiveBees = ' num2str(length(MESSAGES.NaiveBees) + length(MESSAGES.employee))];
        ['Source1 sucrose concentration = ' num2str(ENV_DATA.source1.content)];
        ['Source2 sucrose concentration = ' num2str(ENV_DATA.source2.content)]});
    
    axis off
    
    
    drawnow
end
