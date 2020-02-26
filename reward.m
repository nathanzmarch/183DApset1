function [r] = reward(s)
    L = 5;
    if(mod(s,L) == 0)
        r = -100;
    elseif(s == 3) 
        r = 10;
    elseif(s == 13)
        r = 1;
    else
        r = 0;
    end
end