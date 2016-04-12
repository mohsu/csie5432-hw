function [ y ] = F( x1,x2 )

y = sign(x1^2 + x2^2 -0.6);

if(rand < 0.1)
    y = y * (-1);
end

end

