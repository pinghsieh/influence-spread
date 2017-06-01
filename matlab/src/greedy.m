function [new_seedset, infvalue, objvalue] = greedy(seedset, N, Adj, obj_id, T)
%% Diffusion process
% input: N, current seed set, 

infvalue = 0;
objvalue = -1e+10;
new_seedset = seedset;

for i=1:N
    if ~ismember(i,seedset)
        temp_seedset = [seedset, i];
        [inf_temp, obj_temp] = getInfluenceObj(Adj, temp_seedset, N, obj_id, T);
        if (objvalue < obj_temp)
            objvalue = obj_temp;
            infvalue = inf_temp;
            new_seedset = temp_seedset;
        end
    end
end


end