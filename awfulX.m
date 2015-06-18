function [ table ] = awfulX(Rsize)
% Derivative experiment
% Varying quality of X to see effects of X on zigzag product

for j = 1:(Rsize/10+1)
    C = cyclic(Rsize+1);
    eigvalues = eig(C);
    meanC(j) = eigvalues(Rsize-1);
    eigvalues = eig(C*C);
    meanC2(j) = eigvalues(Rsize-1);
    
    X = randRegular(Rsize, 10*(j-1))+(Rsize+1-10*(j-1))*eye(Rsize);
    eigvalues = eig(X);
    meanX(j) = eigvalues(Rsize-1);

    zzprod = zigzag(X,C);
    eigvalues = eig(zzprod);
    meanZZ(j) = eigvalues(Rsize*(Rsize+1)-1);

    G = randRegular(Rsize*(Rsize+1), 4);
    eigvalues = eig(G);
    meanG(j) = eigvalues(Rsize*(Rsize+1)-1);
end

table = zeros((Rsize/10+1),5);
table(:,1) = meanX;
table(:,2) = meanC;
table(:,3) = meanC2;
table(:,4) = meanZZ;
table(:,5) = meanG;

x = 1:(Rsize/10+1);
figure
plot(x, meanX, '-o', x, meanC, '-.', x,meanC2,'-x', x,meanZZ,'-*', x,meanG, '-ro')
legend('eigX', 'eigC','eigC^2','eigZZ', 'eigG');



end