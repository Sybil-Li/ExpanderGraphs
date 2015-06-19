function [ A ] = construct1(n)
% explicitly construct a 3-regular graph
% n must be multiples of 4

A = zeros(n,n);

for i = 0:(n/4-1)
    cur = i*4+1;
    first = cur+1;
    second = cur+2;
    third = cur+3;
    A(cur,first) = 1;
    A(cur,second) = 1;
    A(cur,third) = 1;
    A(first,cur) = 1;
    A(second,cur) = 1;
    A(third,cur) = 1;
end

if (n == 4)
    A(2,3) = 1;
    A(3,2) = 1;
    A(3,4) = 1;
    A(4,3) = 1;
    A(4,2) = 1;
    A(2,4) = 1;
else
%     first group
    A(2,6) = A(2,6)+1;
    A(3,7) = A(3,7)+1;
    A(4,8) = A(4,8)+1;
    A(2,n-4+2) = A(2,n-4+2)+1;
    A(3,n-4+3) = A(3,n-4+3)+1;
    A(4,n-4+4) = A(4,n-4+4)+1;
%     last group
    A(n-2,n-6) = A(n-2,n-6)+1;
    A(n-1,n-5) = A(n-1,n-5)+1;
    A(n, n-4) = A(n, n-4)+1;
    A(n-2,2) = A(n-2,2)+1;
    A(n-1,3) = A(n-1,3)+1;
    A(n, 4) = A(n, 4)+1;
end

for i = 1:(n/4-2)
    cur = i*4+1;
    first = cur+1;
    second = cur+2;
    third = cur+3;
    A(first,first+4) = 1;
    A(first,first-4) = 1;
    A(second,second+4) = 1;
    A(second,second-4) = 1;
    A(third, third+4) = 1;
    A(third, third-4) = 1;
end
    
end