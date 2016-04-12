tmp = dlmread('hw1_18_train.dat');
xTrain = tmp(:,1:4);
[rowsTrain,colsTrain] = size(xTrain);
xTrain = [ones(rowsTrain,1), xTrain];
yTrain = tmp(:, 5);

tmp = dlmread('hw1_18_test.dat');
xTest = tmp(:,1:4);
[rowsTest,colsTest] = size(xTest);
xTest = [ones(rowsTest,1), xTest];
yTest = tmp(:, 5);

iterationNum = 2000;
sum = 0;
errorRates = zeros(iterationNum,1);
for i = 1:iterationNum
    errorRate = PLA_19(xTrain,yTrain,xTest,yTest);
    sum = sum + errorRate;
    errorRates(i,1) = errorRate;
end
average = sum / iterationNum;
disp(average);
histogram(errorRates);