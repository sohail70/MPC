function X=n_c_set(system,constraints,target,N)
%mpt_demo_sets3 -->slide 2
X(1)= Polyhedron(target.G,target.h); %Me: remeber we start from the Xf so we go backward in time 
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


% n step ctrb set chie? in backward in time az Xf yani target shoro mikune
% miad aghab N ta step va dar har gam ye set behet mide 
% masalan agar be set e N om negah kuni tafsir mishe in:
% agar initial condition et toye set e N om bashe zemanat mishe ke dar N
% step beresi be target e Xf et
% daneshjo : so if we start from the small one we gurantee that we stay in the outer
% one in N step time. and if it converges if we start in the small one, we stay for ever in the small one
% but what if you converge to empty set? whats the conclusion? It means you
% can not keep the system that many steps within the constraints-> it means
% disturbacne is big --> this is for r_n_c_set
% age yadet bashe condition for solvability of the problem was that the
% ctrb set was non-empty and the initial condition belonged to that ctrb
% set
% so in taht case you either have to have more control authority or you say
% I can not have more that that disturbance

%and reachability is the same except we don't have control --> control is
%actually fixed! it means how mnay steps we can run dynamics without
%violating constriatns