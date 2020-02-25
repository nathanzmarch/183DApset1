function [policy_matrix] = displayPolicy(policy, L, H)
    % policy = [-1, -1, -1, -1, -1, -1];
    % L = 3;
    % H = 2;
    policy_matrix = repmat(" ", [H L]);
    for i = 1:H
        for j = 1:L
            move = policy((i - 1)*L + j);
            if move == L
                policy_matrix(i,j) = "U";
            elseif move == -L
                policy_matrix(i,j) = "D";
            elseif move == 1
                policy_matrix(i,j) = "R"
            elseif move == -1
                policy_matrix(i,j) = "L"
            else
                policy_matrix(i,j) = "S";
            end
        end
    end
    return
end