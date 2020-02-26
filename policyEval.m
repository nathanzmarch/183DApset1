function [V] = policyEval(policy, actions, gamma)
    Ns = length(policy(1,:));
    Na = length(actions);
    
    V = zeros(Ns);
    delta = 0;
    endCond = 0.0001;
    
    while delta > endCond
       delta = 0;
       V_new = np.zeros(Ns);
       
       for s = 1:Ns
           actionProbs = policy(:, s);
           for a = 1:Na
               sp = s + actions(a);
               temp = sasprob(s, actions(a), sp) * (reward(sp) + gamma * V(sp));
               V_new(s) = V_new(s) + actionProbs(a) * temp;
           end
           if delta < abs(V_new(s) - V(s))
               delta = abs(V_new(s) - V(s));
           end
       end
    end
    return
end