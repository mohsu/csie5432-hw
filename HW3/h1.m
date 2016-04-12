function [ H1 ] = h1( X, F )

% (1,x1,x2) d=2
[m,~] = size(X);
X = [ones(m,1),X];
w_lin = pinv(X) * F;

H1 = X * w_lin ;

end

