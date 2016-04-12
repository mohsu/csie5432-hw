%load the files with 9 dimensions
tmp = load('hw2_train.dat');
X_train = tmp(:,1:9);
F_train = tmp(:,10);
tmp = load('hw2_test.dat');
X_test = tmp(:,1:9);
F_test = tmp(:,10);

Eins = zeros(9,1);
thetas = zeros(9,1);
signs = zeros(9,1);
lowest_Ein = 1;
best_dimension = 1;

for i = 1:9

[thetas(i,1), signs(i,1) ,Eins(i,1)] = DSA_1920(X_train(:,i), F_train);

%record the best
if Eins(i,1) < lowest_Ein
    lowest_Ein = Eins(i,1);
    theta = thetas(i,1);
    s = signs(i,1);
    best_dimension = i;
end

end

%compute Eout
Eout = 0;
[N, ~] = size(X_test);
H = zeros(N,1);

for j = 1:N
    
    H(j,1) = s * sign(X_test(j,best_dimension) - theta);
    
    if H(j,1) ~= F_test(j,1)
        Eout = Eout + 1;
    end
    
end

Eout = Eout / N;
