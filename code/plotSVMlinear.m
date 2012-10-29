function plotSVMlinear(X, y, w, b)
% USAGE:
%     plotSVMlinear(X, y, w, b)
% 
%     X is the training data.
%     Y is the label vector.
%     w and b are the hyperplane parameters of the SVM solution.

t_min = min(X(:,1)) - .2;
t_max = max(X(:,1)) + .2;
tt = linspace(t_min, t_max, 100);
H = - (w(1)*tt + b)/w(2);
H1 = - (w(1)*tt + b - 1)/w(2);
H2 = - (w(1)*tt + b + 1)/w(2);

plotData(X, y)
hold on;
plot(tt, H, '-b')
plot(tt, H1, '--b')
plot(tt, H2, '--b')
hold off;
