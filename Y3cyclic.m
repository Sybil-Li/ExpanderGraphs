function [ table ] = Y3cyclic(Rsize)
% X is random |Y|-regular
% Y is 3-regular cyclic

samplesize = 100;

eigRlamda = zeros(1,samplesize);
eigRlamda1 = zeros(1,samplesize);

eigY2lamda = zeros(1,samplesize);
eigY2lamda1 = zeros(1,samplesize);

eigZZlamda = zeros(1,samplesize);
eigZZlamda1 = zeros(1,samplesize);

eigGlamda = zeros(1,samplesize);
eigGlamda1 = zeros(1,samplesize);


for j = 1:(Rsize/10)
    degree = j*10;
    count = 0;
    Rcount = 0;
    Ycount = 0;
    Gcount = 0;
    
    for i = 1:samplesize
        Rcount = Rcount + 1;
        R = randRegular(Rsize, degree);
        eigvalues = eig(R);
        while (eigvalues(Rsize)-eigvalues(Rsize-1) < 10^(-8))
            Rcount = Rcount + 1;
            R = randRegular(Rsize, degree);
            eigvalues = eig(R);
        end
        eigRlamda1(i) = eigvalues(Rsize-1);
        eigRlamda(i) = max(eigRlamda1(i), abs(eigvalues(1)));

        Ycount = Ycount + 1;
        Y = cyclic3(degree);
        eigvalues = eig(Y*Y);
        eigY2lamda1(i) = eigvalues(degree-1);
        eigY2lamda(i) = max(eigY2lamda1(i), abs(eigvalues(1)));

        zzprod = zigzag(R,Y);
        eigvalues = eig(zzprod);
        eigZZlamda1(i) = eigvalues(Rsize*degree-1);
        eigZZlamda(i) = max(eigZZlamda1(i), abs(eigvalues(1)));
        if (eigZZlamda(i) < 2*sqrt(9-1))
           count = count+1;
        end

        Gcount = Gcount + 1;
        G = randRegular(Rsize*degree, 9);
        eigvalues = eig(G);
        while (eigvalues(Rsize*degree)-eigvalues(Rsize*degree-1) < 10^(-8))
            Gcount = Gcount + 1;
            G = randRegular(Rsize*degree, 9);
            eigvalues = eig(G);
        end
        eigGlamda1(i) = eigvalues(Rsize*degree-1);
        eigGlamda(i) = max(eigGlamda1(i), abs(eigvalues(1)));
            
    end
    meanXlamda(j) = mean(eigRlamda);
    meanXlamda1(j) = mean(eigRlamda1);
    meanY2lamda(j) = mean(eigY2lamda);
    meanY2lamda1(j) = mean(eigY2lamda1);
    meanZZlamda(j) = mean(eigZZlamda);
    meanZZlamda1(j) = mean(eigZZlamda1);
    meanGlamda(j) = mean(eigGlamda);
    meanGlamda1(j) = mean(eigGlamda1);
    
    countX(i) = Rcount;
    countY(i) = Ycount;
    countG(i) = Gcount;
    ramanujan(j) = count/100;
end

meanXlamdanorm = meanXlamda/degree;
meanXlamda1norm = meanXlamda1/degree;
meanY2lamdanorm = meanY2lamda/9;
meanY2lamda1norm = meanY2lamda1/9;
meanZZlamdanorm = meanZZlamda/9;
meanZZlamda1norm = meanZZlamda1/9;
meanGlamdanorm = meanGlamda/9;
meanGlamda1norm = meanGlamda1/9;

table = zeros((Rsize/10),20);
table(:,1) = countX;
table(:,2) = meanXlamda;
table(:,3) = meanXlamda1;
table(:,4) = meanXlamdanorm;
table(:,5) = meanXlamda1norm;
table(:,6) = countY;
table(:,7) = meanY2lamda;
table(:,8) = meanY2lamda1;
table(:,9) = meanY2lamdanorm;
table(:,10) = meanY2lamda1norm;
table(:,11) = ramanujan;
table(:,12) = meanZZlamda;
table(:,13) = meanZZlamda1;
table(:,14) = meanZZlamdanorm;
table(:,15) = meanZZlamda1norm;
table(:,16) = countG;
table(:,17) = meanGlamda;
table(:,18) = meanGlamda1;
table(:,19) = meanGlamdanorm;
table(:,20) = meanGlamda1norm;

% x = 1:(Rsize/10);
% figure
% plot(x, meanXnorm ,'-o', x,meanY2norm,'-x', x,meanZZnorm,'-*', x,meanGnorm, '-ro')
% legend('eigX','eigY^2','eigZZ', 'eigG');

end