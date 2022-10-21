function [R,S] = MinRPIS(system,constraints,target,disturbance,alpha)
%alpha is between 0 and 1---> age alpha ro kam begiri R va S be ham
%nazdiktar mishan vali iteration haye bishtari niaz mishe
k = 1;
S_k_minus_1 = disturbance;
while true
    WW = alpha*disturbance;
    A_k_W = system.A^k * disturbance;
    
    if WW.contains(A_k_W)==1 % mitoony is A_k_W<WW ham use kuni- albate age iteration bishtari beri daghigh tar mishe quality of approximation
        break;
    end
    S_k_minus_1 = S_k_minus_1 + A_k_W;
    k = k+1;
end
S = S_k_minus_1; %INNER ESTIMATE s(k-1)
R = (1-alpha)^(-1) * S; %OUTER ESTIMATE = R(k-1)--> This is it self robust positively invariant set : it means once the trajectory enters it stays,  regardless of uncertainty
% but the real minRPIS is X bar which is ground truth and we can not calculate it because the calcs need infinite time

% age az data system.A = [0.9224 0.2273; -0.2273 0.9224];
% estefade kuni eig value hat complex chun mishan mishan rotation matrix va
% plot ke bokoni A_k_W ro dar har marhale mibini ke rotate mikune shekl
end
