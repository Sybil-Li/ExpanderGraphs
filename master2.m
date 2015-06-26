function [ ] = master2()

% X size 50, 80, 110, 140, with increasing degrees, Y degree = sqrt(n)
sqrtR50 = inBetweenY(50,1);
save('sqrtR50.mat','sqrtR50','-mat');
sqrtR80 = inBetweenY(80,1);
save('sqrtR80.mat','sqrtR80','-mat');
sqrtR110 = inBetweenY(110,1);
save('sqrtR110.mat','sqrtR110','-mat');


% X size 50, 80, 110, 140, with increasing degrees, Y degree = log(n)
% logR50 = inBetweenY(50,2);
% save('logR50.mat','logR50','-mat');
% logR80 = inBetweenY(80,2);
% save('logR80.mat','logR80','-mat');
% logR110 = inBetweenY(110,2);
% save('logR110.mat','logR110','-mat');
end
