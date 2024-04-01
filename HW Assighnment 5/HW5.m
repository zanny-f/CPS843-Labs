I1 = imread('I1.jpeg');
I2 = imread('I2.jpeg');
figure
imshowpair(I1, I2, 'montage'); 
title('Original Images');
load upToScaleReconstructionCameraParameters.mat
I1 = undistortImage(I1, cameraParam);
I2 = undistortImage(I2, cameraParam);
figure 
imshowpair(I1, I2, 'montage');
title('Undistorted Images');
imagePoints1 = detectMinEigenFeatures(im2gray(I1), MinQuality = 0.1);
figure
imshow(I1, InitialMagnification = 50);
title('150 Strongest Corners from the First Image');
hold on
plot(selectStrongest(imagePoints1, 150));
tracker = vision.PointTracker(MaxBidirectionalError=1, NumPyramidLevels=5);
imagePoints1 = imagePoints1.Location;
initialize(tracker, imagePoints1, I1);
[imagePoints2, validIdx] = step(tracker, I2);
matchedPoints1 = imagePoints1(validIdx, :);
matchedPoints2 = imagePoints2(validIdx, :);
figure
showMatchedFeatures(I1, I2, matchedPoints1, matchedPoints2);
title('Tracked Features');
[E, epipolarInliers] = estimateEssentialMatrix(...
    matchedPoints1, matchedPoints2, cameraParam, Confidence = 99.99);
inlierPoints1 = matchedPoints1(epipolarInliers, :);
inlierPoints2 = matchedPoints2(epipolarInliers, :);
figure
showMatchedFeatures(I1, I2, inlierPoints1, inlierPoints2);
title('Epipolar Inliers');
[orient, loc] = relativeCameraPose(E, cameraParam, inlierPoints1, inlierPoints2);
roi = [30, 30, size(I1, 2)- 30, size(I1, 1)- 30];
imagePoints1 = detectMinEigenFeatures(im2gray(I1), 'ROI', roi, ...
    'MinQuality', 0.001);
tracker = vision.PointTracker('MaxBidirectionalError', 1, 'NumPyramidLevels', 5);
imagePoints1 = imagePoints1.Location;
initialize(tracker, imagePoints1, I1);
[imagePoints2, validIdx] = step(tracker, I2);
matchedPoints1 = imagePoints1(validIdx, :);
matchedPoints2 = imagePoints2(validIdx, :);
tform1 = rigid3d;
camMatrix1 = cameraMatrix(cameraParam, tform1);
cameraPose = rigid3d(orient, loc);
tform2 = cameraPoseToExtrinsics(cameraPose);
camMatrix2 = cameraMatrix(cameraParam, tform2);
points3D = triangulate(matchedPoints1, matchedPoints2, camMatrix1, camMatrix2);
numPixels = size(I1, 1) * size(I1, 2);
allColors = reshape(I1, [numPixels, 3]);
colorIdx = sub2ind([size(I1, 1), size(I1, 2)], round(matchedPoints1(:,2)), ...
    round(matchedPoints1(:, 1)));
color = allColors(colorIdx, :);
ptCloud = pointCloud(points3D, 'Color', color);
cameraSize = 0.3;
figure
plotCamera('Size', cameraSize, 'Color', 'r', 'Label', '1', 'Opacity', 0);
hold on 
grid on
plotCamera('Location', loc, 'Orientation', orient, 'Size', cameraSize, ... 
    'Color', 'b', 'Label', '2', 'Opacity', 0);
pcshow(ptCloud, 'VerticalAxis', 'y', 'VerticalAxisDir', 'down', 'MarkerSize', 45);
camorbit(0, -30);
camzoom(1.5);
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis')
title('Up to Scale Reconstruction of the Scene');