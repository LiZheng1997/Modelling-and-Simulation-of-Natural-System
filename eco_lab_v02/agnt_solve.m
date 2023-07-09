function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent population.
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update

%Created by Dawn Walker 3/4/08 

n=length(agent);    %current no. of agents 当前agent数
n_new=0;    %no. new agents 新的agent数
prev_n=n;   %remember current agent number at the start of this iteration

%execute existing agent update loop
for cn=1:n
	curr=agent{cn}; %取出一个agent
    if isa(curr,'rabbit')|isa(curr,'fox')   %如果是兔子或狐狸
        %根据类型调用对应的eat方法
        %模拟兔子狐狸的捕食行为
        %*******注意：
        %先在当前位置找，对于兔子找到eaten=1，不用移动。对于狐狸，找到就移动到被吃兔子的位置。相反eaten=0，移动觅食。
        [curr,eaten]=eat(curr,cn);               %eating rules (rabbits eat food, foxes eat rabbits) 
        %如果狐狸或兔子都没有找到食物，移动到其他地方猎食
        if eaten==0
            curr=migrate(curr,cn);              %if no food was eaten, then migrate in search of some
        end
        [curr,klld]=die(curr,cn);                %death rule (from starvation or old age)
        %如果该对象没有死亡，就繁殖
        if klld==0
            new=[];
            [curr,new]=breed(curr,cn);			%breeding rule
            if ~isempty(new)					%if current agent has bred during this iteration
                 n_new=n_new+1;                 %increase new agent number
                 agent{n+n_new}=new;			%add new to end of agent list
             end
        end 
        %agent是当前循环后，包括活的、死的所有agent
       agent{cn}=curr;                          %up date cell array with modified agent data structure
    end
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
%就是现在agent的数量（包括活的死的）
%nnn = length(agent)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

