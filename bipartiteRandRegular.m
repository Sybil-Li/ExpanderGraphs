function [ A ] = bipartiteRandRegular(n, d)
% Adjacency matrix
A = zeros(n,n);
% Adjacency list
B = zeros(n,3);

s = 1:(n/2);

% first generate a d-regular bipartite graph in adjacency list
% representation
for i = 1:d
    t = randperm(n/2)+n/2;
    for j = 1:n/2
        B(j,i) = t(j);
        B(t(j),i) = j;
    end
end

% converting adjacency list to adjacency matrix
for i = 1:n
    for j = 1:d
        A(i,B(i,j)) = A(i,B(i,j))+1;
    end
end

end