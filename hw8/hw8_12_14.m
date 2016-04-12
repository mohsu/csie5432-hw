train_data = load('hw8_train.dat');
[m, n] = size(train_data);
train_x = train_data(1:m,1:n-1);
train_y = train_data(1:m,n);

test_data = load('hw8_test.dat');
[m1, n1] = size(test_data);
test_x = test_data(1:m1,1:n1-1);
test_y = test_data(1:m1,n1);


k = [1,3,5,7,9];
Ein = zeros(1,5);
Eout = zeros(1,5);

for kk =1:5
    ttindex = zeros(m,k(1,kk));
    tempn = zeros(m,m);
    for i = 1:m
        for j=1:m
            tempn(i,j) = norm(train_x(i,:)-train_x(j,:))^2;
        end
    end
    for j=1:m 
        joke = tempn(j,:);
        for i =1:k(kk)
            [M, I]= min(joke);
            [Ma] = max(joke);
            ttindex(j,i) = I;
            joke(1,I)=Ma+1;
        end
    end
    for i = 1:m
    	yhat = 0;
        for j = 1:k(1,kk)
            yhat = yhat + train_y(ttindex(i,j),1);
        end
        if sign(yhat) ~= train_y(i,1)
            Ein(1,kk) = Ein(1,kk)+1;
        end
    end
end
Ein = Ein/m;


for kk =1:5
    ttindex = zeros(m1,k(1,kk));
    tempn = zeros(m1,m);
    for i = 1:m1
        for j=1:m
            tempn(i,j) = norm(test_x(i,:)-train_x(j,:))^2;
        end
    end
    for j=1:m1 
        joke = tempn(j,:);
        for i =1:k(kk)
            [M, I]= min(joke);
            [Ma] = max(joke);
            ttindex(j,i) = I;
            joke(1,I)=Ma+1;
        end
    end
    for i = 1:m1
    	yhat = 0;
        for j = 1:k(1,kk)
            yhat = yhat + train_y(ttindex(i,j),1);
        end
        if sign(yhat) ~= test_y(i,1)
            Eout(1,kk) = Eout(1,kk)+1;
        end
    end
end
Eout = Eout/m1;

        