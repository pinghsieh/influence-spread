%% Network Configuration File
%% Basic
objective_id = 2; % objective function
T_MC = 1000;      % Number of samples for Monte-Carlo
N_groups = 2;
N_nodes = 20;
N_seeds = [1, 1];  % diversity constraint
K = sum(N_seeds);

%% Import Graph
fileID = fopen('../graph/graph20.txt','r');
formatSpec = '%f';
Adj = fscanf(fileID,formatSpec);
Adj = reshape(Adj, [N_nodes, N_nodes]);
N_ites = 9*N_nodes^2;

%% Group
Nodes = cell(N_groups, 1);
Nodes{1} = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
Nodes{2} = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
