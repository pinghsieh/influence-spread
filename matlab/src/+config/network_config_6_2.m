%% Network Configuration File
%% Basic
objective_id = 2; % objective function
T_MC = 100;      % Number of samples for Monte-Carlo
N_groups = 2;
N_nodes = 6;
N_seeds = [1, 1];  % diversity constraint
K = sum(N_seeds);

%% Import Graph
fileID = fopen('../graph/graph6.txt','r');
formatSpec = '%f';
Adj = fscanf(fileID,formatSpec);
Adj = reshape(Adj, [N_nodes, N_nodes]);
N_ites = 9*K^2;

%% Group
Nodes = cell(N_groups, 1);
Nodes{1} = [1, 2, 3];
Nodes{2} = [4, 5, 6];
