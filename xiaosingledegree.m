function [ eigZZ ] = xiaosingledegree(Rsize, d)
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

eigR = zeros(1,1000);
eigC2 = zeros(1,1000);
eigZZ = zeros(1,1000);

for i = 1:1000
    R = randRegular(Rsize, d);
    eigvalues = eig(R/d);
    eigR(i) = eigvalues(Rsize-1);
    
    C = cyclic(d);
    eigvalues = eig(C*C/4);
    eigC2(i) = eigvalues(d);
    
    zzprod = zigzag(R,C);
    eigvalues = eig(zzprod/4);
    eigZZ(i) = eigvalues(Rsize*d-1);
end
% 
% x = 1:length(degrees);
% figure
% plot(x,eigR,'-o', x,eigC2,'-x', x,eigZZ,'-*')
% legend('eigR','eigC^2', 'eigZZ');
% figure
% plot(x,eigC2,'-x', x,eigZZ,'-*')
% legend('eigC^2', 'eigZZ');
 
% eigR
% eigC2
% eigZZ
end