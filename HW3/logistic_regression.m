function [ w ] = logistic_regression( X, Y, T, eta)
global M;
global N;
[N,M] = size(X);
w = zeros(M,1);

for t = 1:T

    v = gradient_Ein(w);
    w = w - eta * v;
    
end




function v = gradient_Ein(w) %return a vector(gradient)

    v = zeros(M,1);

    for n = 1 : N
        
        x_n = transpose(X(n,:));
        y_n = Y(n,1);
        theta = 1/(1+exp(y_n * transpose(w) * x_n));
        v = v + theta * ((-1)*y_n* x_n);
    end
    
    v = v / N;

end

function [ y ] = s(x) %會神慢 不採用

    y = 1 / (1+exp(-x));

end

%display(transpose(v));
end





