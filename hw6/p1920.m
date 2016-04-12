X_train = load('hw2_lssvm_all.dat');
Y_train = X_train(1:400, end);
Y_test = X_train(401:end, end);
X_test = X_train(401:end, 1:end-1);
X_train = X_train(1:400,1:end-1);

[n_train,~] = size(Y_train);
[n_test, ~] = size(Y_test);

gamma = [32,2,0.125];
lambda = [0.001,1,1000];
Eins = [];
Eouts = [];


for g = gamma
    for l = lambda
        
       Ein = 0;
       Eout = 0;
       g_train = zeros(n_train,1);
       g_test = zeros(n_test,1);
       K_train = create_K(X_train,X_train,g);
       K_test = create_K(X_test,X_train,g);
       
       betas = (l * eye(n_train) + K_train)^(-1) * Y_train;
       
       for i = 1:n_train
           for j = 1:n_train
                g_train(i,1) = g_train(i,1) + betas(j,1) * K_train(i,j);
           end
       end
       
       for i = 1:n_test
           for j = 1:n_train
                g_test(i,1) = g_test(i,1) + betas(j,1) * K_test(i,j);
           end
       end
       
       for i = 1:n_train
           if sign(g_train(i,1)) ~= Y_train(i,1)
               Ein = Ein + 1;
           end
       end
       
       for i = 1:n_test
           if sign(g_test(i,1)) ~= Y_test(i,1)
               Eout = Eout + 1;
           end
       end
       
       Ein = Ein / n_train;
       Eout = Eout / n_test;
       
       Eins = [Eins; Ein];
       Eouts = [Eouts; Eout];
       
    end
end
    
Ein_19 = Inf;
Eout_20 = Inf;