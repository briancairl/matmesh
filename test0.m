%% Computations
clear;
clc;
colormap('Cool')


M   = meshread('wolf0.off');
D   = pairwiselp(M.V,M.V,2);


disp('Computing Geodesic distances');
G   = geod(M);

%%

disp('Computing K-Centers Segments');

ID1     = kcenters(G,7,'SEED',20);
ID1C    = scale2color(ID1);

ID2     = kmeans(M.V,G,9);
ID2C    = scale2color(ID2);

%% K-Centers Segmentation Demo


figure(1)
cla
meshview(M,'FacevertexCData',ID1C,'FaceColor','interp','EdgeColor','none','FaceAlpha',0.95);
cleanfig(gcf)

figure(2)
cla
meshview(M,'FacevertexCData',ID2C,'FaceColor','interp','EdgeColor','none','FaceAlpha',0.95);
cleanfig(gcf)




%% Rotation Animation

C = scale2color(D(1,:));

clf
shg
for ang = 0:0.005:(2*pi)    
    cla
    meshview(meshrotate(M,[0,1,1,ang]),'FacevertexCData',IDC,'FaceColor','interp','EdgeColor','none','FaceAlpha',0.8);
    cleanfig(gcf)
    pause(1e-6) 
end