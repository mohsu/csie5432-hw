train_X = load('features.train');
train_Y = train_X(:,1);
train_X = train_X(:,2:end);

%%%%%%%15%%%%%%%%%
i = 0;

%convert to binary labels
train_Y_binary = zeros(length(train_Y):1);
for k = 1:length(train_Y)
    if train_Y(k,1) ~= i
        train_Y_binary(k,1) = -1;
    else
        train_Y_binary(k,1) = 1;
    end
end
ws = zeros(5,1);
%C = 10^-6
model = svmtrain(train_Y_binary,train_X,'-t 0 -c 0.000001 scale=false');
ws(1,1) = sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^-4
model = svmtrain(train_Y_binary,train_X,'-t 0 -c 0.0001 scale=false');
ws(2,1) = sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^-2
model = svmtrain(train_Y_binary,train_X,'-t 0 -c 0.01 scale=false');
ws(3,1) = sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^0
model = svmtrain(train_Y_binary,train_X,'-t 0 -c 1 scale=false');
ws(4,1) = sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^2
model = svmtrain(train_Y_binary,train_X,'-t 0 -c 100 scale=false');
ws(5,1) = sqrt(transpose(model.sv_coef)*model.sv_coef);

