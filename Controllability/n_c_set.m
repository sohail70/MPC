function X=n_c_set(system,constraints,target,N)
%mpt_demo_sets3 -->slide 2
X(1)= Polyhedron(target.G,target.h);
for i=1:N
   cts = X(i); % current target set-->cts
   current_target.G = cts.A;
   current_target.h = cts.b;
   X(i+1) = c_set(system,constraints,current_target);
end
%plot(X); % intervals between -k and k
%plot(X(1)); % beyne -1 ta 1
%plot(X(10); % beyne -10 ta 10
end