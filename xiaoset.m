function [ R10, R30, R50, R70, R90, R110] = xiaoset()
%Verifying Xiao's results
%Compute the second largest eigenvalue of the normalized adjacency matrix
%of the zigzag product of a random regular graph and a cyclic graph

degrees = [11,21,31];
Rsize = [10,30,50,70,90,110];

R10 = zeros(length(degrees),100);
R30 = zeros(length(degrees),100);
R50 = zeros(length(degrees),100);
R70 = zeros(length(degrees),100);
R90 = zeros(length(degrees),100);
R110 = zeros(length(degrees),100);

for j = 1:length(degrees)
    R10(j,:) = xiaosingledegree(10,degrees(j));
end

for j = 1:length(degrees)
    R30(j,:) = xiaosingledegree(30,degrees(j));
end

for j = 1:length(degrees)
    R50(j,:) = xiaosingledegree(50,degrees(j));
end

for j = 1:length(degrees)
    R70(j,:) = xiaosingledegree(70,degrees(j));
end

for j = 1:length(degrees)
    R90(j,:) = xiaosingledegree(90,degrees(j));
end

for j = 1:length(degrees)
    R110(j,:) = xiaosingledegree(110,degrees(j));
end

end