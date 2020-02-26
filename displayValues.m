function [value_matrix] = displayValues(values, L, H)
    value_matrix = zeros(H, L);
    for i = 1:H
        for j = 1:L
            map_i = H - i + 1;
            map_j = j;
            if isObstacle((i-1)*L + j) == 1
                value_matrix(map_i, map_j) = 0;
                continue;
            end
            value_matrix(map_i, map_j) = values((i-1)*L + j);
        end
    end
    value_matrix
    return

end