%xplus = [1 1;0 1]x + [0.5;1]u + w --> double integrator
%U = {u | |u|<=1} --> Du<=e
%X = {x | [0 1]x<=2}   --> state constraint  --> Cx<=d
%W = {w | |w|_inf <=0.1} --> so diturbance here is an infinity norm ball-->
%so I guess infinity norm ball is a box!
%Q=I
%R=0.01
%V_f(x) = (1/2)x'Px -->terminal cost
%P = [2.0066 0.5099;0.5099 1.2682]

% dar example haye ghabli constraint haro mix karde bodim ama inja separate
% gozashtim bemoone --> albate mitooni mix kuni vali vase inke ba lecture
% ha consistent bashe injoori joda gozashtim bashe
%[1;-1]u <= [1;1] ---> Du<e --> ghablan ke D bozorgtar bood vase in bood ke
%constraints haro mixed karde boodim ama alan joda neveshtim ke mesle jozve
%beshe
%[1 0;-1 0;0 1;0 -1] w <=0.1*[1;1;1;1]    ---> in gheyd w hast fek kunam motmaeen nistam dorost neveshte basham 


%cost dar in paper az half estefade karde 1/2 z^(T) Q z + 1/2 v^(T) R v 
%cost.Q = eye(2)
%cost.R = 0.01;

%% system
system.A = [1 1;0 1];
system.B = [0.5;1];
%% diturbance
Ew = [1 0 ; -1 0; 0 1;0 -1];
Gw = 0.1*[1;1;1;1];
W = Polyhedron(Ew,Gw);
%% constraint --> Cx<=d and Du<=e --> deghat kun inja mesle ghab gheydharo ro mix nakardim vase inke consistency dashte bashim ba lecture note
constraints.C = [0 1]; % gheyd roye state ine ---> x2<=2 ---> dar paper ham negah kuni sheklesh hamino neshoon mide
constraints.d = 2;

constraints.D = [1;-1]; 
constraints.e = [1;1];
N=9;
%% cost
cost.Q = (0.5)*eye(2); %albate dar lecture note (0.5) nadare vali dar paper az 0.5 use kardim
cost.R = (0.5)*0.01;
[system.K,designIngrediant.P] = dlqr(system.A,system.B,cost.Q,cost.R); %albate in K optimal vase u = -Kx ro mide ama dara jozve ma az Kx be onvane control estedafe kardim pas K=-K bezar badesh
system.K = -system.K; % choon to jozve azu=Kx estefade kardim vali matlab func e dlqr u=-kx ro use mikune
%designIngrediant.P ke dar miari mishe nesfe oon chizi ke dar Paper
%neveshte--> check kuni mibini doroste --> chun ma Q va R ro half vared
%kardim
%designIngrediant .P .S .Z .V .Zf  ro store mikunm


%hala ke K ro bedast avordi A+BK (deghat kun ma chun K=-K gereftim mishe A+BK vagarna A-BK bod) ro check kun bebin eig esh less tha one
%hast ya na --> eig(system.A + system.B * designIngrediant.K) ----->   
% eig = [0.3303; 0.0132] which is less than one --> so its good


% dar lectue goftim KS va KZ ke different bodan ama dar paper KS va KZ
% equal hastan yani az ye K vase hardo use mikunim

% dar paper be set e shekl (oon polyhedra ha) mige z vali ma behesh goftim S

% berim soraghe Set S
[designIngrediant.S,~] = RPIapproxOfMinimal(system,W,0.1); % so for the MPC we use Outer tube not inner tube
%alan age plot(designIngrediant.S) kuni mibini shabih shekl paper mishe dar Fig.2
%deghat kun in ye approximation hast

%constraints in a polyhedral form
X = Polyhedron(constraints.C,constraints.d);
U = Polyhedron(constraints.D,constraints.e);

% now we need to check if S is a subset of X and KS is a subset of U
% you can check it by using  designIngrediant.S<=X and
% system.K*designIngrediant.S<=U --> both of them should give true
% age in shartha bargharar nabashe yani choice K va S et feasible nist vase
% design --> yani bayad in phase ro dobare re-iterate kuni

% now we go for Z and V --> nominal dynamics and control
designIngrediant.Z = X - designIngrediant.S; % for the nominal system we have restricted constraints
designIngrediant.V = U - system.K * designIngrediant.S; %V = U - K_s * S


% now we go for Zf --> for Zf we looked at the dynamics zplus = (A+BK)z
% subject to constraints--> z in {z in Z and Kz in V}
% pas bayad on mohtaviate toye akolad ro ba ye single polyhedral set
% neshoon bedim --> ama chegone?
% z in Z --> C_z*z <= d_z  --> az toolbox va desingIngrediant.Z.A va
% designIngrediant.Z.b use kun vase bedast avordan C_z va d_z
% v in V --> C_v*v <= d_v --> ino ham ba dashtan V mishe az toolbox bedast
% avord
% ama ma bayad in do ro tarkib kunim va chun bayad Kz in V bashe pas jaye v
% kochik benivs --> C_v*K*z <= d_v
% pas khahim dasht --> [C_z ; C_v*K] <= [d_z ;d_v] --->Ml<=ll
% so Zl = Polyhderon(Ml<ll) -->l subscript means local to differentiate it with Z

C_z = designIngrediant.Z.A;
d_z = designIngrediant.Z.b;

C_v = designIngrediant.V.A;
d_v = designIngrediant.V.b;

Ml = [C_z;C_v*system.K]; %Kz=K hast dar paper
ll = [d_z;d_v];


Zl =Polyhedron(Ml,ll); % set of initial constraints from terminal dynamics
%Zl is the first candidate for Zf
%zplus = (A+BK)z and z in Zl
%zl is our target for the maximal positively invariant set (MPIS)
%calculation
% so we calc MPIS inside of Zl so Zl is where you would like to be but its
% not positevly invariance so therefore you find MPIS inside of it and that
% result would be Zf

%Zl is the constraints on terminal dynamic zplus= (A+BK_z)z and we want to
%sastisfy this constraints for infinitely many times so we are looking for
%MPIS inside of set Zl
%note that system z+ doesn't have any uncertainty

%Zl is used for target and for constraints as an input to MPIS and remember
%to use closed loop system inside the func.
ZlTarget.G = Zl.A;
ZlTarget.h = Zl.b;

ZlConstraint.C = Zl.A;
ZlConstraint.d = Zl.b;

CLsystem.A = system.A + system.B*system.K;
CLsystem.B = zeros(2,1);
CLsystem.K = system.K;
[X,di] = MPIS(CLsystem,ZlConstraint,ZlTarget,100);
Zf = X(di); % The last one is Zf 



%% Cost
Cost(cost,designIngrediant.P,N);