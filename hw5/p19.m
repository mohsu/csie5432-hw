train_X = load('features.train');
train_Y = train_X(:,1);
train_X = train_X(:,2:end);

test_X = load('features.test');
test_Y = test_X(:,1);
test_X = test_X(:,2:end);

%%%%%%%19%%%%%%%%%
i = 0;

%convert to binary labels
train_Y_binary = zeros(length(train_Y),1);
test_Y_binary = zeros(length(test_Y),1);
for k = 1:length(train_Y)
    if train_Y(k,1) ~= i
        train_Y_binary(k,1) = -1;
    else
        train_Y_binary(k,1) = 1;
    end
end
for k = 1:length(test_Y)
    if test_Y(k,1) ~=i
        test_Y_binary(k,1) = -1;
    else
        test_Y_binary(k,1) = 1;
    end
end
Eouts = zeros(5,1);
%C = 10^0
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 1 -c 0.1 scale=false');
[~, accuracy, ~] = svmpredict(test_Y_binary,test_X, model,'scale=false');
Eouts(1,1) = (100-accuracy(1,1))/100;

%C = 10^1
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 10 -c 0.1 scale=false');
[~, accuracy, ~] = svmpredict(test_Y_binary,test_X, model,'scale=false');
Eouts(2,1) = (100-accuracy(1,1))/100;

%C = 10^2
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 0.1 scale=false');
[~, accuracy, ~] = svmpredict(test_Y_binary,test_X, model,'scale=false');
Eouts(3,1) = (100-accuracy(1,1))/100;

%C = 10^3
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 1000 -c 0.1 scale=false');
[~, accuracy, ~] = svmpredict(test_Y_binary,test_X, model,'scale=false');
Eouts(4,1) = (100-accuracy(1,1))/100;


%C = 10^4
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 10000 -c 0.1 scale=false');
[~, accuracy, ~] = svmpredict(test_Y_binary,test_X, model,'scale=false');
Eouts(5,1) = (100-accuracy(1,1))/100;

