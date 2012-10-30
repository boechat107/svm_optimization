function [w, b] = svm_lagrangian(X, Y)
% Lagrangian formulation of the Hard Margin SVM.
% 
% USAGE:
%     [w, b] = svm_lagrangian(X, Y)
% 
%     X is the training dataset.
%     Y is the label vector.
%     [w, b] are the hyperplane parameters, the solution of the SVM problem.
%     w is 1xN vector.
%     b is a real value.

[m, n] = size(X);

%% Dual problem of the Lagrangian formulation.
Z = repmat(Y, 1, n) .* X;
H = Z * Z'; % MxM matrix
cvx_begin
    variables lambda(m, 1)
    %maximize ( sum(lambda) - .5 * lambda' * H * lambda )
    maximize ( sum(lambda) - .5 * quad_form(lambda, H) )
    lambda'*Y == 0;
    lambda >= zeros(m, 1);
cvx_end

% w is 1xN
w = (lambda .* Y)' * X;

% Non-zero lagrangian multipliers.
l1 = find(lambda > 1e-6 & Y == 1);
l2 = find(lambda > 1e-6 & Y == -1);

% b calculation as Gunn1998 suggested.
b = - .5 * w * (X(l1(1), :) + X(l2(1), :))';
