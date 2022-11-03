function [AA,BB,CC]=Plotting(x,x_nominal_seq,u_nominal_seq,designIngrediant)
figure(1);
plot(designIngrediant.Zf+designIngrediant.S,'color','g');
hold on;
plot(designIngrediant.Zf,'color','m');
for j =1:size(x_nominal_seq,2)
    AA(j) = plot(x_nominal_seq(:,j)+designIngrediant.S, 'color' , 'y');
end
axis([-20 5 -2 3])
axis('square')
BB = plot(x_nominal_seq(1,:) , x_nominal_seq(2,:),'-*b')

%% plotting the x --> real dynamics which is effected by disturbance
CC = plot(x(1),x(2),'sb','LineWidth',2);

end