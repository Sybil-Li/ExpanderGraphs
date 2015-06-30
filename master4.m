function [ ] = master4()
% generate almost-fully-random graphs with same size and vertex degree

R40G = Gnonbipartite(40);
save('R40G.mat','R40G','-mat');
R50G = Gnonbipartite(50);
save('R50G.mat','R50G','-mat');
R60G = Gnonbipartite(60);
save('R60G.mat','R60G','-mat');
R70G = Gnonbipartite(70);
save('R70G.mat','R70G','-mat');
R80G = Gnonbipartite(80);
save('R80G.mat','R80G','-mat');
R90G = Gnonbipartite(90);
save('R90G.mat','R90G','-mat');
R100G = Gnonbipartite(100);
save('R100G.mat','R100G','-mat');
R110G = Gnonbipartite(110);
save('R110G.mat','R110G','-mat');

end