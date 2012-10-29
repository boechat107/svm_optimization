function [w, b] = svm_primal(X, Y)
% Primal problem of the Hard Margin SVM.
% 
% USAGE:
%     [w, b] = svm_primal(X, Y)
% 
%     X is the training dataset.
%     Y is the label vector.
%     [w, b] are the hyperplane parameters, the solution of the SVM problem.

[m, n] = size(X);

%% SVM formulation
cvx_begin
    variables w(1,n) b(1)
    minimize(pow_pos(norm(w, 2), 2))
    - Y .* (X * w' + ones(m,1)*b) + ones(m,1) <= zeros(m,1);
cvx_end

