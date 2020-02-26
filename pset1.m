% 1A
L = 5; 
H = 6;
S = 0:1:L*H;
Ns = L * H;

% 1B
%     up down left right stop
A = [ L, -L, -1, 1, 0];
Na = 5;

% 1C see sasprob.m
% usage p = sasprob(0,L,L);

% 2B see reward.m
r = reward(9);

% 3A 
pe = 0.01;
gamma = 0.9;

% policy contains a probability distribution for each move
init_pol = zeros(5, L*H);
for s = 1:L*H
    % if we can move then move left, otherwise the policy is stop
    if isObstacle(s-1) == 0 && isInBounds(s-1) == 1 && isValidMove(s, -1) == 1
       init_pol(3, s) = 1;
    else
       init_pol(5, s) = 1;
    end
end

displayPolicy(init_pol, L, H)
policyEval(init_pol, A, gamma);
