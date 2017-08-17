function [n1, n2] = findFractionPair(X, MAX_TOL)
    n1 = 0;
    n2 = 0;
    for i=1:length(X)
        if ~isIntegerValued(X(i),MAX_TOL)
            n1 = i;
            break
        end
    end
    for j=n1+1:length(X)
        if ~isIntegerValued(X(j),MAX_TOL)
            n2 = j;
            break
        end        
    end
end