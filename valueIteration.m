function [P] = valueIteration(values, actions, gamma)
    V = values;
    
    while true
        V_new = valueEval(V, actions, gamma);
        if V == V_new
           break; 
        end
        V = V_new;
    end
    
    P = policyBackup(V, actions, gamma);
    return;
end