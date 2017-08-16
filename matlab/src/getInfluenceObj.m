function [inf_mean, obj_mean, inf_value] = getInfluenceObj(Adj, seedset, N, obj_id, T)

%T = 1000; % number of runs
inf_value = zeros(1,T);
influence_obj = zeros(1,T);

for t=1:T
    node_state = zeros(1,N);
    node_state(seedset) = ones(1,length(seedset));
    rand_matrix = rand(N);
    edge_state = Adj > rand_matrix; 
    new_member = seedset;
    while (~isempty(new_member))
        novice = [];
        temp_node_state = node_state;
        for i=1:length(new_member)
            temp_node_state = ((temp_node_state + edge_state(new_member(i),:)) > 0); 
            novice = union(novice,find((edge_state(new_member(i),:)-node_state)>0));
        end  
        new_member = novice;
        node_state = temp_node_state;
    end
    inf_value(t) = sum(node_state);
    influence_obj(t) = obj_func(inf_value(t), obj_id);
    if mod(t,100) == 0
        %sprintf('iteration: %d\n',t)
    end
end

inf_mean = mean(inf_value);
obj_mean = mean(influence_obj);
end