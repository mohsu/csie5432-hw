function [ w ] = logistic_regression_stochastic( X, Y, T, eta)
global M;
global N;
[N,M] = size(X);
w = zeros(M,1);

for t = 1:T
    
    n = mod(t,N);
    if n == 0
        n = N;
    end
    v = gradient_Ein_sto(w,n);
    w = w - eta * v;
    
end

function [ y ] = s(x)

    y = 1 / (1+exp(-x));

end

function v = gradient_Ein_sto(w,n) %return a vector(gradient)
    
    x_tmp = transpose(X(n,:));
    theta = 1/(1+exp(Y(n,1) * transpose(w) * x_tmp));
    v = theta * (-Y(n,1)* x_tmp);
    
end

end





