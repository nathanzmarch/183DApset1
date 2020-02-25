function [policy_matrix] = displayPolicy(policy, L, H)
    % policy = [-1, -1, -1, -1, -1, -1];
    % L = 3;
    % H = 2;
    policy_matrix = repmat(" ", [H L]);
    for i = 1:H
        for j = 1:L
            map_i = H - i + 1;
            map_j = j;
            move = policy((i - 1)*L + j);
            if move == L
                policy_matrix(map_i,map_j) = "U";
            elseif move == -L
                policy_matrix(map_i,map_j) = "D";
            elseif move == 1
                policy_matrix(map_i,map_j) = "R";
            elseif move == -1
                policy_matrix(map_i,map_j) = "L";
            elseif move == 0
                policy_matrix(map_i,map_j) = "S";
            end
        end
    end
    return
end