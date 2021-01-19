function kleiber_wrapper()

% This file is associated with the book
% "Machine Learning Refined", Cambridge University Press, 2016.
% by Jeremy Watt, Reza Borhani, and Aggelos Katsaggelos.

% variables
data = csvread('kleibers_law_data.csv',1);
x = data(:,1)';
y = data(:,2);

% transform the data  
x = log(x);
y = log(y);
x_tilde = [ones(1,length(x)); x];

% fit a linear model in the transformed data space
w_tilde = linsolve(x_tilde',y);
b = w_tilde(1)
w = w_tilde(2)

% fit model to transformed data
figure(1)
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',3)
hold on
model = [min(x)-1:0.1:max(x)+1];
out = b+ w*model;

plot(model,out,'--m','LineWidth',2)
box on
axis([min(model) max(model) (min(y) - 1) (max(y) + 1)])
set(gca,'FontSize',12);

% define labels for subplot
xlabel('log of mass','Fontsize',14,'FontName','cmr10')
ylabel('log of metabolic rate','Fontsize',14,'FontName','cmr10')
set(get(gca,'YLabel'),'Rotation',90)
set(gcf,'color','w');

end




