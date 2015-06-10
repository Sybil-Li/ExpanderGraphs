function [ output_args ] = xiao2()
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

degrees = [10,20,30,40];
Rsize = 80;
eigR = zeros(1,length(degrees));
eigAw2 = zeros(1,length(degrees));
eigZZ = zeros(1,length(degrees));

for i = 1:length(degrees)
    R = randRegular(Rsize, degrees(i));
    eigvalues = eig(R);
    eigR(i) = eigvalues(Rsize-1)/degrees(i);
    
    Aw = awfulGraph(degrees(i));
    eigvalues = eig(Aw);
    eigAw2(i) = eigvalues(degrees(i)-1)/(degrees(i)-1);
    
    zzprod = zigzag(R,Aw);
    eigvalues = eig(zzprod);
    eigZZ(i) = eigvalues(Rsize*degrees(i)-1)/((degrees(i)-1)^2);
end

x = 1:length(degrees);
figure
plot( x,eigAw2.*eigAw2,'-x', x,eigZZ,'-*')
legend('eigAw^2', 'eigZZ');
%  
% eigR
% eigC2
% eigZZ
end

