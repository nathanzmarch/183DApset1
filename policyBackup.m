function [policy] = policyBackup(values, actions, gamma)
    Ns = length(values(1,:));
    Na = length(actions);
    
    policy = zeros(5, Ns);

    for s = 1:Ns
        bestPol = 5;
        bestQ = intmin;
        
        for a = 1:Na
            Q = 0;
            if isInBounds(s + actions(a)) == 0 || isObstacle(s + actions(a)) == 1
                continue;
            end
            for a2 = 1:Na
                sp = s + actions(a2);
                if isInBounds(sp) == 1 && isObstacle(sp) == 0 && isValidMove(s, actions(a2)) == 1
                    temp = sasprob(s, actions(a), sp) * (reward(sp) + gamma * values(sp));
                    Q = Q + temp;
                end
            end
            if Q > bestQ
                bestQ = Q;
                bestPol = a;
            end
        end
        
        policy(bestPol, s) = 1;
    end
    return
end