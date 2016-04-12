function [Eu,Ev] = E( u,v )

Eu = exp(u) + v*exp(u*v) + 2*u -2*v -3;
Ev = 2*exp(2*v) + u*exp(u*v)-2*u +4*v -2;

end

