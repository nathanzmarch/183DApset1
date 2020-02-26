% returns 0 if it isn't a boundary, otherwise returns 1
function [boundary] = isObstacle(s) 
    boundary = 0;
    if(s == 7 || s == 8 || s == 17 || s == 18)
        boundary = 1;
    end
    return
end