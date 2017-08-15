function output = getMarginalIncrease(X_relz, j, Adj, N_nodes, objective_id, T_MC)
    if X_relz(j) == 1
        output = 0;
    else
        X_relz_j = X_relz;
        X_relz_j(j) = 1;
    
        % convert 0/1 vector to indices
        X_relz_seeds = find(X_relz == 1);
        X_relz_j_seeds = find(X_relz_j == 1);
    
        % calculate marginal increase
        [inf_mean, obj_mean, inf_value] = getInfluenceObj(Adj, X_relz_seeds, N_nodes, objective_id, T_MC);
        [inf_mean_j, obj_mean_j, inf_value_j] = getInfluenceObj(Adj, X_relz_j_seeds, N_nodes, objective_id, T_MC);
        output = inf_mean_j - inf_mean;
    end
end