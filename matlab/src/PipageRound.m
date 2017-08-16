function X = PipageRound(N_nodes, K, X)
    MAX_TOL = 1e-9;
    while ~isIntegerValued(X, MAX_TOL)
        T = ones(N_nodes, 1);
        while ~isIntegerValued(T.*X, MAX_TOL)
            [n1, n2] = findFractionPair(T.*X, MAX_TOL);
            [X_n1, Aout_n1] = hitConstraint(N_nodes, K, X, n1, n2);
            [X_n2, Aout_n2] = hitConstraint(N_nodes, K, X, n2, n1);    
            if norm(X_n1 - X_n2, 1) < MAX_TOL
                T = T.*Aout_n1;
            else
                p = norm(X_n1 - X, 1)/norm(X_n1 - X_n2, 1);
                if rand(1) < p
                    X = X_n2;
                    T = T.*Aout_n2;
                else
                    X = X_n1;
                    T = T.*Aout_n1;                    
                end
            end
        end
    end
end