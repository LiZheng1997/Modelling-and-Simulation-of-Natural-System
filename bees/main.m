
% prop : initial proportion of foragers in bees (%)
% nb : total number of bees
% tot_it: the total number of iterations
function main(prop, nb, tot_it)
tic
% dealing with invalid input
if prop<0||nb<1 || prop > 100
    disp('Error input');
    return;
end

    clear global 
    close all
    global N_IT IT_STATS ENV_DATA MESSAGES  PARAM count Prop Nb Tot_it

    Prop = prop;
    Nb = nb;
    Tot_it = tot_it;
    create_params(tot_it);         %initialize agent parameters
    create_environment(nb);           % initialize environment
   
    [Foragers, NaiveBees] = create_messages(prop, nb); % creat message list
    initialise_results(Foragers, NaiveBees); % initialized result
    N_IT = 1;

    % while loop
    while(ENV_DATA.source1.content > 0 || ENV_DATA.source2.content > 0 || ~isempty(MESSAGES.NaiveBees)) && N_IT <= tot_it
        
        MESSAGES.findForagers = {}; % foragers which find food
        MESSAGES.idxFindForagers = []; % index of foragers which find food

        % the initial number of foragers in current iteration
        noLastITForagers = length(MESSAGES.Foragers);
        
        % if no foraergs left, simulation stops
        if isempty(MESSAGES.Foragers)
            return
        end
        

        % foragers search food( source = 1 if source1 is found, source1 = 2 if source2 is found, source = 0 if no source is found)
        [count1, count2] = search_food(MESSAGES.Foragers);
        
        % delete foragers which abodon to search food
        idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.Foragers,'UniformOutput',true);
        MESSAGES.Foragers =cellfun(@(x)x(:),MESSAGES.Foragers(idx_not_empty),'UniformOutput',false);
        


        %naive bees in hive randomly move
        for i = 1:length(MESSAGES.NaiveBees)
            relocate_n = MESSAGES.NaiveBees{i}.move();
            MESSAGES.NaiveBees{i} = relocate_n;
        end
        
        
        % employed bees move
        if ~isempty(MESSAGES.employee)
            employeeSearch();
            idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.employee,'UniformOutput',true);
            MESSAGES.employee =cellfun(@(x)x(:),MESSAGES.employee(idx_not_empty),'UniformOutput',false);
        end
         
        % if food source is found
        if count1 ~= 0 || count2 ~= 0
           disp('find food');
           
           if ~isempty(MESSAGES.NaiveBees)
               % recruit random proportion of navie bees to follow foragers to collect food
               % only source 2 is found
               if count1==0 && count2 ~= 0
               disp('only2')
               nOfNtoF = ceil((length(MESSAGES.NaiveBees) * rand)/ 10);
                   if nOfNtoF ~= 0
                        temp = randperm(length(MESSAGES.NaiveBees));
                        random_index = temp(1:nOfNtoF);

                        for i = 1:nOfNtoF
                            index = random_index(i);
                            flyToSource(2, index);

                            % employe bees
                            MESSAGES.employee{length(MESSAGES.employee) + 1} = MESSAGES.NaiveBees{index};
                            MESSAGES.NaiveBees{index} = [];
                        end
                        idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.NaiveBees,'UniformOutput',true);
                        MESSAGES.NaiveBees =cellfun(@(x)x(:),MESSAGES.NaiveBees(idx_not_empty),'UniformOutput',false);  
                   end
               end
               
               % only source1 is found
               if count1~=0 && count2 == 0
                   disp('only1')
               nOfNtoF = ceil((length(MESSAGES.NaiveBees) * rand)/ 10);
                   if nOfNtoF ~= 0
                        temp = randperm(length(MESSAGES.NaiveBees));
                        random_index = temp(1:nOfNtoF);

                        for i = 1:nOfNtoF
                            index = random_index(i);
                            flyToSource(1, index);

                            % employe bees
                            MESSAGES.employee{length(MESSAGES.employee) + 1} = MESSAGES.NaiveBees{index};
                            MESSAGES.NaiveBees{index} = [];
                        end
                        idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.NaiveBees,'UniformOutput',true);
                        MESSAGES.NaiveBees =cellfun(@(x)x(:),MESSAGES.NaiveBees(idx_not_empty),'UniformOutput',false);  
                   end
               end
               % find source1 and source2 simultaneously
               if count1~=0 && count2 ~=0
                   disp('find 1 and 2')
                   nOfNtoF = ceil((length(MESSAGES.NaiveBees) * rand)/ 10);
                   if nOfNtoF ~= 0
                        temp = randperm(length(MESSAGES.NaiveBees));
                        random_index = temp(1:nOfNtoF);
                        if nOfNtoF == 1
                            disp('only one source')
                            index = temp(1);
                            % only one bee can be recruited, randomly fly
                            % to one of the sources
                            if rand > 0.5
                                flyToSource(1, index);
                            else
                                flyToSource(2, index);
                            end
                             MESSAGES.employee{length(MESSAGES.employee) + 1} = MESSAGES.NaiveBees{index};
                             MESSAGES.NaiveBees{index} = [];
                        else
                            disp('both 1 and 2')
                            % part of bees fly to source1, another part of
                            % bees fly to another source
                        for i = 1:ceil(nOfNtoF/2)
                            index = random_index(i);
                            flyToSource(1, index);
                            % employe bees
                            MESSAGES.employee{length(MESSAGES.employee) + 1} = MESSAGES.NaiveBees{index};
                            MESSAGES.NaiveBees{index} = [];
                        end
                        for i = ceil(nOfNtoF/2) + 1:nOfNtoF
                            index = random_index(i);
                            flyToSource(2, index);

                            % employe bees
                            MESSAGES.employee{length(MESSAGES.employee) + 1} = MESSAGES.NaiveBees{index};
                            MESSAGES.NaiveBees{index} = [];
                        end
                        end
                        % delete the naive bees
                        idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.NaiveBees,'UniformOutput',true);
                        MESSAGES.NaiveBees =cellfun(@(x)x(:),MESSAGES.NaiveBees(idx_not_empty),'UniformOutput',false);  
                   end
               end
           end

           
            % relocate foragers which find food to hive
            if ~isempty(MESSAGES.findForagers)&&~isempty(MESSAGES.idxFindForagers)
                relocate();
            end
        end
        
        idx_not_empty=cellfun(@(x)~isempty(x),MESSAGES.Foragers,'UniformOutput',true);
        MESSAGES.Foragers =cellfun(@(x)x(:),MESSAGES.Foragers(idx_not_empty),'UniformOutput',false);
        resetForager();
        
       % update result
        IT_STATS.nOfForager(N_IT+1) = length(MESSAGES.Foragers);
        IT_STATS.nOfNaive(N_IT+1) = length(MESSAGES.NaiveBees); 
        IT_STATS.source1Content(N_IT+1) = ENV_DATA.source1.content;
        IT_STATS.source2Content(N_IT+1) = ENV_DATA.source2.content;

        N_IT = N_IT + 1;
        
        
        % if no foragers, simulation stops
        if isempty(MESSAGES.Foragers)
            disp('No foragers Left, simulation stops')
            break
        end
        
        % plot iterative result
        plot_results();
    end
        
% plot final results
plot_FinalResults();
% calculate efficiency
getEfficiency();
eval(['save results_prop_' num2str(prop) '_no_' num2str(nb) '_IT_' num2str(tot_it) '.mat IT_STATS ENV_DATA MESSAGES' ]);
clear global
toc
disp(['运行时间: ',num2str(toc)])
end