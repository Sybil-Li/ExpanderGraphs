function [ ] = master3()

% Rsize 50, 80, 110, Y degree = 3, random
R50Y3r = Y3random(50);
save('R50Y3r.mat','R50Y3r','-mat');
R80Y3r = Y3random(80);
save('R80Y3r.mat','R80Y3r','-mat');
R110Y3r = Y3random(110);
save('R110Y3r.mat','R110Y3r','-mat');

% filling gaps of Rsize
R40Y3r = Y3random(40);
save('R40Y3r.mat','R40Y3r','-mat');
R60Y3r = Y3random(60);
save('R80Y3r.mat','R60Y3r','-mat');
R70Y3r = Y3random(70);
save('R110Y3r.mat','R70Y3r','-mat');
R90Y3r = Y3random(90);
save('R50Y3r.mat','R90Y3r','-mat');
R100Y3r = Y3random(100);
save('R80Y3r.mat','R100Y3r','-mat');

% Rsize 50, 80, 110, Y degree = 3, cycle looking
R50Y3c = Y3cyclic(50);
save('R50Y3c.mat','R50Y3c','-mat');
R80Y3c = Y3cyclic(80);
save('R80Y3c.mat','R80Y3c','-mat');
R110Y3c = Y3cyclic(110);
save('R110Y3c.mat','R110Y3c','-mat');

% filling gaps of Rsize
R40Y3c = Y3cyclic(40);
save('R40Y3c.mat','R40Y3c','-mat');
R60Y3c = Y3cyclic(60);
save('R80Y3c.mat','R60Y3c','-mat');
R70Y3c = Y3cyclic(70);
save('R110Y3c.mat','R70Y3c','-mat');
R90Y3c = Y3cyclic(90);
save('R50Y3c.mat','R90Y3c','-mat');
R100Y3c = Y3cyclic(100);
save('R80Y3c.mat','R100Y3c','-mat');


