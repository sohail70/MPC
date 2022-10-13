% one step controllable set
function xPlus = c_set(system,constraints,target)
z = restricted_preimage(system,constraints,target);
n = size(system.A,1); %dimension ee ke behesh mikhay project kuni %in dim state space ro mide chun matrix A hast
xPlus = z.projection(1:n);
%plot(xPlus)
end