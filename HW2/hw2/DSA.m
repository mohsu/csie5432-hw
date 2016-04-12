function [best_theta, best_s ,best_Ein, Eout] = DSA (X)

[N, ~] = size(X);

%compute f(x)
F = zeros(N,1);
for i = 1:N
    F(i,1) = f(X(i,1));
end

best_theta = 0;
best_s = 1;
best_Ein = 1;

for d = 1:100
    %randomly select theta for 100 times
    tmp_theta = unifrnd(-1,1);
    
    %record h(x) for s=+1, s=-1
    tmp_H_positive = zeros(N,1);
    tmp_H_negative = zeros(N,1);
    for i = 1:N
        tmp_H_positive(i,1) = h(X(i,1), +1 ,tmp_theta); %s=+1
        tmp_H_negative(i,1) = h(X(i,1), -1 ,tmp_theta); %s=-1
    end
    %compute Ein for s=+1, s=-1
    Ein_positive = ComputeEin(tmp_H_positive,F);
    Ein_negative = ComputeEin(tmp_H_negative,F);
    
    %record the best
    if Ein_positive < best_Ein
        best_Ein = Ein_positive;
        best_theta = tmp_theta;
        best_s = 1;
    end
    if Ein_negative < best_Ein
        best_Ein = Ein_negative;
        best_theta = tmp_theta;
        best_s = -1;
    end
    
end 

Eout = 0.5 + 0.3 * best_s * (abs(best_theta)-1);

end

function error = ComputeEin(H,F)
error = 0;
[N, ~] = size(H);
for j = 1:N
    if H(j,1) ~= F(j,1)
        error = error + 1;
    end
end

error = error / N;

end

function y = f( x )

y = sign(x);

if(rand < 0.2)
    y = y*(-1);
end

end

function y = h( x, s, theta )

y = s * sign(x-theta);

end