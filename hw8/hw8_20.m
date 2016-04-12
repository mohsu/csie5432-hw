data = load('hw8_nolabel_train.dat');
[m, n] = size(data);

k = [2,4,6,8,10];
Ein = zeros(5,500);
averageEin = zeros(5,1);

for tk = 1:5 
    for i = 1:500
        centers = -1+2*rand(k(tk),n);
        norm_data_ceters = zeros(m, k(tk));
        minnorm = Inf;
        for jj=1:500
            tempnorm = 0;
            tempcenters = zeros(k(tk),n);
            cluster_set = zeros(k(tk), m);
            for j=1:k(tk)
                for l =1:m
                     norm_data_ceters(l,j) = norm(data(l,:)-centers(j,:))^2;
                end
            end
            for l =1:m
               [M,I] = min(norm_data_ceters(l,:));
               cluster_set(I,l) = 1;
               tempnorm = tempnorm + M;
            end
            for j=1:k(tk)
                count = 0;
                 for l =1:m
                     if cluster_set(j,l)==1
                        count = count +1;
                        for p =1:n
                            tempcenters(j,p) = tempcenters(j,p) + data(l,p);
                        end
                     end
                 end
                 tempcenters(j,:) = tempcenters(j,:)/count;
                 centers(j,:) = tempcenters(j,:);
            end
            if tempnorm < minnorm
                minnorm = tempnorm;
            end
        end
        Ein(tk,i) = minnorm/m;
    end
end

for j =1:5
    for i =1:500
        averageEin(j,1) = averageEin(j,1) +Ein(j,i);
    end
end
averageEin =averageEin/500;