% N nodes
% Adj: NxN adjacency matrix
clear;
tic;
testbench = 7;

switch testbench 
    case 1
        N = 10;
        K = 2;
        Adj = zeros(N,N);

    case 2
        N = 6;
        K = 1;
        Adj = zeros(N,N);
        Adj(1,:) = [0, 0.5, 0.5, 0.5, 0.5, 0];
        Adj(2,:) = [0, 0, 0, 0, 0, 0];
        Adj(3,:) = [0, 0, 0, 0, 0, 0.5];
        Adj(4,:) = [0, 0, 0, 0, 0, 0];
        Adj(5,:) = [0, 0, 0, 0, 0, 0];
        Adj(6,:) = [0, 0, 0, 0, 0, 0];

    case 3
        N = 10;
        K = 1;
        Adj = zeros(N,N);
        Adj(1,:) = [0, 0.5, 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0];
        Adj(2,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(3,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(4,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(5,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(6,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(7,:) = [0, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8];
        Adj(8,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(9,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Adj(10,:) = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        seedset = cell(2,1);
        inf_cdf = cell(2,1);
        inf_pmf = cell(2,1);
        inf_val = cell(2,1);
        seedset{1} = 7;
        seedset{2} = 1;
        
    case 4
        %% read from a file
        N = 20;
        fileID = fopen('../graph/graph20.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]); 
        seedset = cell(2,1);
        inf_cdf = cell(2,1);
        inf_pmf = cell(2,1);
        inf_val = cell(2,1);
        seedset{1} = [6, 13];
        seedset{2} = [6, 5];
    case 5
        %% read from a file
        N = 30;
        K = 3;
        fileID = fopen('..graph/graph30.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
        seedset = cell(2,1);
        inf_cdf = cell(2,1);
        inf_pmf = cell(2,1);
        inf_val = cell(2,1);
        seedset{1} = [12, 10, 30];
        seedset{2} = [10, 30, 13];
    case 6
        %% read from a file
        N = 50;
        K = 3;
        fileID = fopen('..graph/graph50.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
        seedset = cell(2,1);
        inf_cdf = cell(2,1);
        inf_pmf = cell(2,1);
        inf_val = cell(2,1);
        seedset{1} = [33, 23, 28];
        seedset{2} = [33, 23, 11];
        
    case 7
        %% read from a file
        N = 50;
        K = 5;
        fileID = fopen('../graph/graph50.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]); 
        seedset = cell(2,1);
        inf_cdf = cell(2,1);
        inf_pmf = cell(2,1);
        inf_val = cell(2,1);
        seedset{1} = [33, 23, 11, 25, 49];
        seedset{2} = [33, 23, 25, 36, 11];        
end


T = 10000;
inf_mean = zeros(1,2);
obj_mean = zeros(1,2);

for i=1:2
    [inf_mean(i), obj_mean(i), inf_vec] = getInfluenceObj(Adj, seedset{i}, N, i, T);
    [inf_cdf{i}, inf_val{i}] = ecdf(inf_vec);
    inf_pmf{i} = diff([0; inf_cdf{i}]);
end

createfigure(inf_val{1}, inf_pmf{1}, inf_val{2}, inf_pmf{2}, 'PMF');
createfigure(inf_val{1}, inf_cdf{1}, inf_val{2}, inf_cdf{2}, 'CDF');
toc;
