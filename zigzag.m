function [ M ] = zigzag( X, Y )
% Compute the zigzag product of two graphs
% X and Y are adjacency matrices of the two graphs
% X must be d-regular where d = |Y|

% getting size of X and Y
n = size(X);
n = n(1);
d = size(Y);
d = d(1);

% Create the Z matrix
Z = Y;
for i = 1:n-1
    Z = blkdiag(Z,Y);
end
    
% Create random labeling matrix L
L = zeros(n,d);
for i = 1:n
    L(i,:) = randperm(d);
end

% Create H from A and L

% Create n*d matrix from A
A2 = zeros(n,d);
count = 1;
for i = 1:n
    for j = 1:n
        if (X(i,j) > 0)
            for k = 1:X(i,j)
                A2(i,count) = j;
                count = count + 1;
            end
        end
    end
    count = 1;
end

% Randomly permute or permute according to labeling
A3 = zeros(n,d);
for i = 1:n
    perm = randperm(d);
    for j = 1:d
        A3(i,j) = A2(i,perm(j));
    end
end
A2 = A3;

% Book Labeling
%A2 = [3,2,4;3,4,1;2,4,1;2,1,3];

% Create H from permuted A2
H = zeros(n*d,n*d);
% for every distinct egde in graph X (A2)
for i = 1:n
    for j = 1:d
        if (A2(i,j) ~= 0)
            temp = A2(i,j);
            %A2(i,j) = 0;
            % find the pair of (x1,y1) and (x2,y2) that are adjacent
            x1 = i;
            y1 = j;
            x2 = temp;
            % find the labeling for the same edge at the other end node
            index = 1;
            while (A2(x2,index) ~= x1)
                index = index+1;
            end
            y2 = index;
            A2(x2,y2) = 0;
            % increment the multiplicity between
            % H((x1,y1),(x2,y2)) and H((x2,y2),(x1,y1)) 
            % Note: index for (xi,yj) in H is calculated by i*d+j
            H((x1-1)*d+y1,(x2-1)*d+y2) = H((x1-1)*d+y1,(x2-1)*d+y2)+1;
            if ((x1 ~= x2) || (y1 ~= y2))
                H((x2-1)*d+y2,(x1-1)*d+y1) = H((x2-1)*d+y2,(x1-1)*d+y1)+1;
            end
        end
    end
end

M = Z*H*Z;
end

