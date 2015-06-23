function [ table ] = Y3cyclic(Rsize)
% X is random |Y|-regular
% Y is random 3-regular

eigR = zeros(1,100);
eigY2 = zeros(1,100);
eigZZ = zeros(1,100);
eigG = zeros(1,100);

for j = 1:(Rsize/10)
    degree = j*10;
    count = 0;
    
    for i = 1:100
        R = randRegular(Rsize, degree);
        eigvalues = eig(R);
        eigR(i) = eigvalues(Rsize-1);

        Y = cyclic3(degree, 3);
        eigvalues = eig(Y*Y);
        eigY2(i) = eigvalues(degree-1);
        
        zzprod = zigzag(R,Y);
        eigvalues = eig(zzprod);
        eigZZ(i) = eigvalues(Rsize*degree-1);
        if (eigZZ(i) < 2*sqrt(9-1))
           count = count+1;
        end
        
        G = randRegular(Rsize*degree, 9);
        eigvalues = eig(G);
        eigG(i) = eigvalues(Rsize*degree-1);        
            
    end
    meanX(j) = mean(eigR);
    meanY2(j) = mean(eigY2);
    meanZZ(j) = mean(eigZZ);
    meanG(j) = mean(eigG);
    
    meanXnorm(j) = mean(eigR)/degree;
    meanY2norm(j) = mean(eigY2)/9;
    meanZZnorm(j) = mean(eigZZ)/9;
    meanGnorm(j) = mean(eigG)/9;
    
    ramanujan(j) = count/100;
end

table = zeros((Rsize/10),9);
table(:,1) = meanX;
table(:,2) = meanXnorm;
table(:,3) = meanY2;
table(:,4) = meanY2norm;
table(:,5) = meanZZ;
table(:,6) = meanZZnorm;
table(:,7) = meanG;
table(:,8) = meanGnorm;
table(:,9) = ramanujan;

x = 1:(Rsize/10);
figure
plot(x, meanXnorm ,'-o', x,meanY2norm,'-x', x,meanZZnorm,'-*', x,meanGnorm, '-ro')
legend('eigX','eigY^2','eigZZ', 'eigG');

end