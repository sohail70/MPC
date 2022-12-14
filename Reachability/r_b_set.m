%one step robust backward reachable set
function [X,e] = r_b_set(system,constraints,target,disturbance)
target = Polyhedron(target.G,target.h);
e = target - disturbance;
effective_target.G = e.A;
effective_target.h = e.b;
X = b_set(system,constraints,effective_target);

plot(target);
hold on 
pause(0.2);
plot(e);
hold on
pause(0.2);
plot(X);
end