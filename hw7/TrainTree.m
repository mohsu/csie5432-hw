function [ parentTree ] = TrainTree(parentTree)
        
   [parentTree.parentNode, leftNode, rightNode] = branching(parentTree.parentNode);
   
   if ~parentTree.parentNode.terminate
        leftSubtree = Tree();
        leftSubtree.parentNode = leftNode;
        leftSubtree = TrainTree(leftSubtree);
        parentTree.leftTree = leftSubtree;
        
        rightSubtree = Tree();
        rightSubtree.parentNode = rightNode;
        rightSubtree = TrainTree(rightSubtree);
        parentTree.rightTree = rightSubtree;
    end
    
end

