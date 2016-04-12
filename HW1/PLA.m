function w = PLA(  )
%UNTITLED Summary of this function goes here
%   Initialize
tmp = dlmread('hw1_15_train.dat');
x = tmp(:,1:4);
x = [ones(400,1), x];
[rows,cols] = size(x);
y = tmp(:, 5);
w = zeros(1,cols); %w0,w1,w2,w3,w4
totalIteration = 0;
success = 0;
last_mistake_index = 0;
%random_list = randi(rows, rows, 1);

%PLA
i = 1;
while success <= rows
    if sign(dot(w,x(i,:))) == sign(y(i,1))
        success = success + 1;
    elseif sign(dot(w,x(i,:))) ~= sign(y(i,1))
       w = w + y(i,1)*x(i,:);
       totalIteration = totalIteration + 1;
       last_mistake_index = i;
       success = 0;
    end
    i = i+1;
    if i > 400
        i = 1;
    end
end
fprintf('number of updates: %d \n',totalIteration);  
fprintf('index of example of the last mistake: %d', last_mistake_index);  


end
