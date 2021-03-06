function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Size of X = 12 x 2 
hypothesis = X * theta; % 12 x 1
J = sum ( (hypothesis - y).^2 );
J = J / (2*m);
theta(1) = 0;
reg_term = sum(theta.^2);
reg_term = (reg_term * lambda) / (2*m);
J = J + reg_term;

% =========================================================================

grad = grad(:);

error = (hypothesis - y);
for i = 1 : rows(theta)
  grad(i) = sum(error .* X(:,i)) / (m);
  grad(i) = grad(i) + ( lambda * theta(i) ) / (m) ;
end


 

end
