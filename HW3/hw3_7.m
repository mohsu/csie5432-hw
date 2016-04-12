u = 0;
v = 0;

for i = 1: 5

    [Eu, Ev] = E(u,v);
    [inverse] = E1(u,v);
    A = [u;v];
    A = A - inverse* [Eu;Ev];
    
    u = A(1,1);
    v = A(2,1);
    
end


E0 = exp(u) + exp(2*v) + exp(u*v) + u^2 - 2*u*v + 2*v^2 - 3*u -2*v;