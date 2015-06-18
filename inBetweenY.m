function [ table ] = f1(Rsize, mode)
% Use Y of degree sqrt(n) or log(n) with X of increasing degree
% mode 1: sqrt
% mode 2: log

eigX = zeros(1,100);
eigY2 = zeros(1,100);
eigZZ = zeros(1,100);
eigG = zeros(1,100);

for j = 1:(Rsize/10)
    degree = j*10 + 1;
    if (mode == 1)
        dY = ceil(sqrt(degree));
    else
        dY = ceil(log(degree));
    end

    for i = 1:100
        X = randRegular(Rsize, degree);
        eigvalues = eig(X);
        eigR(i) = eigvalues(Rsize-1);

        Y = randRegular(degree, dY);
        eigvalues = eig(Y*Y);
        eigR(i) = eigvalues(degree-1);
        
        zzprod = zigzag(X,Y);
        eigvalues = eig(zzprod);
        eigZZ(i) = eigvalues(Rsize*degree-1);

        
        G = randRegular(Rsize*degree, 4);
        eigvalues = eig(G);
        eigG(i) = eigvalues(Rsize*degree-1);
  
    end
    meanX(j) = mean(eigX);
    meanY2(j) = mean(eigY2);
    meanZZ(j) = mean(eigZZ);
    meanG(j) = mean(eigG);
end

table = zeros((Rsize/10),4);
table(:,1) = meanX;
table(:,2) = meanY2;
table(:,3) = meanZZ;
table(:,4) = meanG;

x = 1:(Rsize/10);
figure
plot(x, meanX ,'-o', x,meanY2,'-x', x,meanZZ,'-*', x,meanG, '-ro')
legend('eigX','eigY^2','eigZZ', 'eigG');


end