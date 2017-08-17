%% Submodular Maximization Under Matroid Constraints
clear;
tic;
%% Phase 1: Find a good fractional solution
% Partition Matroid
% TODO: parameters are loaded from configuration files
config.network_config_4_1;

% Multilinear Extension
X = zeros(N_nodes,1);
X_relz = zeros(N_nodes, 1);
Seeds_temp = cell(N_groups, 1);
M_DEBUG_MSG = 500; % frequency of debug messages

%% Main For loop
for i=1:N_ites 
weight = zeros(N_nodes, 1);

% Finding an estimate (weight) of "Gradient" for each element
for j=1:N_nodes
    for k=1:N_samples
        X_relz = (rand(N_nodes,1) < X);
        X_relz_seeds = find(X_relz == 1); % convert 0/1 vector to indices
        weight(j) = weight(j) + getMarginalIncrease(X_relz, j, Adj, N_nodes, objective_id, T_MC);
        if mod(k,M_DEBUG_MSG) == 1
            fprintf('Sample iteration: %d\n',k);
            toc;
        end
    end
    weight(j) = weight(j)/N_samples;
end

% Find maximum weight independent set
for m=1:N_groups
    [val, ids] = sort(weight(Nodes{m}), 'descend');
    Seeds_temp{m} = Nodes{m}(ids(1:N_seeds(m),1));
    X(Seeds_temp{m}) = X(Seeds_temp{m}) + 1/N_ites; 
end

end


%% Phase 2: Pipage Rounding
threshold_X = 0.99; % for rounding purpose
X = PipageRound(N_nodes, K, X);
Seeds_final = find(X > threshold_X);


%% Evaluate seed set
[inf_mean, obj_mean, inf_val] = getInfluenceObj(Adj, Seeds_final, N_nodes, objective_id , T_MC);
toc;
