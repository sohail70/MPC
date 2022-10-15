% %khodam --> MPIS hamoon n_b_set dar limit hast ke vaghti converge mikune ke
% %Xk+1 = B(Xk) mishe
% %masalan run kun --> m = MPIS(system,constraints,target,1000)
% function m = MPIS(system,constraints,target,k_max) %maximal positively invariant set
% %max_iter gozashtim chun shayad sharte X_k subset of X_k+1 bargharar nashe
% %hichvaght
% k=1;
% X(1)= Polyhedron(target.G,target.h);
% while(k<=k_max)  %k_max is the max number of iteration
%    cts = X(k); % current target set-->cts
%    current_target.G = cts.A;
%    current_target.h = cts.b;
%    X(k+1) = b_set(system,constraints,current_target);
%    % shart e inclusion dar if agar moshkele numerical dasht bayad epsilon bezari
%    if(X(k+1)>X(k)) %in shart momkene bekhatere problem haye numerical eshtebah javab bede yani hold bokone dar vagheyat ama nare to if pas niaz mishe deep tar analyze bokoni albate dar masael sade be moshkel bar nemikhoori
%       break; 
%    end
%    k=k+1;
% end
% m = X; %albate maximal mishe akharin arraye X
% %eig(system.A) manfi beshe stable nist va in ro finite time converge
% %nemishe!
% end
% 


%% chizi ke khode ostad neveshte
function [X,di] = MPIS(system,constraints,target,kmax)
X(1) = Polyhedron(target.G,target.h);
current_target.G = X(1).A;
current_target.h = X(1).b;
X(2) = b_set(system,constraints,current_target);
k=2;
while and(not(X(k-1)==X(k)) , k<=kmax)
    k=k+1;
    current_target.G = X(k-1).A;
    current_target.h = X(k-1).b;
    X(k) = b_set(system,constraints,current_target);
end
di = k;

end