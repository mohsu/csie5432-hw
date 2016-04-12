function [ inverse ] = E1( u,v )

a = exp(u)+v^2*exp(u*v)+2;
b = exp(u*v)+u*v*exp(u*v)-2;
c = 4*exp(2*v)+u^2*exp(u*v)+4;

inverse = [a,b;b,c]^-1;

end

