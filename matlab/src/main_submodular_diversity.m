%% Submodular Maximization Under Matroid Constraints

%% Phase 1: Find a good fractional solution
% Partition Matroid
% TODO: change to loading configuration later
config.network_config_20_2;

% Multilinear Extension
X = zeros(N_nodes,1);
X_relz = zeros(N_nodes, 1);
N_sample = 10*N_ite^2*ceil(1+log(N_nodes));
Seeds = cell(N_groups, 1);

%% Main For loop
for i=1:N_ites 
weight = zeros(N_nodes, 1);

% Finding an estimate (weight) of "Gradient" for each element
for j=1:N_nodes
    for k=1:N_samples
        X_relz = (rand(N_nodes,1) < X);
        X_relz_seeds = find(X_relz == 1); % convert 0/1 vector to indices
        weight(j) = weight(j) + getMarginalIncrease(X_relz, j, Adj, N_nodes, objective_id, T_MC);
    end
    weight(j) = weight(j)/N_sample;
end

% Find maximum weight independent set
for m=1:N_groups
    [val, ids] = sort(weight(Nodes{m}), 'descend');
    Seeds{m} = Nodes{m}(ids(1:N_seeds(m),1));
    X(Seeds{m}) = X(Seeds{m}) + 1; 
end

end

X = X/N_ites;

%% Phase 2: Pipage Rounding

