function [X,e,di] = MRPIS(system,constraints,target,disturbance,kmax)
X(1) = Polyhedron(target.G,target.h);
current_target.G = X(1).A;
current_target.h = X(1).b;
[X(2),e(1)] = r_b_set(system,constraints,current_target,disturbance);
k=2;
while and(not(X(k-1)==X(k)) , k<=kmax)
    k=k+1;
    current_target.G = X(k-1).A;
    current_target.h = X(k-1).b;
    [X(k),e(k-1)] = r_b_set(system,constraints,current_target,disturbance);
    if e(k-1).isEmptySet
       disp("Disturbance is too big and dynamics can not stay inside the state constraints for ever"); %its my opinion especially the last part
       break;
    end
end
di = k;

end