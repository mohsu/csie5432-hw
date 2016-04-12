train_X = load('features.train');
train_Y = train_X(:,1);
train_X = train_X(:,2:end);

%%%%%%%18%%%%%%%%%
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
margin = zeros(5,1);
%C = 10^-3
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 0.001 scale=false');
margin(1,1) = 1/sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^-2
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 0.01 scale=false');
margin(2,1) = 1/sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^-1
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 0.1 scale=false');
margin(3,1) = 1/sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^0
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 1 scale=false');
margin(4,1) = 1/sqrt(transpose(model.sv_coef)*model.sv_coef);

%C = 10^1
model = svmtrain(train_Y_binary,train_X,'-t 2 -g 100 -c 10 scale=false');
margin(5,1) = 1/sqrt(transpose(model.sv_coef)*model.sv_coef);

