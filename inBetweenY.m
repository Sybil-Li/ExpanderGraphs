function [ table ] = f1(Rsize, mode)
% Use Y of degree sqrt(n) or log(n) with X of increasing degree
% mode 1: sqrt
% mode 2: log

eigX = zeros(1,50);
eigY2 = zeros(1,50);
eigZZ = zeros(1,50);
eigG = zeros(1,50);

for j = 1:(Rsize/10)
    degree = j*10 + 1;
    if (mode == 1)
        dY = ceil(sqrt(degree));
    else
        dY = ceil(log(degree));
    end

    for i = 1:50
        X = randRegular(Rsize, degree);
        eigvalues = eig(X);
        eigX(i) = eigvalues(Rsize-1);

        Y = randRegular(degree, dY);
        eigvalues = eig(Y*Y);
        eigY2(i) = eigvalues(degree-1);
        
        zzprod = zigzag(X,Y);
        eigvalues = eig(zzprod);
        eigZZ(i) = eigvalues(Rsize*degree-1);
        
        G = randRegular(Rsize*degree, dY*dY);
        eigvalues = eig(G);
        eigG(i) = eigvalues(Rsize*degree-1);
  
    end
    meanX(j) = mean(eigX);
    meanXnorm(j) = meanX(j)/degree;
    meanY2(j) = mean(eigY2);
    meanY2norm(j) = meanY2(j)/(dY*dY);
    meanZZ(j) = mean(eigZZ);
    meanZZnorm(j) = meanZZ(j)/(dY*dY);
    meanG(j) = mean(eigG);
    meanGnorm(j) = meanG(j)/(dY*dY);
end

table = zeros((Rsize/10),8);
table(:,1) = meanX;
table(:,2) = meanXnorm;
table(:,3) = meanY2;
table(:,4) = meanY2norm;
table(:,5) = meanZZ;
table(:,6) = meanZZnorm;
table(:,7) = meanG;
table(:,8) = meanGnorm;

x = 1:(Rsize/10);
figure
plot(x, meanXnorm ,'-o', x,meanY2norm,'-x', x,meanZZnorm,'-*', x,meanGnorm, '-ro')
legend('eigX','eigY^2','eigZZ', 'eigG');
end