sum = 0;
Iterations = zeros(2000,1);
for i = 1:2000
    Iteration = PLA_16();
    sum = sum + Iteration;
    Iterations(i,1) = Iteration;
end
average = sum / 2000;
disp(average);
histogram(Iterations);