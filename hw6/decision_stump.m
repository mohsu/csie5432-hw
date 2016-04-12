function [s, i ,theta, g, Ein_u, Ein] = decision_stump( X, Y, u)

[m,n] = size(X);

sorted_X = sort(X);

thetas = create_threshold(sorted_X);

Ein_u = Inf;

for l = 1:m
    for x = 1:n
         for s_tmp = [-1,1]
              [tmp_Ein, tmp_Ein_u, tmp_g] = testEin(X(:,x), s_tmp, thetas(l,x));
                if(tmp_Ein_u < Ein_u)
                    s = s_tmp;
                    i = x;
                    theta = thetas(l,x);
                    g = tmp_g;
                    Ein_u = tmp_Ein_u;
                    Ein = tmp_Ein;
               end
         end
    end
end

    function[thetas] = create_threshold(X)
        thetas = zeros(m,n);
        for l = 1:n
            thetas(:,l) = (-1)*Inf(m,1);
            for k = 1:m-1
                thetas(k+1,l) = (X(k,l)+X(k+1,l))/2;
            end
        end
    end

    function [Ein, weighted_Ein, g] = testEin(X, s, theta)
        weighted_Ein = 0;
        Ein = 0;
        g = zeros(m,1);
        for k = 1:m
            g(k,1) = s * sign( X(k,1) - theta);
            if(g(k,1) ~= Y(k,1))
                weighted_Ein = weighted_Ein + 1 * u(k,1);
                Ein = Ein + 1;
            end
        end
        weighted_Ein = weighted_Ein / sum(u);
        Ein = Ein / m;
    end
end


