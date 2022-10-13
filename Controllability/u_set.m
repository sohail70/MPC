function u = u_set(system,constraints,target,x)
    P = [constraints.D; target.G*system.B];
    r = [constraints.e-constraints.C*x ; target.h-target.G*system.C-target.G*system.A*x];
    u = Polyhedron(P,r); %the control w.r.t state x that works!
end