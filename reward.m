function [r] = reward(s)
    L = 5;
    if(mod(s,L) == 4)
        r = -100;
    elseif(s == 2) 
        r = 10;
    elseif(s == 12)
        r = 1;
    else
        r = 0;
    end
end