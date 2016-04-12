function [ K ] = create_K( X_1, X_2, gamma)

[n_1,~] = size(X_1); 
[n_2,~] = size(X_2); 
K = zeros(n_1,n_2);

for i = 1:n_1
    for j = 1:n_2
        K(i,j) = kernel(X_1(i,:),X_2(j,:),gamma);
    end
end
    
end

