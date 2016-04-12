train_data = load('hw8_train.dat');
[m, n] = size(train_data);
train_x = train_data(1:m,1:n-1);
train_y = train_data(1:m,n);

test_data = load('hw8_test.dat');
[m1, n1] = size(test_data);
test_x = test_data(1:m1,1:n1-1);
test_y = test_data(1:m1,n1);

g = [0.001,0.1,1,10,100];
Ein = zeros(1,5);
Eout = zeros(1,5);

for l = 1:5
    ttindex = zeros(m,1);
    uniform = zeros(m);
    for i = 1:m
        for j = 1:m
            uniform(i,j) = exp(-1*g(1,l)*(norm(train_x(i,:)-train_x(j,:))^2));
        end
    end
    for i = 1:m
        yhat = 0;
        for j =1:m
            yhat = yhat + train_y(j,1)*uniform(i,j);
        end
        if sign(yhat) ~= train_y(i,1)
            Ein(1,l) = Ein(1,l)+1;
        end
    end
end
Ein = Ein/m;

for l = 1:5
    ttindex = zeros(m1,1);
    uniform = zeros(m1);
    for i = 1:m1
        for j = 1:m
            uniform(i,j) = exp(-1*g(1,l)*(norm(test_x(i,:)-train_x(j,:))^2));
        end
    end
    for i = 1:m1
%       [M,I] = max(uniform(i,:));
%     	yhat = train_y(I,1);
        yhat = 0;
        for j =1:m
            yhat = yhat + train_y(j,1)*uniform(i,j);
        end
        if sign(yhat) ~= test_y(i,1)
            Eout(1,l) = Eout(1,l)+1;
        end
    end
end

Eout = Eout/m1;