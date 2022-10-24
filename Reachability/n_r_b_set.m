function [X,e]=n_r_b_set(system,constraints,target,disturbance,N)
X(1) = Polyhedron(target.G,target.h);
for i=1:N
   current_target.G = X(i).A;
   current_target.h = X(i).b;
   [X(i+1),e(i)] = r_b_set(system,constraints,current_target,disturbance);
   if e(i).isEmptySet==true
       disp("Disturbance is too big");
       break;
   end
end

end