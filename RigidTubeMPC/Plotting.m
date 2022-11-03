function []=Plotting(x,x_nominal_seq,u_nominal_seq,designIngrediant)
plot(designIngrediant.Zf+designIngrediant.S,'color','g');
hold on;
plot(designIngrediant.Zf,'color','m');
for j =1:size(x_nominal_seq,2)
    plot(x_nominal_seq(:,j)+designIngrediant.S);
end
axis([-20 5 -2 3])
axis('square')
plot(x_nominal_seq(1,:) , x_nominal_seq(2,:),'-*b')

plot(x(1),x(2),'sb','LineWidth',2);
end