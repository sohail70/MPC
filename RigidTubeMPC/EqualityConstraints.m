function [A_eq,b_eq] = EqualityConstraints(system,N,n,m)

one = kron(eye(N),-system.A);
for j=1:2:N*n-2
    one([j,j+1],[j+2,j+3]) = eye(n);
end

two = zeros(N*n , n);
two(size(two,1)-(n-1):size(two,1) , 1:n) = eye(n);
three = kron(eye(N),-system.B);
A_eq = cat(2,one,two,three);
b_eq = zeros(N*n,1);
end