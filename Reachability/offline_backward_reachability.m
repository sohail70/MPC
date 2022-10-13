clear all;
close all;
data;
X = n_b_set(system,constraints,target,N);
plot(X);%when A is strictly stable and the constraints are bounded the convergence will happen in finite time --> mitoni eig(system.A) ro check kuni bebinin convergent factor chande ke befahmi ba che sor@ti converge mikune(adade aval)
%ashkal chera kochik o kochiktar mishe vase har X --> doroste ke
%uncertainty nadarim vali dynamic ham mitone toro az rectangle bendaze
%biron pas miaym state haye bad ro ke dynamic onaro bad az N step mindaze
%biroon hazf mikunim