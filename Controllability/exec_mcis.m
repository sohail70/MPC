close all;
clear all;
data;
[m,di] = MCIS(system,constraints,target,1000);
% view b_set
for i = 1:size(m,2)
   plot(m(i),'LineWidth',1.3);
   hold on;
   pause(1);
end
