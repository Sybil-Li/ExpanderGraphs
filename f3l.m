function [ table ] = f3l(degree)
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

eigR = zeros(1,100);
eigZZ = zeros(1,100);
eigG = zeros(1,100);

for j = 1:4
    Rsize = 10^j;
    C = cyclic(degree);
    eigvalues = eig(C);
    meanC(j) = eigvalues(degree-1);
    eigvalues = eig(C*C);
    meanC2(j) = eigvalues(degree-1);

    for i = 1:50
        R = randRegular(Rsize, degree);
        if (length(R) < 3000)
            eigvalues = eig(R);
            eigR(i) = eigvalues(Rsize-1);
        else
            eigR(i) = powerMethod(R,degree,0.000001);
        end

        zzprod = zigzag(R,C);
        if (length(zzprod) < 3000)
            eigvalues = eig(zzprod);
            eigZZ(i) = eigvalues(Rsize*degree-1);
        else
            eigZZ(i) = powerMethod(zzprod,4,0.000001);
        end
        
        G = randRegular(Rsize*degree, 4);
        if (length(G) < 3000)
            eigvalues = eig(G);
            eigG(i) = eigvalues(Rsize*degree-1);
        else
            eigG(i) = powerMethod(G,4,0.000001);
        end
            
            
    end
    meanR(j) = mean(eigR);
    meanZZ(j) = mean(eigZZ);
    meanG(j) = mean(eigG);
end

x = 1:4;
figure
plot(x,meanR,'-o', x,meanZZ,'-*', x,meanG, '-x')
legend('eigR','eigZZ', 'eigG');

table = zeros((Rsize/10),5);
table(:,1) = meanR;
table(:,2) = meanC;
table(:,3) = meanC2;
table(:,4) = meanZZ;
table(:,5) = meanG;