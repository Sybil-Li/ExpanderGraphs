function [ ] = master()

% set1 with Rsize 50, 80, 110, 140
table = f1(50);
save('set1R50.mat','table','-mat');
table = f1(80);
save('set1R80.mat','table','-mat');
table = f1(110);
save('set1R110.mat','table','-mat');
table = f1(140);
save('set1R140.mat','table','-mat');

% set3,4,5 with degree increment of 10
table = f3s(3);
save('set3C3s.mat','table','-mat');
table = f3s(5);
save('set3C3s.mat','table','-mat');
table = f3s(7);
save('set3C3s.mat','table','-mat');

% set3,4,5 with degree increment of *10
table = f3l(3);
save('set3C3l.mat','table','-mat');
table = f3s(5);
save('set3C3l.mat','table','-mat');
table = f3s(7);
save('set3C3l.mat','table','-mat');
end