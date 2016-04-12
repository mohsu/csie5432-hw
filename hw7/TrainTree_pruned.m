function [ parentTree ] = TrainTree_pruned(parentTree)
        
   [parentTree.parentNode, leftNode, rightNode] = branching_pruned(parentTree.parentNode);
   
   if ~parentTree.parentNode.terminate
        leftSubtree = Tree();
        leftSubtree.parentNode = leftNode;
        leftSubtree = TrainTree_pruned(leftSubtree);
        parentTree.leftTree = leftSubtree;
        
        rightSubtree = Tree();
        rightSubtree.parentNode = rightNode;
        rightSubtree = TrainTree_pruned(rightSubtree);
        parentTree.rightTree = rightSubtree;
    end
    
end

