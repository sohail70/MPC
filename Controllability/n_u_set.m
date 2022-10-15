function U = n_u_set(system,constraints,target,x,N)

X(1)= Polyhedron(target.G,target.h); %hamoon X(f) . dar Matlab andix az 1 shoro mishe 
for i=1:N
   cts = X(i); % current target set-->cts
   current_target.G = cts.A;
   current_target.h = cts.b;%niazi be in sabk neveshtan nist ke biay poly hed kuni ba dadeha bad az hamoon poly biay dobare dade ro extract kuni estefade kuni! vali man injoori neveshtam vase yadgiri bishtar
   
   U(i) = u_set(system,constraints,current_target,x);   
  
   X(i+1) = c_set(system,constraints,current_target);
end
cts = X(i); % current target set-->cts
current_target.G = cts.A;
current_target.h = cts.b;%niazi be in sabk neveshtan nist ke biay poly hed kuni ba dadeha bad az hamoon poly biay dobare dade ro extract kuni estefade kuni! vali man injoori neveshtam vase yadgiri bishtar

U(i+1) = u_set(system,constraints,current_target,x);
end