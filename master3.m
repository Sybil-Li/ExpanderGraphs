function [ ] = master3()

% Rsize 50, 80, 110, Y degree = 3, random
R50Y3rconnected = Y3random(50);
save('R50Y3rconnected.mat','R50Y3rconnected','-mat');
R80Y3rconnected = Y3random(80);
save('R80Y3rconnected.mat','R80Y3rconnected','-mat');
R110Y3rconnected = Y3random(110);
save('R110Y3rconnected.mat','R110Y3rconnected','-mat');

% filling gaps of Rsize
R40Y3rconnected = Y3random(40);
save('R40Y3rconnected.mat','R40Y3rconnected','-mat');
R60Y3rconnected = Y3random(60);
save('R60Y3rconnected.mat','R60Y3rconnected','-mat');
R70Y3rconnected = Y3random(70);
save('R70Y3rconnected.mat','R70Y3rconnected','-mat');
R90Y3rconnected = Y3random(90);
save('R90Y3rconnected.mat','R90Y3rconnected','-mat');
R100Y3rconnected = Y3random(100);
save('R100Y3rconnected.mat','R100Y3rconnected','-mat');

% % Rsize 50, 80, 110, Y degree = 3, cycle looking
% R50Y3cconnected = Y3cyclic(50);
% save('R50Y3cconnected.mat','R50Y3cconnected','-mat');
% R80Y3cconnected = Y3cyclic(80);
% save('R80Y3cconnected.mat','R80Y3cconnected','-mat');
% R110Y3cconnected = Y3cyclic(110);
% save('R110Y3cconnected.mat','R110Y3cconnected','-mat');
% 
% % filling gaps of Rsize
% R40Y3cconnected = Y3cyclic(40);
% save('R40Y3cconnected.mat','R40Y3cconnected','-mat');
% R60Y3cconnected = Y3cyclic(60);
% save('R60Y3cconnected.mat','R60Y3cconnected','-mat');
% R70Y3cconnected = Y3cyclic(70);
% save('R70Y3cconnected.mat','R70Y3cconnected','-mat');
% R90Y3cconnected = Y3cyclic(90);
% save('R90Y3cconnected.mat','R90Y3cconnected','-mat');
% R100Y3cconnected = Y3cyclic(100);
% save('R100Y3cconnected.mat','R100Y3cconnected','-mat');


