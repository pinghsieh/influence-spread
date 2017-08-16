function output = isIntegerValued(X, MAX_TOL)
%% Need to check overflow as well
    output = 1;
    if (norm(X - floor(X), 1) > MAX_TOL) && (norm(ceil(X) - X, 1) > MAX_TOL)
        output = 0;
    end

end