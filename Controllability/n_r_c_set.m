function [X,e]=n_r_c_set(system,constraints,target,disturbance,N)
X(1)= Polyhedron(target.G,target.h); 
for i=1:N
   cts = X(i);
   current_target.G = cts.A;
   current_target.h = cts.b;
   [X(i+1),e(i)] = r_c_set(system,constraints,current_target,disturbance);
end

end
%be in sethaye shrink shode migan minimax controllable set
% dar kol minimax chek mikune ? you choose u at a given x and regardless of what disurbance happens, it works
% baraye inke dark kuni betartib inaro plot kun
% plot(X(1))  
% hold on;
% plot(e(1)) %mishe shrink shodeye X(1)-> yani effective target vase on step
% plot(X(2))
% plot(e(2)) %shrink shodeye X(2)
% etc --> so if you are at X(5) your target is e(4)=X(4)-w not X(4) so be careful

% darim che mikunim? you are starting from the whole constriants set and you are asking
% if you can keep the system inside of your constraints and it tell you, I can not do that and 
% and I can in a one step only do it in a subset, in two steps I can do it in another subset and so on so forth
% and you are hoping this converges and when it converges you can keep it infinitley long
% and when you have uncertainty your ctrb set shrinks and the reason is because now there is an 
% interplay between the control authority and the disturbance and if forexample you push the states to the boundary, diturbace will take you out
% so you have to be more cautious.