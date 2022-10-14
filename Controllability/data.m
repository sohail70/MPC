%description of the problem

% %% system
% system.A = 1;
% system.B = 1;
% system.C = 0;
% 
% %% constraints
% constraints.C = [1; -1; 0; 0];
% constraints.D = [0 ;0; 1 ;-1];
% constraints.e = [10; 10; 1; 1];
% 
% %% target
% target.G = [1; -1];
% target.h = [1; 1];
% 
%U = n_u_set(system,constraints,target,-2.5,10) inoo har iter X(i) va U(i)
%ro plot kun ta bishtar dark kuni- masalan dar iter aval ctrb set mishe
%beyne -1 ta 1 va chun roye u gheyd darim [-1 to 1] pas age dar state e
%-2.5 bashe khodeto pare ham bokuni nemitoni ba hich u ee varede ctrb set
%ke beyene -1 ta 1 hast (dar iter aval albate) beshi chun had aksar u = +1
%hast ke ba -2.5 sum ham beshe mishe -1.5 ke dar 1 step ctrb set gharar
%nemigire va haminto boro jelo tahlil kun


%u = u_set(system,constraints,target,1.5)
%plot(u) %control haye monaseb ro neshonet mide--> hala kodom control
%minimum hast?? dastore paeen ro bezan
%[x,fval,exitflag,output,lambda] = quadprog(1,0,u.A,u.b)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %description of the problem 2D
% 
% %% system
% system.A = rand(2,2);
% system.B = rand(2,1);
% system.C = rand(2,1);
% 
% %% constraints-->
% constraints.C = rand(10,2); %you might get empty constraints by generating random so be careful
% constraints.D = rand(10,1);
% constraints.e = rand(10,1);
% 
% %% target 
% target.G = rand(7,2);% 7 constraints withdim 2 states
% target.h = rand(7,1);


% hala benvis X = n_c_set(system,constraints,target,10)
% khoroji age y mosalas bod ke ye khat chasbide bod behesh yani set dar
% jahate oon khat bounded nist
%plot(X(i)) kun age sefid bod yani you overed the whole state space
%immediatley so you don't get anything interseting. problem jazabtar ye box
%hast be onvan constraints so you keep things bounded




% %description of the problem jet
% 
% %% system
% system.A = [-3.2 1;149 -0.02];
% 
% system.B = [-0.03; 7];
% system.C = [1;200];
% 
% %% constraints-->
% constraints.C = [1 0 ; -1 0; 0 1;0 -1; 0 0;0 0]; %you might get empty constraints by generating random so be careful
% constraints.D = [0;0;0;0;1;1];
% constraints.e = [10;10;10;10;2;2];
% 
% %% target 
% target.G = [1 0;-1 0;0 1;0 -1];
% target.h = [10;10;10;10];






%% Double integrator 
%% system
system.A = [1 1;0 1];
system.B = [1/2;1];
system.C = [0;0];

constraints.C = [1 0 ; -1 0; 0 1;0 -1; 0 0;0 0]; %you might get empty constraints by generating random so be careful
constraints.D = [0;0;0;0;1;-1];
constraints.e = [2;10;10;10;2;2];

%% target 
target.G = [1 0;-1 0;0 1;0 -1];
target.h = [0;0;0;0];

