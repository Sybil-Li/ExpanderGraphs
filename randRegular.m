function [ A ] = randRegular( n, d )
%returns the adjacency matrix of a random regular graph
%   param: n number of vertices,
%   param: d degree of graph

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
    A = A + eye(n);
end

end

