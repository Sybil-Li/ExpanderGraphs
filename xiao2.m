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
    eigvalues = eig(R/degrees(i));
    eigR(i) = eigvalues(Rsize-1);
    
    Aw = awfulGraph(degrees(i));
    eigvalues = eig(Aw*Aw/(degrees(i)-1)/(degrees(i)-1));
    eigAw2(i) = eigvalues(degrees(i)-1);
    
    zzprod = zigzag(R,Aw);
    eigvalues = eig(zzprod/(degrees(i)-1)^2);
    eigZZ(i) = eigvalues(Rsize*degrees(i)-1);
end

x = 1:length(degrees);
figure
plot(x,eigR,'-o', x,eigAw2,'-x', x,eigZZ,'-*')
legend('eigR','eigAw^2', 'eigZZ');
figure
plot(x,eigAw2,'-x', x,eigZZ,'-*')
legend('eigAw^2', 'eigZZ');
 
% eigR
% eigAw2
% eigZZ
end

