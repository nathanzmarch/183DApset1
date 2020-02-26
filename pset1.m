% 1A
L = 5; 
H = 6;
S = 0:1:L*H;
Ns = L * H;

% 1B
% up down left right stop
A = [ L, -L, -1, 1, 0];
Na = 5;

% 1C see sasprob.m
% usage p = sasprob(0,L,L);

% 2B see reward.m
r = reward(9);

% 3A, policy is a probability distribution for each action
pe = 0.01;
gamma = 0.9;
init_pol = zeros(5, L*H);

for s = 1:L*H
    % if we can move then move left, otherwise the policy is stop
    if isObstacle(s-1) == 0 && isInBounds(s-1) == 1 && isValidMove(s, -1) == 1
       init_pol(3, s) = 1;
    else
       init_pol(5, s) = 1;
    end
end

% 3B - Check displayPolicy.m
initialPolicy = displayPolicy(init_pol, L, H);
initialPolicy

% 3C - Check policyEval.m
values = policyEval(init_pol, A, gamma);

% 3D - Check policyBackup.m
back_pol = policyBackup(values, A, gamma);
backupPolicy = displayPolicy(back_pol, L, H);
backupPolicy

% 3E/F - Check policyIteration.m
tic
best_pol = policyIteration(init_pol, A, gamma);
toc
optimalPolicy_pIter = displayPolicy(best_pol, L, H);
optimalPolicy_pIter

% 4A - Check valueIteration.m
init_val = policyEval(init_pol, A, gamma);
valueIteration(init_val, A, gamma);

% 4B - Check valueIteration.m
tic
best_pol = valueIteration(init_val, A, gamma);
toc
optimalPolicy_vIter = displayPolicy(best_pol, L, H);
optimalPolicy_vIter



