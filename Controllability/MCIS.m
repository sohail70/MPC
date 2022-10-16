%Maximal control invariant set
function [X,di] = MCIS(system,constraints,target,kmax)
X(1) = Polyhedron(target.G,target.h);
current_target.G = X(1).A;
current_target.h = X(1).b;
X(2) = c_set(system,constraints,current_target);
k=2;
while and(not(X(k-1)==X(k)) , k<=kmax)
    k=k+1;
    current_target.G = X(k-1).A;
    current_target.h = X(k-1).b;
    X(k) = c_set(system,constraints,current_target);
end
di = k;

end

% 
% when you start from the whole space and you remove the bad point
% you get maximal something invariant set but if you start from the inside your invariant set may grow
% but you won't converge to maximal invarint set because there might be multiple fixed point of this operator ,or multiple set from which you can not move(page 89 jozve)

%if it converges it will be fixed point of this func --> X = C(X)