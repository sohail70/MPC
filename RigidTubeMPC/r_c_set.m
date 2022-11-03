% robust control set
% e is effective target set . minkowski difference of real target and
% disturbance. the geomteric difference is easy in mpt tool box you just
% use minus sign
function [xPlus,e] = r_c_set(system,constraints,target,disturbance)
target = Polyhedron(target.G,target.h);% aval ino plot kun
e = target - disturbance;%dovom ham ino plot kun ta bebini modified set che shekli mishe vaghti w ro az target set asli kam mikuni. dar vaghe darim nominal part of the system state ro push mikunim toye in restricted constraints set  ta vaghti uncertainty hit kard  az original target kharej nashim! vase hamin behesh migim effective target set
effective_target.G = e.A;
effective_target.h = e.b;
z = restricted_preimage(system,constraints,effective_target);
n = size(system.A,1); %dimension ee ke behesh mikhay project kuni %in dim state space ro mide chun matrix A hast
xPlus = z.projection(1:n);
%plot(xPlus)
end