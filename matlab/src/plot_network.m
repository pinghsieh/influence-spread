%% plot graph based on adjacency matrix
testbench = 6;

switch testbench
    case 3
        N = 10;
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
        G = digraph(Adj);
        Adj_tr = transpose(Adj);
        Weight = Adj_tr(transpose(Adj~=0));
        plot(G,'EdgeLabel',Weight, 'Layout','force');
        
    case 6
        N = 50;
        fileID = fopen('graph50.txt','r');
        formatSpec = '%f';
        Adj = fscanf(fileID,formatSpec);
        Adj = reshape(Adj, [N, N]);
        %Adj = (Adj > 0);
        G = digraph(Adj);
        Adj_tr = transpose(Adj);
        Weight = Adj_tr(transpose(Adj~=0));
        plot(G,'Layout','force')
        %plot(G,'EdgeLabel',Weight);
        %plot(G,'EdgeLabel',Weight, 'Layout','force');

end
