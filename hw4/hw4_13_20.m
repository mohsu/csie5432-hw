%get data
X_train = load('hw4_train.dat');
[m,n] = size(X_train);
Y_train = X_train(:,n);
X_train = [ones(m,1),(X_train(:,1:n-1))];
X_test = load('hw4_test.dat');
[m,n] = size(X_test);
Y_test = X_test(:,n);
X_test = [ones(m,1),(X_test(:,1:n-1))];


%%%%%%%%%%p13%%%%%%%%%%
lambda = 11.26; 
[Ein_13, Eout_13] = ridge(X_train, Y_train, X_test, Y_test, lambda);

%%%%%%%%%%%p14%%%%%%%%%%
lambdas = [2,1,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10];
Eins_14 = zeros(size(lambdas));
Eouts_14 = zeros(size(lambdas));
for i = 1:13
    lambdas(1,i) = 10^lambdas(1,i);
    [Eins_14(1,i),Eouts_14(1,i)] = ridge(X_train, Y_train, X_test, Y_test, lambdas(1,i));
end

[min_Ein_14, min_Ein_14index] = min(Eins_14);
min_Eout_14 = Eouts_14(1,min_Ein_14index);
min_Ein_14_lambda = min_Ein_14index * (-1) + 3;

%%%%%%%%%%p15%%%%%%%%%%%
[min_Eout_15, min_Eout_15_index] = min(Eouts_14);
min_Ein_15 = Eins_14(1,min_Eout_15_index);
min_Eout_15_lambda = min_Eout_15_index *(-1) + 3;

%%%%%%%%p16%%%%%%%%%%

D_X_train = X_train(1:120,:);
D_Y_train = Y_train(1:120,:);
D_X_valid = X_train(121:200,:);
D_Y_valid = Y_train(121:200,:);
Etrain_16 = zeros(size(lambdas));
Evalid_16 = zeros(size(lambdas));
for i = 1:13
    [Etrain_16(1,i), Evalid_16(1,i)] = ridge(D_X_train, D_Y_train, D_X_valid, D_Y_valid, lambdas(1,i));
end

[min_Etrain_16, min_Etrain_16_index] = min(Etrain_16);
min_Etrain_16_lambda = min_Etrain_16_index * (-1) + 3;
min_Evalid_16 = Evalid_16(1,min_Etrain_16_index);
[~,min_Eout_16] = ridge(D_X_train, D_Y_train, X_test, Y_test,lambdas(1,min_Etrain_16_index) );

%%%%%%%%%p17%%%%%%%%%%%%

[min_Evalid_17, min_Evalid_17_index] = min(Evalid_16);
min_Evalid_17_lambda = min_Evalid_17_index * (-1) + 3;
min_Etrain_17 = Etrain_16(1,min_Evalid_17_index);
[~,min_Eout_17] = ridge(D_X_train, D_Y_train, X_test, Y_test,lambdas(1,min_Evalid_17_index) );

%%%%%%%%%p18%%%%%%%%%%
[Ein_18,Eout_18] = ridge(X_train, Y_train, X_test, Y_test, lambdas(1,min_Evalid_17_index));


%%%%%%%%%%p19%%%%%%%%%%%


Etrains_19 = zeros(13,1);
Evalids_19 = zeros(13,1);

for valid_index = 1:5
    
    D_X_valid_19 = X_train((((valid_index-1)*40+1):valid_index*40),:);
    D_Y_valid_19 = Y_train((((valid_index-1)*40+1):valid_index*40),:);
    D_X_train_19 = zeros(0,0);
    D_Y_train_19 = zeros(0,0);
    
    for f = 1:5 %2345,3451,4512,5123,1234
        if f ~= valid_index
            D_X_train_19 = vertcat(D_X_train_19, X_train((((f-1)*40+1):f*40),:));
            D_Y_train_19 = vertcat(D_Y_train_19, Y_train((((f-1)*40+1):f*40),:));
        end
    end
    
    for i = 1:13
        [tmp1 , tmp2] = ridge(D_X_train_19,D_Y_train_19,D_X_valid_19,D_Y_valid_19,lambdas(1,i));
        Etrains_19(i,1) = Etrains_19(i,1) + tmp1;
        Evalids_19(i,1) = Evalids_19(i,1) + tmp2;
    end
    
end

Ecv = Evalids_19/5;
[min_Evalid_19, min_Evalid_19_index] = min(Ecv);
min_Evalid_19_lambda = min_Evalid_19_index * (-1) + 3;
%%%%%%%%%%%20%%%%%%%%%%%

[Ein_20,Eout_20] = ridge(X_train, Y_train, X_test, Y_test, lambdas(1,min_Evalid_19_index));
lambdas = [2,1,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]; %for plotting