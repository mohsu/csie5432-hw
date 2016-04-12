train_X = load('features.train');
train_Y = train_X(:,1);
train_X = train_X(:,2:end);

%%%%%%%16%%%%%%%%%
i = 8;

%convert to binary labels
train_Y_binary = zeros(length(train_Y):1);
for k = 1:length(train_Y)
    if train_Y(k,1) ~= i
        train_Y_binary(k,1) = -1;
    else
        train_Y_binary(k,1) = 1;
    end
end

Eins = zeros(5,1);
sum_alphas = zeros(5,1);

%C = 10^-6
model = svmtrain(train_Y_binary,train_X,'-t 1 -c 0.000001 -d 2 -g 1 -r 1 scale=false');
sum_alphas(1,1) = sum(abs(model.sv_coef));
[~, accuracy, ~] = svmpredict(train_Y_binary,train_X, model,'scale=false');
Eins(1,1) = (100 - accuracy(1,1))/100;

model = svmtrain(train_Y_binary,train_X,'-t 1 -c 0.0001 -d 2 -g 1 -r 1 scale=false');
sum_alphas(2,1) = sum(abs(model.sv_coef));
[~, accuracy, ~] = svmpredict(train_Y_binary,train_X,model,'scale=false');
Eins(2,1) = (100 - accuracy(1,1))/100;

%C = 10^-2
model = svmtrain(train_Y_binary,train_X,'-t 1 -c 0.01 -d 2 -g 1 -r 1 scale=false');
sum_alphas(3,1) = sum(abs(model.sv_coef));
[~, accuracy, ~] = svmpredict(train_Y_binary,train_X,model,'scale=false');
Eins(3,1) = (100 - accuracy(1,1))/100;

%C = 10^0
model = svmtrain(train_Y_binary,train_X,'-t 1 -c 1 -d 2 -g 1 -r 1 scale=false');
sum_alphas(4,1) = sum(abs(model.sv_coef));
[~, accuracy, ~] = svmpredict(train_Y_binary,train_X,model,'scale=false');
Eins(4,1) = (100 - accuracy(1,1))/100;

%C = 10^2
model = svmtrain(train_Y_binary,train_X,'-t 1 -c 100 -d 2 -g 1 -r 1 scale=false');
sum_alphas(5,1) = sum(abs(model.sv_coef));
[~, accuracy, ~] = svmpredict(train_Y_binary,train_X,model,'scale=false');
Eins(5,1) = (100 - accuracy(1,1))/100;
