%% albate in ye model control hast va mitoni min of norm of the state bezni na mesle inja u trasnpose dar u ro min kuni ...
%% input va states va control ro plot kun badan
%% this is a close loop control because we are doing it sequentially
function t = min_time_to_target_set(system,constraints,target,x)
N=20;
X=n_c_set(system,constraints,target,N);
time_steps_of_sim = 150; %150 steps --> ino haminjoori neveshtam va har vaght be target set residim break kunim

for t =  1:time_steps_of_sim
    smallest_i = -1;
    for i=1:N
       if(X(i).contains(x))
          smallest_i = i;
          break;
       end
       if(smallest_i==-1)
          disp("Current state is out of controlable sets"); 
       end
    end
    
if(smallest_i==1)
      disp("you are in target set and don't need any control");
      disp(t);
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



end
