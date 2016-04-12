classdef TreeNode
    properties
        left_node;
        right_node;
        i = Inf;
        s = Inf;
        theta = Inf;
        X = [];
        Y = [];
        terminate = false;
        left_label;
        right_label;
    end
    methods
        function [left_node,right_node,i,s,theta,X,Y terminate,left_label,right_label] = TreeNode()
        end
    end
end
