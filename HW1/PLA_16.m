function totalIteration = PLA_16(  )
%UNTITLED Summary of this function goes here
%   Initialize
tmp = dlmread('hw1_15_train.dat');
x = tmp(:,1:4);
x = [ones(400,1), x];
[rows,cols] = size(x);
y = tmp(:, 5);
w = zeros(1,cols); %w0,w1,w2,w3,w4
totalIteration = 0;
Change = false;
last_mistake_index = 0;
random_list = randi(rows, rows, 1);
success = 0;
%PLA

% for k = 1:rows
%     i = random_list(k,1);
%     if sign(dot(w,x(i,:))) ~= y(i,1)
%        w = w + y(i,1)*x(i,:);
%        Change = true;
%        Iteration = Iteration + 1;
%        last_mistake_index = i;
%      end
%      if ~Change
%        break;
%      end
% end

k = 1;
while success <= rows
    i = random_list(k,1);
    if sign(dot(w,x(i,:))) == y(i,1)
        success = success + 1;
    elseif sign(dot(w,x(i,:))) ~= y(i,1)
       w = w + y(i,1)*x(i,:);
       totalIteration = totalIteration + 1;
       last_mistake_index = i;
       success = 0;
    end
    k = k+1;
    if k > 400
        k = 1;
    end
end
%fprintf('number of updates: %d \n',Iteration);  
%fprintf('index of example of the last mistake: %d', last_mistake_index);  


end
