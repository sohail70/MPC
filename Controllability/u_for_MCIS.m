% u for maximal control so that we keep the state in this set
% bad az inke mpis ro calc kardi ba che u e in too bemonim
% nazar man ine ke be ehtemal besiar ziad faghat ye target darim va onam
% MCIS yani set e omega hast ke dar har iteration bayad on to bemonim ba ye
% u ee. nokte albate ine ke chejoori varede in set beshim ke fek kunam
% felan in mad nazar nabashe va x ro fek kunam bayad dakhele control
% invariant set bedim. ehtemalan dynamic maro mikhad bendaze biroon vali
% hatman yek u vojod dare ke maro oon to negahdare
function [] = u_for_MCIS(system,constraints,target)
kmax = 200;
[X,di] = MCIS(system,constraints,target,kmax); 
MCIset = X(di);
%MCIS is the only target 
target.G = MCIset.A;
target.h = MCIset.b;
subplot(2,1,1);
plot(MCIset);
hold on;

time_steps_of_sim = 5000; 

% choose a random point inside the control invariant set ---> we wanna show
% that there is always a u for you to keep you inside the control invariant
% set
x = MCIset.randomPoint ; %starting point of out dynamic
thePoint=plot(x(1),x(2),'ob');
% x = [-8;4]; %dar iteration 4 u_min empty set mishe!!!  chera?!
%x=[-10;6];
U = [];
I =[];
for i=1:time_steps_of_sim
    delete(thePoint);%clearing the plot
    u_min = one_step_min_effort_control(system,constraints,target,x);
    x = system.A * x + system.B*u_min;
    subplot(2,1,1);
    thePoint=plot(x(1),x(2),'ob');
    drawnow;
    
    U = [U,u_min];
    I = [I,i];
    subplot(2,1,2);
    plot(I,U,'r');
    hold on;
    disp(x(2));
end
% jalebe ke double integrator agar state dovom buad ro sef dg u ziadi niaz
% nadare ke maro ro seft negah dare

end