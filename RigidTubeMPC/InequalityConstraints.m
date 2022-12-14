function [A_in , c_in, C_in] = InequalityConstraints(designIngrediant,N,n,m) % x is given --> it's a state

C_z = designIngrediant.Z.A;
d_z = designIngrediant.Z.b;

C_v = designIngrediant.V.A;
d_v = designIngrediant.V.b;

C_bar = designIngrediant.Zf.A;
d_bar = designIngrediant.Zf.b;

C_s = designIngrediant.S.A;
d_s = designIngrediant.S.b;


% constraints z_k in Z and v_k in V and z_n in Z_f 
A_in = zeros(N*size(C_z,1)+1*size(C_bar,1)+N*size(C_v,1) + size(C_s,1) ,  (N+1)*n+N*m);
A_in(1:N*n,1:N*n) = kron(eye(N),C_z);
A_in(N*n+1:N*n+size(C_bar,1) , N*n+1: N*n+size(C_bar,2)) =  C_bar;
A_in(N*n+size(C_bar,1) + 1 :N*n+size(C_bar,1) + N*size(C_v,1) ,   N*n+size(C_bar,2) +1 : N*n+size(C_bar,2)+N*size(C_v,2)) = kron(eye(N) ,  C_v);
% constraints x-z_0 in S
A_in(N*n+size(C_bar,1) + N*size(C_v,1)+1:end , 1:size(C_s,2)) = -C_s;


c_in = cat(1,repmat(d_z,[N,1]) , d_bar , repmat(d_v,[N,1]) , d_s);

C_in = zeros(size(A_in,1),n);
C_in(end-size(C_s,1)+1:end ,:) = -C_s;
end