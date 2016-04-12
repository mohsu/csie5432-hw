train_X = load('features.train');
train_Y = train_X(:,1);
train_X = train_X(:,2:end);
%%%%%%%20%%%%%%%%%
i = 0;

%convert to binary labels
train_Y_binary = zeros(length(train_Y),1);

for k = 1:length(train_Y)
    if train_Y(k,1) ~= i
        train_Y_binary(k,1) = -1;
    else
        train_Y_binary(k,1) = 1;
    end
end

best_gamma = zeros(100,1);

for loop = 1:100
    
    %select randomly 1000 examples
    train_X_6000 = train_X;
    train_Y_6000 = train_Y_binary;
    X_valid = zeros(1000,2);
    Y_valid = zeros(1000,1);

    for ex = 1:1000
        index = randi(length(train_X_6000));
        X_valid(ex,:) = train_X(index,:);
        Y_valid(ex,:) = train_Y_binary(index,:);
        train_X_6000(index,:) = [];
        train_Y_6000(index,:) = [];
    end
    
    Eval = zeros(5,1);
    %C = 10^0
    model = svmtrain(train_Y_6000,train_X_6000,'-t 2 -g 1 -c 0.1 scale=false');
    [~, accuracy, ~] = svmpredict(Y_valid,X_valid, model,'scale=false');
    Eval(1,1) = (100-accuracy(1,1))/100;
    
    %C = 10^1
    model = svmtrain(train_Y_6000,train_X_6000,'-t 2 -g 10 -c 0.1 scale=false');
    [~, accuracy, ~] = svmpredict(Y_valid,X_valid, model,'scale=false');
    Eval(2,1) = (100-accuracy(1,1))/100;

    %C = 10^2
    model = svmtrain(train_Y_6000,train_X_6000,'-t 2 -g 100 -c 0.1 scale=false');
    [~, accuracy, ~] = svmpredict(Y_valid,X_valid, model,'scale=false');
    Eval(3,1) = (100-accuracy(1,1))/100;

    %C = 10^3
    model = svmtrain(train_Y_6000,train_X_6000,'-t 2 -g 1000 -c 0.1 scale=false');
    [~, accuracy, ~] = svmpredict(Y_valid,X_valid, model,'scale=false');
    Eval(4,1) = (100-accuracy(1,1))/100;

    %C = 10^4
    model = svmtrain(train_Y_6000,train_X_6000,'-t 2 -g 10000 -c 0.1 scale=false');
    [~, accuracy, ~] = svmpredict(Y_valid,X_valid, model,'scale=false');
    Eval(5,1) = (100-accuracy(1,1))/100;
    
    %select gamma
    [~, min_index] = min(Eval);
    best_gamma(loop,1) = min_index-1;
end
