%get data
X_train = load('hw3_train.dat');
Y_train = X_train(:,21);
X_train = X_train(:,1:20);
X_train = [ones(1000,1),X_train];
X_test = load('hw3_test.dat');
Y_test = X_test(:,21);
X_test = X_test(:,1:20);
X_test = [ones(3000,1), X_test];

%%%%%%%%%%%%p18%%%%%%%%%%%%%%
w_18 = logistic_regression(X_train,Y_train, 2000, 0.001);
H_18 = X_test * w_18;
Eout_18 = 0;
for i = 1:3000

    if Y_test(i,1) ~= sign(H_18(i,1))
        Eout_18 = Eout_18 + 1;
    end
    
end
Eout_18 = Eout_18 / 3000;

%%%%%%%%%%%%%%p19%%%%%%%%%%%%%%%%%

w_19 = logistic_regression(X_train,Y_train, 2000, 0.01);
H_19 = X_test * w_19;
Eout_19 = 0;
for i = 1:3000

    if Y_test(i,1) ~= sign(H_19(i,1))
        Eout_19 = Eout_19 + 1;
    end
    
end
Eout_19 = Eout_19 / 3000;

%%%%%%%%%%%%%%%p20%%%%%%%%%%%%%%%%%

w_20 = logistic_regression_stochastic(X_train, Y_train, 2000, 0.001);
H_20 = X_test * w_20;
Eout_20 = 0;
for i = 1:3000

    if Y_test(i,1) ~= sign(H_20(i,1))
        Eout_20 = Eout_20 + 1;
    end
    
end
Eout_20 = Eout_20 / 3000;