function X=n_b_set(system,constraints,target,N)
X(1)= Polyhedron(target.G,target.h);
for i=1:N
   current_target.G = X(i).A;
   current_target.h = X(i).b;
   X(i+1) = b_set(system,constraints,current_target);
end

end