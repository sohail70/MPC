function  [x_nominal_seq ,u_nominal_seq] = RTMPC(A_in,c_in,C_in,A_eq,b_eq,H,f,x,n,m,N)

b_in = c_in + C_in*x;
sol = quadprog(0.5*H,f,A_in,b_in,A_eq,b_eq);
x_nominal_seq = reshape(sol(1:(N+1)*n) , n, N+1);
u_nominal_seq = reshape(sol((N+1)*n+1:end) , m, N);

end