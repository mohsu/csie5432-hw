function [Ein, Eout] = ridge(X_train, Y_train, X_test, Y_test, lambda)

wreg = Wreg(X_train, Y_train, lambda);

%Ein
H1 = X_train * wreg;
Ein = calculate_error(H1, Y_train);
%Eout
H2 = X_test * wreg;
Eout = calculate_error(H2, Y_test);
end

function[error] = calculate_error(H, y)

[m,~] = size(H);
error = 0;
for i = 1:m
    if(sign(H(i,1)) ~= y(i,1))
        error = error +1;
    end
end
error = error / m;

end

function [ wreg ] = Wreg(X , y, lambda)

%Z = norm(X);
Z = X;
[m,n] = size(Z);
I = eye(n,n);
wreg = (transpose(Z) * Z + lambda * I)^(-1) * transpose(Z) * y;

end



function [ Z ] = norm( X )

[m,n] = size(X);
Z = zeros(m,n);

for i = 1:m
    for j = 1:n
        Z(i,j) = X(i,j)^2;
    end
end

%Z = transpose(Z); %n*m

end

