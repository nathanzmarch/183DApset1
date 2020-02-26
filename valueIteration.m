function [P] = valueIteration(values, actions, gamma)
    V = values;
    
    while true
        V_new = valueEval(V, actions, gamma);
        if V == V_new
           break; 
        end
        V = V_new;
    end
    
    displayValues(V, 5, 6);
    P = policyBackup(V, actions, gamma);
    return;
end