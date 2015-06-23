function [ table ] = testc1()
%testing quality of product built from construction1 and C3

eigZZ = zeros(1,1);
eigG = zeros(1,1);
meanZZ = zeros(100,1);
meanG = zeros(100,1);

for i = 1:100
    size = i*4;
    X = construct1(size);
    Y = cyclic(3);
    
    for j = 1:1
        ZZ = zigzag(X,Y);
        eigvalues = eig(ZZ);
        eigZZ(j) = eigvalues(size*3-1);
        
        G = randRegular(size*3, 4);
        eigvalues = eig(G);
        eigG(j) = eigvalues(size*3-1);
    end
    
    meanZZ(i) = mean(eigZZ);
    meanG(i) = mean(eigG);
end

table = zeros(100,3);
table(:,1) = meanZZ;
table(:,2) = meanG;
table(:,3) = meanZZ - meanG;

x = 1:100;
figure
plot(x,meanZZ,'-o', x,meanG,'-x');
end

