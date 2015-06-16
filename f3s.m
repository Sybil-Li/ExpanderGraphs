function [ table ] = f3s(degree)
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

eigR = zeros(1,100);
eigZZ = zeros(1,100);
eigG = zeros(1,100);

for j = 1:10
    Rsize = j*10;
    C = cyclic(degree);
    eigvalues = eig(C);
    meanC(j) = eigvalues(degree-1);
    eigvalues = eig(C*C);
    meanC2(j) = eigvalues(degree-1);

    for i = 1:100
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

x = 1:10;
figure
plot(x,meanR,'-o', x,meanZZ,'-*', x,meanG, '-x')
legend('eigR','eigZZ', 'eigG');

table = zeros((Rsize/10),5);
table(:,1) = meanR;
table(:,2) = meanC;
table(:,3) = meanC2;
table(:,4) = meanZZ;
table(:,5) = meanG;