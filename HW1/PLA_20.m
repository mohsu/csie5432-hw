function errorRate = PLA_20(xTrain , yTrain, xTest, yTest)

%   Initialize
[rowsTrain,colsTrain] = size(xTrain);
[rowsTest,colsTest] = size(xTest);

w = zeros(1,colsTrain); %w0,w1,w2,w3,w4
w_best = w;
Iteration = 0;
%last_mistake_index = 0;
%random_list = randi(rowsTrain, rowsTrain, 1);
errorRate = 1;
%PLA

while Iteration < 50
    
    i = randi(rowsTrain);
    if sign(dot(w,xTrain(i,:))) ~= yTrain(i,1)
       w_tmp = w + yTrain(i,1)*xTrain(i,:);
       errorRate_tmp = Evaluate_train(w_tmp);
       if  errorRate_tmp < errorRate
           errorRate = errorRate_tmp;
           w_best = w_tmp;
       end
       w = w_tmp;
       Iteration = Iteration + 1;
    end
end

w = w_best; 

    function errorRate = Evaluate_test(w)
    Error = 0;  

    % test the data  
    for j = 1 : rowsTest
        if sign( dot(w, xTest(j,:) )) ~= yTest(j,1) 
            Error = Error + 1;  
        end  
    end  
    errorRate = Error / rowsTest; 
    end

    function errorRate = Evaluate_train(w)
    Error = 0;  

    % test the data  
    for j = 1 : rowsTrain
        if sign( dot(w, xTrain(j,:) )) ~= yTrain(j,1) 
            Error = Error + 1;  
        end  
    end  
    errorRate = Error / rowsTrain; 
    end

errorRate = Evaluate_test(w);
end