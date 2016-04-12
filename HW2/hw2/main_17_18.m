N = 5000;
data_size = 20;
Ein = zeros(N,1);
Eout = zeros(N,1);
s= zeros(N,1);
Ein_avg = 0;
Eout_avg = 0;

for i = 1:N
    
    X = unifrnd(-1,1,data_size,1);
    [best_theta, s(i,1) ,Ein(i,1), Eout(i,1)] = DSA(X);
    Ein_avg = Ein_avg + Ein(i,1);
    Eout_avg = Eout_avg + Eout(i,1);
    
end

Ein_avg = Ein_avg / N;
Eout_avg = Eout_avg / N;

