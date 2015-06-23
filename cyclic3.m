function [ A ] = cyclic3( n )
% returns the adjacency matrix of a cyclic looking graph of size n
% chords between alternating nodes
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


for i = 1:2:n-1
    A(i,i+1) = A(i,i+1)+1;
    A(i+1,i) = A(i+1,i)+1;
end
end