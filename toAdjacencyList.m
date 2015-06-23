function Adjacency_list=toAdjacencyList(A, d)
%this function converts and adjacecy matrix to an adjacency list matrix
%inpu A is the adjacency matrix,  A is a square and symmetric matrix
%input d is the degree of the graph represented by the adjacency matrix.
% output the respective adjacency list matrix
s= size(A,1);
Adjacency_list=zeros(s,d);
track=  ones(s,1);

 for i=1:s
     for j= 1:i
         while A(i,j)>0
             A(i,j)=A(i,j)-1;
             Adjacency_list(i,track(i))= j;
             track(i)=track(i)+1;
             if(i~=j)
             Adjacency_list(j,track(j))= i;
             track(j)=track(j)+1;
             end
             
         end    
     end
 end
 
