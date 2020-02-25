% 1A
L = 5; H = 6;
S = 0:1:L*H;
Ns = L * H;
% 1B
%      up down left right stop
A = [ L , -L, -1, 1, 0];
Na = 5;
%1C see sasprob.m
% ussage p = sasprob(0,L,L);


%2B reward.m
r = reward(9);