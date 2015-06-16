function lambda_power=powerMethod(A, d, tolerance)
% this function uses the power method to calculate the second largest
% eigenvalue of the graph represented by the given adjacency matrix;
% A is the adjacency matrix
% d is the degree of the regular graph
% input tolerance is the tolerance allowed between two power method
% iterations, as the method asymptotes the real value; less than 0.0001, is
% recommended

format long
Adjacency_list=toAdjacencyList(A, d);

guess1= 1;%current guess of eigenvalue
guess2=10;%previous guess of eigenvalue

s=size(Adjacency_list,1);% assume size is even??
%d=size(Adjacency_list,2);
half_size=floor(s/2);

a=[0];
eigenvec1=repmat(a,s,1);%our guess for the eigenvector
eigenvec2=repmat(a,s,1);%vectors to work with
vec3=repmat(a,s,1);

for i=1:s
eigenvec1(i)=rand;
end

while abs(guess1-guess2)>=tolerance
  %convergence=convergence+1;  
  c=0;
  g=0;
  normconst=0;
  test=0;

  for i=1:s%set value for c
      c=c+eigenvec1(i); 
      vec3(i)=0;
  end
  c=c/s;
 
  for i=1:half_size%set value for g
      g= g+eigenvec1(i);
  end
  for i=1:half_size
      g= g-eigenvec1(i+half_size);
  end
  g=g/s;

  for i=1:half_size%set value for eigenvec2     
      eigenvec2(i)= eigenvec1(i)-c-g;
  end  
  for i=1:half_size
      eigenvec2(i+half_size)=eigenvec1(i+half_size)-c+g;
  end
  
  for i=1:s %normalize eigenvec2
      normconst= normconst + (eigenvec2(i))^2;
  end
  normconst=sqrt(normconst);
  for i=1:s
     eigenvec2(i)=eigenvec2(i)/normconst;
  end
  
  for i=1:s  % compute Ad, place results in eigenvec1
   for j=1:d
       vec3(i)= vec3(i)+ eigenvec2(Adjacency_list(i,j));      
   end
  end
  
  for i=1:s
      eigenvec1(i)=0; 
  end
  
  for i=1:s
      for j=1:d
          eigenvec1(i) = eigenvec1(i) + vec3(Adjacency_list(i,j));
      end
  end

  guess2 = guess1; 
  guess1=0;
  
  for i=1:s
      guess1= guess1+ eigenvec2(i) * eigenvec1(i);
  end
  guess1 = sqrt(guess1);  
  
end
lambda_power=guess1;