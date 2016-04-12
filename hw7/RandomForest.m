function [ trees ] = RandomForest( X, Y )

T = 300;
trees = [];
[N,x] = size(X);
sample_index = randi([1,N],N,T);
X_bag = zeros(N,x);

for t = 1:T
    
    for n = 1:N
        X_bag(n,:) = X(sample_index(n,t),:);
        Y_bag(n,:) = Y(sample_index(n,t),:);
    end
    
    DT = Tree();
    parentNode = TreeNode();
    parentNode.X = X_bag;
    parentNode.Y = Y_bag;
    DT.parentNode = parentNode;
    DT = TrainTree(DT);
    trees = [trees; DT];
    
end

end

