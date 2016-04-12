function value = kernel(x1,x2,gamma) % x1 : 1*10
        [~,n] = size(x1);
        length_square = 0;
        for i = 1:n
            length_square = length_square + (x1(1,i) - x2(1,i))^2;
        end
        value = exp(-1 * gamma * length_square);
end
