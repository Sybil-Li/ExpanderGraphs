function [ output_args ] = xiao1()
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

degrees = [11,21,31,41];
Rsize = 80;
eigR = zeros(1,length(degrees));
eigC2 = zeros(1,length(degrees));
eigZZ = zeros(1,length(degrees));

for i = 1:length(degrees)
    R = randRegular(Rsize, degrees(i));
    eigvalues = eig(R);
    eigR(i) = eigvalues(Rsize-1)/degrees(i);
    
    C = cyclic(degrees(i));
    eigvalues = eig(C);
    eigC2(i) = eigvalues(degrees(i)-1)/2;
    
    zzprod = zigzag(R,C);
    eigvalues = eig(zzprod);
    eigZZ(i) = eigvalues(Rsize*degrees(i)-1)/4;
end

x = 1:length(degrees);
figure
plot(x,eigR,'-o', x,eigC2.*eigC2,'-x', x,eigZZ,'-*')
legend('eigR','eigC^2', 'eigZZ');
 
% eigR
% eigC2
% eigZZ
end

