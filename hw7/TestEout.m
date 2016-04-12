function Eout = TestEout(gt, Y)
N = size(Y,1);
Eout = 0;
for n = 1:N
    if sign(gt(n)) ~= Y(n)
        Eout = Eout + 1;
    end
end
Eout = Eout/N;
end