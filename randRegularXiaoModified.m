function [ A ] = randRegularXiaoModified( n, d )
% returns the adjacency matrix of a random regular graph
%   param: n number of vertices,
%   param: d degree of graph
% use xiao's approach for floor(n) degrees
% if d is odd, add one more edge using bipartite permutation

numperms = floor(d/2);
A = zeros(n,n);
for i = 1:numperms
    P = zeros(n,n);
    perm = randperm(n);
    for j = 1:n
        P(j,perm(j)) = 1;
        
    end
    A = A + P + P';
end

if (mod(d,2) == 1)
    t = randperm(n/2);
    for j = 1:n/2
        A(t(j)+n/2,t(j)) = A(t(j)+n/2,t(j))+1;
        A(t(j),t(j)+n/2) = A(t(j),t(j)+n/2)+1;
    end
end
 
end