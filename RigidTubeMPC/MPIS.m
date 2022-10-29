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