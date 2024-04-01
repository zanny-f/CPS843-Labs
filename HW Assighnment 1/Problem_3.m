% Load and display the original grayscale image
img = imread('image.jpg');
i = rgb2gray (img);
% imshow(i);
% title('Original Image');

% Convert to double for mathematical operations
i = double(i);

% Define the gamma values for the power-law transformation
gamma1 = 0.3;
gamma2 = 3.0;

% Apply the power-law transformation with different gamma values
Image1 = 255 * (i / 255).^gamma1;
Image2 = 255 * (i/ 255).^gamma2;

% Convert the transformed images back to uint8 for display
i= uint8(i);
Image1 = uint8(Image1);
Image2 = uint8(Image2);

% Compute histograms of the original and transformed images
originalHist = imhist(i);
histogram1 = imhist(Image1);
histogram2 = imhist(Image2);

originalHist= uint8(originalHist);
histogram1 = uint8(histogram1);
histogram2 = uint8(histogram2);

% Apply histogram equalization
equalizedImage = histeq(i);
equalizedTransformedImage1 = histeq(Image1);
equalizedTransformedImage2 = histeq(Image2);

% Display the original images, histograms, and equalized images
figure;
subplot(3, 3, 1);
imshow(i);
title('Original Grayscale Image');

subplot(3, 3, 2);
bar(originalHist);
title('Histogram (Original)');

subplot(3, 3, 3);
imshow(equalizedImage);
title('Equalized Image (Original)');

subplot(3, 3, 4);
imshow(Image1);
title('Transformed Image (\gamma = 0.3)');

subplot(3, 3, 5);
bar(histogram1);
title('Histogram (Transformed, \gamma = 0.3)');

subplot(3, 3, 6);
imshow(equalizedTransformedImage1);
title('Equalized Image (Transformed, \gamma = 0.3)');

subplot(3, 3, 7);
imshow(Image2);
title('Transformed Image (\gamma = 3.0)');

subplot(3, 3, 8);
bar(histogram2);
title('Histogram (Transformed, \gamma = 3.0)');

subplot(3, 3, 9);
imshow(equalizedTransformedImage2);
title('Equalized Image (Transformed, \gamma = 3.0)');
