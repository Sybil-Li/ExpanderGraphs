function [ A ] = cyclic4( n )
%returns the adjacency matrix of a cyclic graph of size n
%   param: n number of vertices

A = zeros(n,n);
A(1,n) = 1;
A(1,n-1)= 1;
A(1,2) = 1;
A(1,3) = 1;

A(2,1) = 1;
A(2,n) = 1;
A(2,3) = 1;
A(2,4) = 1;
for i = 3:n-2
    left = i-1;
    right = i+1;
    leftleft = i-2;
    rightright = i+2;
    A(i,left) = 1;
    A(i, right) = 1;
    A(i,leftleft) = 1;
    A(i, rightright) = 1;
end
A(n,1) = 1;
A(n,n-1) = 1;
A(n,n-2) = 1;
A(n,2) = 1;
A(n-1,n-2) = 1;
A(n-1,n-3) = 1;
A(n-1,n) = 1;
A(n-1,1) = 1;

end