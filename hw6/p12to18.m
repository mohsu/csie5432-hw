X_train = load('hw2_adaboost_train.dat');
Y_train = X_train(:,3);
X_train = X_train(:,1:2);

X_test = load('hw2_adaboost_test.dat');
Y_test = X_test(:,3);
X_test = X_test(:,1:2);

%[g,Ein] = decision_stump(X_train,Y_train);

%%%%%%%p1213141516%%%%%%%%
[record_ds, alphas, G_train , Eins_u, Eins_g, Eins_G, U] = Adaboost(X_train, Y_train);

%%%%%%%p1718%%%%%%%%%%%
Eout_g = zeros(300,1);
Eout_G = zeros(300,1);
[m,n] = size(X_test);
G_test = zeros(m,1);
for t = 1:300
    
    for i = 1:m
        g = record_ds(t,1)*sign(X_test(i,record_ds(t,2))-record_ds(t,3));
        if( g ~= Y_test(i,1))
            Eout_g(t,1) = Eout_g(t,1) + 1;
        end
        G_test(i,1) = G_test(i,1) + g * alphas(t,1);
        if(sign(G_test(i,1)) ~= Y_test(i,1))
            Eout_G(t,1) = Eout_G(t,1) + 1;
        end
    end
    
    Eout_g(t,1) = Eout_g(t,1) / m;
    Eout_G(t,1) = Eout_G(t,1) / m;
end