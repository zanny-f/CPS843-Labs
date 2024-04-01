img= imread("image.jpg");
i = rgb2gray(img);
i = double(i);


histogram = imhist(i);
cdf = cumsum(histogram) / sum(histogram);

equalizationMap = uint8(255 * cdf);

equalizedImage = equalizationMap(i + 1); % +1 to handle 0-based indexing

subplot(1, 2, 1);
imshow(uint8(i));
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(equalizedImage));
title('Equalized Image');
