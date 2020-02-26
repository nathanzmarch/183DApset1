function [policy_matrix] = displayPolicy(policy, L, H)
    % policy = [-1, -1, -1, -1, -1, -1];
    % L = 3;
    % H = 2;
    A = ["U", "D", "L", "R", "S"];
    policy_matrix = repmat(" ", [H L]);
    for i = 1:H
        for j = 1:L
            map_i = H - i + 1;
            map_j = j;
            moveProbs = policy(:,(i - 1)*L + j);
            best = 1;
            for action = 1:5
               if moveProbs(best) < moveProbs(action)
                   best = action;
               end
            end
            policy_matrix(map_i, map_j) = A(best);
        end
    end
    policy_matrix
    return
end