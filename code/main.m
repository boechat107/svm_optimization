% ========================================================================================= 
% Author: Andre A. Boechat
% File: main.m
% Date: October 29, 2012, 12:35:44 PM
% Description: Matlab code to solve a Hard Margin SVM problem using CVX optimization
% package.
% 
% Reference: 
% http://cvxr.com/cvx/examples/
% 
% ========================================================================================= 

clear;

%% Linear separable data samples generation for training.
% Features dimension
n = 2;
% Number of samples
m = 2*30;
% Center of the classes
c1 = [2 2];
c2 = [4 4];
% Standard deviation from center
stdc = [.4 .4];
% Data samples
X1 = repmat(c1, m/2, 1) + repmat(stdc, m/2, 1) .* randn(m/2, n);
X2 = repmat(c2, m/2, 1) + repmat(stdc, m/2, 1) .* randn(m/2, n);
X = [X1; X2]; 
% Labels
Y = [ones(m/2, 1); -1*ones(m/2,1)];

%% SVM formulation
cvx_begin
    variables w(1,n) b(1)
    minimize(pow_pos(norm(w, 2), 2))
    - Y .* (X * w' + ones(m,1)*b) + ones(m,1) <= zeros(m,1);
cvx_end

plotSVMlinear(X, Y, w, b)
