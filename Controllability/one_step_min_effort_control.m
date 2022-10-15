function u_min = one_step_min_effort_control(system,constraints,target,x)
%deghat kun in x ozvi az contrable set bayad bashe vagarna javab nadare
u = u_set(system,constraints,target,x);
hessian = 1;
free_term = 0;
[x,fval,exitflag,output,lambda] = quadprog(hessian,free_term,u.A,u.b);
u_min = x;
end