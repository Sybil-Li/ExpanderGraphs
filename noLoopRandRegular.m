function [ A ] = noLoopRandRegular(n, d)
% Adjacency matrix
A = zeros(n,n);
% Adjacency list
B = zeros(n,3);

s = 1:(n/2);

% first generate a d-regular bipartite graph
for i = 1:d
    t = randperm(n/2)+n/2;
    for j = 1:n/2
        B(j,i) = t(j);
        B(t(j),i) = j;
    end
end

% replace two edges
% first find two nodes in the same set
start = 1;
destination = 1;
while (destination == start)
    steps = randi(n/2)*2;
%   reassigin start every time to avoide infinite loop
%   possible infinite loop condition if start is a vertex with 3 loops
    start = randi(n/2);
    destination = start;
    for i = 1:steps
        destination = B(destination,randi(d));
    end
end

% randomly pick two neighbors
snindex = randi(d);
sneighbor = B(start, snindex);
dnindex = randi(d);
dneighbor = B(destination, dnindex);
% swapping
B(start,snindex) = destination;
B(destination, dnindex) = start;

B(sneighbor,snindex) = dneighbor;
B(dneighbor,dnindex) = sneighbor;

% converting adjacency list to adjacency matrix
for i = 1:n
    for j = 1:d
        A(i,B(i,j)) = A(i,B(i,j))+1;
    end
end

end