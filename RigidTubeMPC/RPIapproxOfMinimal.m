function [R,S] = RPIapproxOfMinimal(system,disturbance,alpha) %invariantApproxOfMinRPIS 
%for understanding this function you should chek the MinRPIS in
%Reachability folder --> here we use the Output R as an S --> S is in the
%lecture notes but here its R and don't confuse it with the second output
%--> we don't use second output here --> and R here and S in the lecture is
%z in the paper --> so its a mess --> don't get confused
k = 1;
A = system.A + system.B *system.K; 
S_k_minus_1 = disturbance;
while true
    WW = alpha*disturbance;
    A_k_W = A^k * disturbance;
    
    if WW.contains(A_k_W)==1 
        break;
    end
    S_k_minus_1 = S_k_minus_1 + A_k_W; 
    k = k+1;
end
S = S_k_minus_1; %INNER ESTIMATE s(k-1)
R = (1-alpha)^(-1) * S; %OUTER ESTIMATE = R(k-1
end
