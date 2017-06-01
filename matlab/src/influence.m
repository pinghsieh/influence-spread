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

    case 4
        %% read from a file
        N = 20;
        K = 2;
        fileID = fopen('../graph/graph20.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
        
    case 5
        %% read from a file
        N = 30;
        K = 3;
        fileID = fopen('../graph/graph30.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
    case 6
        %% read from a file
        N = 50;
        K = 3;
        fileID = fopen('../graph/graph50.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
        
    case 7
        %% read from a file
        N = 50;
        K = 5;
        fileID = fopen('../graph/graph50.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);        
end

T = 1000;
seedset = [];
obj_id = 2;

for t=1:K
    [seedset, infvalue, objvalue] = greedy(seedset, N, Adj, obj_id, T);
    sprintf('seed # = %d\n',t);
end

toc;