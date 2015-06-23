function [ A ] = cyclic( n )
%returns the adjacency matrix of a cyclic graph of size n
%   param: n number of vertices

A = zeros(n,n);
A(1,2) = 1;
A(1,n) = 1;
for i = 2:n-1
    left = i-1;
    right = i+1;
    A(i,left) = 1;
    A(i, right) = 1;
end
A(n,1) = 1;
A(n,n-1) = 1;

end