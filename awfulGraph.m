function [ A ] = awfulGraph( n )
%returns the adjacency matrix of an awful graph of size n
% awful graph has degree d=n-1; we first have an complete graph K(n-1),
% then we add an extra vertex p, and connect it to an arbitrary vertex in the
% complete graph, and then add n-2 self loop to p and then add one self loop to every vertex other than p. 
%   param: n number of vertices, size of the graph

A = ones(n,n);
for i = 1:n-1
    A(i,n) = 0;
end

A(n-1,n-1) = 0;
A(n-1,n) = 1;
for i = 1:n-2
    A(n,i) = 0;
end

A(n,n) = n-2;

end