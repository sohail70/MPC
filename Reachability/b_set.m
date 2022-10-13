function X = b_set(system,constraints,target)

M = [constraints.C  ; target.G*system.A];
l = [constraints.d; target.h-target.G*system.b];
X = Polyhedron(M,l); %X(k+1)=B(X(k))
%plot(z)
end