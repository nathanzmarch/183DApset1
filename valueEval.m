function [V] = valueEval(values, actions, gamma)
    Ns = length(values);
    Na = length(actions);
    
    V = values;
    delta = 1;
    endCond = 0.0001;
    
    while delta > endCond
        delta = 0;
        V_new = zeros(1, Ns);
       
        for s = 1:Ns
            bestValue = intmin;
           
            for a = 1:Na
                value = 0;
                for a2 = 1:Na
                    sp = s + actions(a2);
                    if isInBounds(sp) == 1 && isObstacle(sp) == 0 && isValidMove(s, actions(a2)) == 1
                        temp = sasprob(s, actions(a), sp) * (reward(sp) + gamma * V(sp));
                        value = value + temp;
                    end
                end
                
                if value > bestValue
                   bestValue = value;
                end
            end
           
            V_new(s) = bestValue;
            if delta < abs(V_new(s) - V(s))
                delta = abs(V_new(s) - V(s));
            end
       end
       
       V = V_new;
    end
    return
end