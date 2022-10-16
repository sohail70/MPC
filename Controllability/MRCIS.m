%Maximal control invariant set
%robust maximal control invariant set
function [X,e,di] = MRCIS(system,constraints,target,disturbance,kmax)
X(1) = Polyhedron(target.G,target.h);
current_target.G = X(1).A;
current_target.h = X(1).b;
[X(2),e(1)] = r_c_set(system,constraints,current_target,disturbance);
k=2;
while and(not(X(k-1)==X(k)) , k<=kmax)
    k=k+1;
    current_target.G = X(k-1).A;
    current_target.h = X(k-1).b;
    [X(k),e(k-1)] = r_c_set(system,constraints,current_target,disturbance);
    if e(k-1).isEmptySet
       disp("Disturbance is too big for this constraints control authority");
       break;
    end
end
di = k;

end
%betartib plot kun ta dark kuni - w ro to data taghir bede ta experiment
%kuni -> at one point your sets will become empty because that disturbance
%is too big for control authority to do anything (chun u ham khodesh gheyd
%dare va harif disturbance nemishe!)

%plot(X)
%hold on
%plot(e)


%toye code agar residi be empty set disp kun ke disturbance too big hast
%toolbox raftare namonaseb neshon mide bad az inke empty mishe ye dafe az
%aval shoro mikune pas khodet sari break kun va bego disturbance is too big
% pas chekc kun e.isemptyset

%unlike in the ctrb set where existence of ctrb equilibrium was guranteeing
%non-emptyness of the sets in the case with the disturbance conditions for
%non-emptyness are much more complicated so its is possible during the
%iterations one of the sets become empty --> disturbance is too big for the
%given control and the specified constraints. it means you can not do contrl
%for horizon up until that point