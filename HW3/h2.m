function [ w_lin ,H2 ] = h2( X, F ) %F = 1000*1
%(1,x1,x2,x1x2,x1^2,x2^2) d=5
[m,~] = size(X);
Xtmp = ones(m,6); % Xtmp: 1000*6

for i = 1:m
    Xtmp(i,2) = X(i,1); %[.,x1,.,.,.,,]
    Xtmp(i,3) = X(i,2); %[.,.,x2,.,.,.]
    Xtmp(i,4) = X(i,1)*X(i,2); %[.,.,x1*x2,.,.,.]
    Xtmp(i,5) = X(i,1)^2; %[.,.,.,.,x1^2,.]
    Xtmp(i,6) = X(i,2)^2; %[.,.,.,.,.,.,x2^2]
end

w_lin = pinv(Xtmp) * F; %6*1

H2 = Xtmp * w_lin; %

end