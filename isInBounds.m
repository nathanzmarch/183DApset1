function [inBounds] = isInBounds(s)
    inBounds = 1;
    if(s > 30 || s < 1)
        inBounds = 0;
    end
    return
end