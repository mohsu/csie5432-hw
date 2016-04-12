N = 1000;
T = 1000;
Ein_13 = zeros(T,1);
wlin_14 = zeros(6,T);
F = zeros(N,1);

for t = 1:T
    X = unifrnd(-1,1,N,2);
    for i = 1:N
        F(i,1) = f(X(i,1), X(i,2));
    end
    %%%%%%%%%%%%%%%%%p13%%%%%%%%%%%%%%%%%%%
    %get H1
    H1 = h1(X,F);
    for i = 1:N
        if(F(i,1) ~= sign(H1(i,1)))
            Ein_13(t,1) = Ein_13(t,1) + 1;
        end
    end
    Ein_13(t,1) = Ein_13(t,1) / N;
    
    %%%%%%%%%%%%%%%%%p14%%%%%%%%%%%%%%%%%%%
    %get H2
    [wlin_14(:,t),H2] = h2(X,F);
    
end
average_Ein_13 = mean(Ein_13);
%histogram(Ein_13);


%histogram(wlin_14(4,:));
w = mean(transpose(wlin_14)); 
average_w3 = w(1,4);

%%%%%%%%%%%%%%%%%%p15%%%%%%%%%%%%%%%
X_test = unifrnd(-1,1,N,2); %1000*2
F_test = zeros(N,1);
for i = 1:N
        F_test(i,1) = f(X_test(i,1), X_test(i,2));
end
Xtmp = ones(N,6); % Xtmp: 1000*6
for m = 1:N
    Xtmp(m,2) = X_test(m,1); %[.,x1,.,.,.,,]
    Xtmp(m,3) = X_test(m,2); %[.,.,x2,.,.,.]
    Xtmp(m,4) = X_test(m,1)*X_test(m,2); %[.,.,x1*x2,.,.,.]
    Xtmp(m,5) = X_test(m,1)^2; %[.,.,.,.,x1^2,.]
    Xtmp(m,6) = X_test(m,2)^2; %[.,.,.,.,.,.,x2^2]
end
H_test = Xtmp * transpose(w); 
Eout_15 = 0;
for i = 1:N
    if(F_test(i,1) ~= sign(H_test(i,1)))
        Eout_15 = Eout_15 + 1;
    end
end
Eout_15 = Eout_15 / N;
