function [isValid] = isValidMove(s, a)
    L = 5;
    isValid = 1;
    
    % if moving out of bounds or into an obstacle
    if isInBounds(s + a) == 0 || isObstacle(s + a) == 1
        isValid = 0;
        return;
    end
    
    % if moving left or right out of bounds
    if a == -1 && mod(s, L) == 1
        isValid = 0;
    elseif a == 1 && mod(s, L) == 0
        isValid = 0;
    end
    return
end