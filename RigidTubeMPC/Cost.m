function [H,f] = Cost(cost, P ,N ) %N is horizon length
n = size(cost.Q,1); %state space dim
m = size(cost.R,1); % control dim
H = zeros((N+1)*n + N*m , (N+1)*n + N*m); %(9+1)*2 + 9 = 29 mishe dimension   %Hessian ee ke bayad be quad prog bedim ro inja construct mikunim
% Q ro bezar to matrix --> vase z0 ta zN
%Z_k ' * Q * z_k for 
H(1:n*N,1:n*N ) = kron(eye(N),cost.Q); %ghablan ye bar half kardim Q ro pas inja nakon dg vali badan bayad zarbdar 2 kunim chum quadprog halft mikune khod bekhod vase hamin 2 barabar mikunim ta badan ke half shod dobare beshe hamini ke darim va hamini ke darim ro hal kunim
H((n*N)+1:(n*N)+2,(n*N)+1:(n*N)+2) = P; %19-20 * 19-20  ---> ya index ro injoori benvis--> H(N*n+1:(N+1)*n , N*n+1:(N+1)*n) = P

%v_k' * R * v_k  for k=0,1,...,N-1
H((n*N)+3:end , (n*N)+3:end) =kron(eye(N),cost.R); % ya injoori benvis mesle ostad:  H( (N+1)*n+1 : (N+1)*n+N*m , (N+1)*n+1 : (N+1)*n+N*m ) = kron(..)

%mishe kolan bejaye in hame assingment az blkdiag estefade kuni ke ma use
%nakardim

% Take care of QP from used by quad prog:
H = 2*H; % because quadprog minimizes the half of H so we use 2 times H 
f = zeros((N+1)*n + N*m,1); % free term that is needed for quadprog to work which is zero here
end