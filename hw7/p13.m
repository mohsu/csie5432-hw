X_train = load('hw3_train.dat');
Y_train = X_train(:,end);
X_train = X_train(:,1:end-1);

X_test = load('hw3_test.dat');
Y_test = X_test(:,end);
X_test = X_test(:,1:end-1);
DT = Tree();
parentNode = TreeNode();
parentNode.X = X_train;
parentNode.Y = Y_train;
DT.parentNode = parentNode;
DT = TrainTree(DT);

gt_train = TestTree(DT, X_train,Y_train);
Ein = TestEout(gt_train,Y_train);
gt_test = TestTree(DT, X_test, Y_test);
Eout = TestEout(gt_test,Y_test);