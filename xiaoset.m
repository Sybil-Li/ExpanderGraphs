function [ R10, R50, R80 ] = xiaoset()
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

degrees = [11,21,31,41,51];
Rsize = [10,50,80];

R10 = zeros(length(degrees),1000);
R50 = zeros(length(degrees),1000);
R80 = zeros(length(degrees),1000);

for j = 1:length(degrees)
    R10(j,:) = xiaosingledegree(10,degrees(j));
end

for j = 1:length(degrees)
    R50(j,:) = xiaosingledegree(50,degrees(j));
end

for j = 1:length(degrees)
    R80(j,:) = xiaosingledegree(80,degrees(j));
end


end