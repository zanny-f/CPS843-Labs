% Part 2
%load('object3d.mat');

figure; pcshow(ptCloud);
xlabel('X(m)');
ylabel('Y(m)');
zlabel('Z(m)');
title('Original Point Cloud');

max_dist = 0.01;

roi = [-inf,0.5,0.2,0.4,0.1,inf];
sampleIndices = findPointsInROI(ptCloud,roi);


[model,inlierIndices] = pcfitsphere(ptCloud,max_dist,'SampleIndices',sampleIndices);
globe = select(ptCloud,inlierIndices);
hold on;
plot(model);

figure;
pcshow(globe);
title('Globe Point Cloud');