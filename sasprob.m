function [psas] = sasprob(s, a , sp)
    % changes index-1 input to index-0 input
    s = s-1;
    sp = sp-1;
    
    L = 5;
    pe = 0.01;
    %if it hits a boundary
    if(sp == 6 || sp == 7 || sp == 16 || sp == 17)
        psas = 0;
        return;
    end
    % if oustide bounding box
    if(s + a > 30 || s + a < 0 || mod(s,L) == 0 && a == -1 || mod(s,L) == L-1 && a == 1)
        psas = 0;
        return;
    end
    %if not moving
    if(a == 0)
        if( s == sp ) 
            psas = 1;
        else
            psas = 0;
        end
        return;
    end
    %if you go in the direction you are moving
    if(s + a == sp) 
        psas = 1 - pe + 0.25 * pe;
    %if sp is a random other direction
    elseif (s+1 == sp || s-1 == sp || s+L == sp || s-L == sp)
        psas = 0.25*pe;
    else
        psas = 0;
    end
end