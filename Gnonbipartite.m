function [ table ] = Gnonbipartite(Rsize)

samplesize = 100;

eigGlamda = zeros(1,samplesize);
eigGlamda1 = zeros(1,samplesize);


for j = 1:(Rsize/10)
    degree = j*10;
% number of ramanujan
    count = 0;
% number of G that we have to generate to ensure connectedness
    Gcount = 0;
    
    for i = 1:samplesize
        Gcount = Gcount + 1;
        G = randRegularXiaoModified(Rsize*degree, 9);
        eigvalues = eig(G);
        % if (eig(size-1)==d) then graph is disconnected, regenerate graph
        while (eigvalues(Rsize*degree)-eigvalues(Rsize*degree-1) < 10^(-8))
            Gcount = Gcount + 1;
            G = randRegularXiaoModified(Rsize*degree, 9);
            eigvalues = eig(G);
        end
        eigGlamda1(i) = eigvalues(Rsize*degree-1);
        eigGlamda(i) = max(eigGlamda1(i), abs(eigvalues(1)));
        
        if (eigGlamda(i) < 2*sqrt(9-1))
           count = count+1;
        end
            
    end
    meanGlamda(j) = mean(eigGlamda);
    meanGlamda1(j) = mean(eigGlamda1);
        
    countG(j) = Gcount;
    ramanujan(j) = count/100;
end

meanGlamdanorm = meanGlamda/9;
meanGlamda1norm = meanGlamda1/9;

table = zeros((Rsize/10),6);
table(:,1) = countG;
table(:,2) = meanGlamda;
table(:,3) = meanGlamda1;
table(:,4) = meanGlamdanorm;
table(:,5) = meanGlamda1norm;
table(:,6) = ramanujan;


end