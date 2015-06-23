function [ A ] = awfulGraph( n )
%returns the adjacency matrix of a cyclic graph of size n
%   param: n number of vertices

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