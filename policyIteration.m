function [policy] = policyIteration(policy, actions, gamma)
    while true
       values = policyEval(policy, actions, gamma);
       new_policy = policyBackup(values, actions, gamma);
       if policy == new_policy
           break;
       else
           policy = new_policy;
       end
    end
    return
end