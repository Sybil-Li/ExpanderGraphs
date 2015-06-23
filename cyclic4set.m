function [ eigC4 ] = cyclic4set()

size = [11,21,31,41,51]*50;


for i = 1:5
    eigvalues = eig(cyclic4(size(i)));
    eigC4(i) = eigvalues(size(i)-1);
end

end