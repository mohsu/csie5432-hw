X_train = load('hw3_train.dat');
Y_train = X_train(:,end);
X_train = X_train(:,1:end-1);

X_test = load('hw3_test.dat');
Y_test = X_test(:,end);
X_test = X_test(:,1:end-1);

trees = RandomForest(X_train, Y_train);
N_train = size(X_train,1);
N_test = size(X_test,1);
T = size(trees,1);
gts_train = zeros(N_train,T);
gts_test = zeros(N_test,T);
Gt_train = zeros(N_train,1);
Gt_test = zeros(N_test,1);
Eins_g = zeros(T,1);

for t = 1:T
     gts_train(:,t) = TestTree(trees(t,1),X_train, Y_train);
     gts_test(:,t) = TestTree(trees(t,1), X_test, Y_test);
     Eins_g(t,1) = TestEout(gts_train(:,t),Y_train);
end

Eins_G = zeros(T,1);
Eouts_G = zeros(T,1);

for t = 1:T
    for n = 1:N_train
        Gt_train(n) = Gt_train(n) + gts_train(n,t);
    end
    for n = 1:N_test
        Gt_test(n) = Gt_test(n) + gts_test(n,t);
    end
    Eins_G(t,1) = TestEout(Gt_train,Y_train);
    Eouts_G(t,1) = TestEout(Gt_test,Y_test);
end