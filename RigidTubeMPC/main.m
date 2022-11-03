%length of simulation

% generate disturbances for the process --> for example some random w inside W

%pic up and initial condition

% Executing robust tube model predictive control rtmpc




%% plot the controllable sets and state tubes control tubes and plot the cost




%% loading the data - offline stage
data;
%% Control - online stage
n = size(cost.Q,1);
m = size(cost.R,1);

x = [-15;-1.5];
figure('Renderer', 'painters', 'Position', [10 10 900 600])

sim_time = 20;
% agar optimization infeasible bood N ro ziad kun chun nemitone to N step
% berese be maghsad ya to initial condition xdot avalie ro ziad kun to ye
% step gonde bardare --> albate deghat kun ke agar position e target yani
% x(0) ro age manfi dadi xdot ro mosbat bedi chun mikhad bere samte
% origin - albate neidoonam chera adad manfi bozorg midam nemitonne!-->chun N kame!
% zemnan adad x(2) ro bishtar az 2 nemitooni bedi chun gheyd darim ro x(2)!!!
% alabate hes mikunam xdot ro manfi ya mosbat bedi farghi nadare chun
% control khodesh bayad tatbigh bede! 
for i = 1:sim_time
    %% Optimal Control --> Rigid tube mpc
    [x_nominal_seq, u_nominal_seq] = RTMPC(A_in,c_in,C_in,A_eq,b_eq,H,f,x,n,m,N);
    %% Plot
    Plotting(x,x_nominal_seq,u_nominal_seq,designIngrediant);
    %% control law
    u_cur = Control(u_nominal_seq(:,1),x_nominal_seq(:,1) , system.K , x);
    
    %% Random disturbance --> a random point inside set W or choose an extreme point on the boundary of the W
    
    %random_w = W.randomPoint;
    direction = [randi([-1,1]);randi([-1,1])];
    random_w = W.extreme(direction).x; % extreme point in an specific direction

    
    %% dynamic propagation
    x = system.A * x + system.B * u_cur + random_w;
    %%
    %pause(0.1);
    drawnow;
    
    clf
end