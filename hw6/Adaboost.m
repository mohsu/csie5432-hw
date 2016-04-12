function [ record_ds, alphas, G , Eins_u, Eins_g, Eins_G, U] = Adaboost( X , Y)
T = 300;
[m,n] = size(X);
u = ones(m,1)*(1/m);
alphas = zeros(T,1);
g_t = zeros(m,T); %[g(x)]
Eins_g = zeros(T,1);
Eins_G = zeros(T,1);
Eins_u = zeros(T,1);
G = zeros(m,1);
U = zeros(T,1);
record_ds = zeros(T,3); %[s, i ,theta]
for t = 1:T
    
    U(t,1) = sum(u);
    
    [record_ds(t,1), record_ds(t,2), record_ds(t,3), g_t(:,t), Eins_u(t,1), Eins_g(t,1)] = decision_stump(X , Y , u);
    delta = sqrt((1-Eins_u(t,1))/Eins_u(t,1));
    update_u(g_t(:,t),delta);
    alphas(t,1) = log(delta);
    
    for mm = 1:m
        G(mm,1) = G(mm,1) + alphas(t,1)*g_t(mm,t);
        if sign(G(mm,1)) ~= Y(mm,1)
            Eins_G(t,1) = Eins_G(t,1) + 1;
        end
    end
    Eins_G(t,1) = Eins_G(t,1) / m;
    
end

    function update_u(g, delta)
        for k = 1:m
            if(g(k,1) ~= Y(k,1))
                u(k,1) = u(k,1) * delta;
            else
                u(k,1) = u(k,1) / delta;
            end
        end
    end

end

