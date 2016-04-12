function [parentNode, leftNode, rightNode] = branching(parentNode)

X = parentNode.X;
Y = parentNode.Y;

[N,x] = size(X);
ss = [-1,1];
sorted_X = sort(X);
thetas = create_threshold(sorted_X);
gini = Inf;

right_X = [];
right_Y = [];
left_X = [];
left_Y = [];

for i = 1:x
    for s = ss
        for theta = transpose(thetas(:,i))
            
            left_X_tmp = [];
            left_Y_tmp = [];
            right_X_tmp = [];
            right_Y_tmp = [];
            right_N = 0;
            left_N = 0;
            for n = 1:N
                gt = s * sign(X(n,i)-theta);
                if  gt == 1;
                    right_X_tmp = [right_X_tmp;X(n,:)];
                    right_Y_tmp = [right_Y_tmp;Y(n,1)];    
                    right_N = right_N +1;
                else
                    left_X_tmp = [left_X_tmp;X(n,:)];
                    left_Y_tmp = [left_Y_tmp;Y(n,1)];
                    left_N = left_N +1;
                end
            end
            
            gini_tmp = WeightedGiniIndex(right_Y_tmp,left_Y_tmp,right_N,left_N,N);

            if (gini_tmp <= gini)
                gini = gini_tmp;
                parentNode.i = i;
                parentNode.s = s;
                parentNode.theta = theta;
                right_X = right_X_tmp;
                right_Y = right_Y_tmp;
                left_X = left_X_tmp;
                left_Y = left_Y_tmp;
                
            end
        end
    end
end

if gini == 0
    parentNode.terminate = true;
    leftNode = [];
    rightNode = [];
    parentNode.left_label = Labeling(left_Y);
    parentNode.right_label = Labeling(right_Y);
else
    leftNode = TreeNode();
    leftNode.X = left_X;
    leftNode.Y = left_Y;
    rightNode = TreeNode();
    rightNode.X = right_X;
    rightNode.Y = right_Y;
end
    
end

function label = Labeling(Y)

[n,~] = size(Y);
N_n = 0;
N_p = 0;
for i = 1:n
    if(Y(i)==1)
        N_p = N_p + 1;
    else
        N_n = N_n + 1;
    end
end

if N_p > N_n
    label = 1;
else
    label = -1;
end

end

function [gini] = WeightedGiniIndex(right_Y,left_Y,right_N,left_N,N)

gini = 0;

right_Ein = 0;
left_Ein = 0;

for i = 1:right_N
    if(right_Y(i)~=1)
        right_Ein = right_Ein + 1;
    end
end
if right_N ~=0
    right_Ein = right_Ein / right_N;
end

for i = 1:left_N
    if(left_Y(i)==1)
        left_Ein = left_Ein + 1;
    end
end
if left_N ~= 0
    left_Ein = left_Ein / left_N;
end

gini = right_N/(N) * (1 - right_Ein^2 - (1-right_Ein)^2) + left_N/(N) * (1 - left_Ein^2 - (1-left_Ein)^2);


end

function[thetas] = create_threshold(X)
    [m,n] = size(X);
    thetas = zeros(m,n);
    for l = 1:n
        thetas(:,l) = (-1)*Inf(m,1);
        for k = 1:m-1
            thetas(k+1,l) = (X(k,l)+X(k+1,l))/2;
        end
    end
end