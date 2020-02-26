function [V] = policyEval(policy, actions, gamma)
    Ns = length(policy(1,:));
    Na = length(actions);
    
    V = zeros(1, Ns);
    delta = 1;
    endCond = 0.0000000001;
    
    while delta > endCond
        delta = 0;
        V_new = zeros(1, Ns);
       
        for s = 1:Ns
            actionProbs = policy(:, s);
            
            % For each action, check all 4 possible outcomes
            for a = 1:Na
                for a2 = 1:Na
                    sp = s + actions(a2);
                    if isInBounds(sp) == 1 && isObstacle(sp) == 0 && isValidMove(s, actions(a2)) == 1
                        temp = sasprob(s, actions(a), sp) * (reward(sp) + gamma * V(sp));
                        V_new(s) = V_new(s) + actionProbs(a) * temp;
                    end
                end
            end
            if delta < abs(V_new(s) - V(s))
                delta = abs(V_new(s) - V(s));
            end
        end
       
        V = V_new;
    end
    return
end