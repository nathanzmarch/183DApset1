% 1A
L = 5; H = 6;
S = 0:1:L*H;
Ns = L * H;
% 1B
%      up down left right stop
A = [ L , -L, -1, 1, 0];
Na = 5;
%1C see sasprob.m
% usage p = sasprob(0,L,L);


%2B reward.m
r = reward(9);

%3A 
pe = 0.01;
gamma = 0.9;
init_pol = zeros(1, L*H);
for i = 1:L*H
    %if we can move right initial policy is left otherwise its not move
    if(sasprob(i, -1, i-1) == 1 - pe + 0.25*pe)
        init_pol(i) = -1;
    elseif (sasprob(i, -1, i-1) == -1)
        init_pol(i) = -9001;
    end
end
init_pol
displayPolicy(init_pol, L, H)
