% Load and display the original grayscale image
img = imread('image.jpg');
i = rgb2gray (img);
imshow(i);

title('Original Image');

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

% Display the transformed images
figure;
subplot(3, 3, 1);
imshow(i);
title ("Original Image");
subplot(3, 3, 2);
imshow(Image1);
title('Power-law Transformation 0.3)');
subplot(3, 3, 3);
imshow(Image2);
title('Power-law Transformation 3.0)');
