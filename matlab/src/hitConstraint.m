function [X, Aout] = hitConstraint(N_nodes, K, X, n1, n2)
%% Based on the paper "Maximizing a Submodular Function over a Matroid"
% This function assumes partition matroids

%% Compare {n1} and X\{n2}
if 1 - X(n1) < K - (sum(X) - X(n2)) 
    delta = 1 - X(n1);
    A = zeros(N_nodes, 1);
    A(n1) = 1;
else
    delta = K - (sum(X) - X(n2));
    A = ones(N_nodes, 1);
    A(n2) = 0;
end

%% Moving mass from n2 to n1
if X(n2) < delta
    X(n1) = X(n1) + X(n2); 
    X(n2) = 0;
    Aout = zeros(N_nodes, 1);
    Aout(n2) = 1;
else
    X(n1) = X(n1) + delta;
    X(n2) = X(n2) - delta;
    Aout = A;
end

end