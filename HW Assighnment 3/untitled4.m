load ("object3d.mat");
figure 
pcshow(ptCloud)
title ("Detect a sphere in a point cloud")
maxDistance = 0.01;
roi = [-inf, 0.5; 0.2,0.4;0.1,inf];
sampleIndicies = findPointsInROI(ptCloud,roi);
[model,inlierIndicies] = pcfitsphere(ptCloud,maxDistance,SampleIndices=sampleIndicies);
globe = select(ptCloud,inlierIndicies);
figure 
pcshow(globe)
title("Globe Point Cloud")

