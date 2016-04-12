function [ predicts ] = TestTree( DT, X, Y )

[N,~] = size(X);
predicts = zeros(N,1);

for n = 1:N
    parentNode = DT.parentNode;
    currentTree = DT;
    while ~parentNode.terminate
        i = parentNode.i;
        s = parentNode.s;
        theta = parentNode.theta;
        gt = s * sign(X(n,i) - theta);
        if gt == -1
            currentTree = currentTree.leftTree;
        else
            currentTree = currentTree.rightTree;
        end
        parentNode = currentTree.parentNode;
    end
    
    i = parentNode.i;
    s = parentNode.s;
    theta = parentNode.theta;
    gt = s * sign(X(n,i) - theta);
    if gt==-1
        predicts(n) = parentNode.left_label;
    else
        predicts(n) = parentNode.right_label;
    end
end

end

