%% Network Configuration File
%% Basic
objective_id = 2; % objective function, also see "obj_func.m"
T_MC = 100;      % Number of samples for Monte-Carlo
N_groups = 1;
N_nodes = 4;
N_seeds = [1];  % diversity constraint
K = sum(N_seeds); % total number of seeds

%% Import Graph
fileID = fopen('../graph/graph4.txt','r');
formatSpec = '%f';
Adj = fscanf(fileID,formatSpec);
Adj = reshape(Adj, [N_nodes, N_nodes]);
N_ites = 9*K^2;

%% Parameters for the Algorithm
N_samples = 10*N_ites^2*ceil(1+log(N_nodes));
%N_samples = 100; % for faster debugging

%% Group
Nodes = cell(N_groups, 1);
Nodes{1} = [1, 2, 3, 4];
