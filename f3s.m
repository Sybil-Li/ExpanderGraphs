function [ table ] = f3s(degree)
% X is degree 3 random regular
% |X| = 20, 40, 60, 80, 100
% Y = C3

eigR = zeros(1,100);
eigZZ = zeros(1,100);
eigG = zeros(1,100);

for j = 1:5
    Rsize = j*20;
    C = cyclic(degree);
    eigvalues = eig(C);
    meanC(j) = eigvalues(degree-1);
    eigvalues = eig(C*C);
    meanC2(j) = eigvalues(degree-1);

    for i = 1:50
        R = randRegular(Rsize, degree);
        eigvalues = eig(R);
        eigR(i) = eigvalues(Rsize-1);


        zzprod = zigzag(R,C);
        eigvalues = eig(zzprod);
        eigZZ(i) = eigvalues(Rsize*degree-1);
       
        
        G = randRegular(Rsize*degree, 4);
        eigvalues = eig(G);
        eigG(i) = eigvalues(Rsize*degree-1);
            
    end
    meanR(j) = mean(eigR);
    meanZZ(j) = mean(eigZZ);
    meanG(j) = mean(eigG);
end

x = 1:5;
figure
plot(x,meanR,'-o', x,meanZZ,'-*', x,meanG, '-x')
legend('eigR','eigZZ', 'eigG');

table = zeros(5,5);
table(:,1) = meanR;
table(:,2) = meanC;
table(:,3) = meanC2;
table(:,4) = meanZZ;
table(:,5) = meanG;