function plotData(X, y)
% USAGE:
%     plotData(X, y)
% 
%     where X is the MxN matrix composed of M training samples.
%     y is the label vector.
% 

c1_ind = find(y == 1);
c2_ind = find(y == -1);

figure
plot(X(c1_ind,1), X(c1_ind,2), 'ro', 'MarkerFaceColor', 'r')
hold on;
plot(X(c2_ind,1), X(c2_ind,2), 'k^', 'MarkerFaceColor', 'y')
hold off;
