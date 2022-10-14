function t = u_for_MCIS(system,constraints,target,x)
kmax = 200;
[forwardX,di] = MCIS(system,constraints,target,kmax); %Me : It's computed forward in time so make it backward so that You can use it 
k=size(forwardX,2); %az varibale di ham mishe use kard
for j = 1:size(forwardX,2)
    backwardX(j) =forwardX(k);
    k = k-1;
end
X = backwardX;
% %X=n_c_set(system,constraints,target,6);
% %debuge = X;
time_steps_of_sim = 350; 
for t =  1:time_steps_of_sim
    smallest_i = -1;
    for i=1:size(X,2)
       if(X(i).contains(x))
          smallest_i = i;
          break;
       end
       if(smallest_i==-1)
           d = ["Current state is out of",num2str(i) ,"step controlable set"];
           disp(d); 
       end
    end
    
if(smallest_i==1)
      disp("you are in target set and don't need any more control");
      disp(t);
      break;
end

if(smallest_i==-1)
    warning("Not controllable from that initial state");
    break;
end

    index = smallest_i;
    %we are transition from X_k to X_k-1 so effective target set is X_k-1
    XX = X(index-1); %noghte harkat be samte target set --> ke ma inja andix ro az aval shoro mikunim ta noghte shoro harkat bashe
    
    
    effective_target_set = XX; % not sure about the index should it be this --> fek kunam shekle jozve komaker kune --> smallest index ro noghte shoro dar nazar begir va arom arom zaman yani andix ro ziad kun 
    current_target.G = effective_target_set.A;
    current_target.h = effective_target_set.b;
    u_min = one_step_min_effort_control(system,constraints,current_target,x);
    x = system.A * x + system.B*u_min;
   
end


disp(x);

end