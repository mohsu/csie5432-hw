function errorRate = PLA_19(xTrain , yTrain, xTest, yTest)

%   Initialize
[rowsTrain,colsTrain] = size(xTrain);
[rowsTest,colsTest] = size(xTest);

w = zeros(1,colsTrain); %w0,w1,w2,w3,w4
Iteration = 0;
Change = false;
%last_mistake_index = 0;
%random_list = randi(rowsTrain, rowsTrain, 1);
errorRate = 1;
%PLA

while Iteration < 50
    
    i = randi(rowsTrain);
    if sign(dot(w,xTrain(i,:))) ~= yTrain(i,1)
       w_tmp = w + yTrain(i,1)*xTrain(i,:);
       %errorRate_tmp = Evaluate(w_tmp);
       %if  errorRate_tmp < errorRate
           %errorRate = errorRate_tmp;
           w = w_tmp;
           Change = true;
           %last_mistake_index = i; 
       %end
       Iteration = Iteration + 1;
    end
end
errorRate = Evaluate(w);

%fprintf('number of updates: %d \n',Iteration);  
%fprintf('index of example of the last mistake: %d', last_mistake_index);  

    function errorRate = Evaluate(w)
    Error = 0;  

    % test the data  
    for j = 1 : rowsTest
        if sign( dot(w, xTest(j,:) )) ~= yTest(j,1) 
            Error = Error + 1;  
        end  
    end  
    errorRate = Error / rowsTest; 
    end

end

