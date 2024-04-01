% Enhance Low Light Image using Dehazing Algorithm
A = imread('low_light_1.jpg');
B = imread('low_light_2.jpg');

figure; imshow(A); title('Original Image - 1');
figure; imshow(B); title('Original Image - 2');

A_INV = imcomplement(A);
B_INV = imcomplement(B);

A_DEHAZED = imcomplement(imreducehaze(A_INV));
B_DEHAZED = imcomplement(imreducehaze(B_INV));

figure; imshow(A_DEHAZED); title('Dehazing Algorithm - 1');
figure; imshow(B_DEHAZED); title('Dehazing Algorithm - 2');

% Improve Results Further Using imreducehaze Optional Parameters
A_DEHAZED_ENHANCED = imcomplement(imreducehaze(A_INV, 'Method', 'approx', 'ContrastEnhancement', 'boost'));
B_DEHAZED_ENHANCED = imcomplement(imreducehaze(B_INV, 'Method', 'approx', 'ContrastEnhancement', 'boost'));

figure; imshow(A_DEHAZED_ENHANCED); title('Dehazing Algorithm Enhanced - 1');
figure; imshow(B_DEHAZED_ENHANCED); title('Dehazing Algorithm Enhanced - 2');

% Another Example of Improving Poorly Lit Image
A_DEHAZED_NO_CONTRAST_ENHANCEMENT = imcomplement(imreducehaze(A_INV, 'ContrastEnhancement', 'none'));
B_DEHAZED_NO_CONTRAST_ENHANCEMENT = imcomplement(imreducehaze(B_INV, 'ContrastEnhancement', 'none'));

figure; imshow(A_DEHAZED_NO_CONTRAST_ENHANCEMENT); title('Dehazing Algorithm No Contrast Enhancement - 1');
figure; imshow(B_DEHAZED_NO_CONTRAST_ENHANCEMENT); title('Dehazing Algorithm No Contrast Enhancement - 2');

% Reduce Color Distortion by Using Different Color Space
A_LAB = rgb2lab(A);
B_LAB = rgb2lab(B);
A_LAB_INV = imcomplement(A_LAB(:,:,1) ./ 100);
B_LAB_INV = imcomplement(B_LAB(:,:,1) ./ 100);

A_LAB_ENH = imcomplement(imreducehaze(A_LAB_INV, 'ContrastEnhancement', 'none'));
B_LAB_ENH = imcomplement(imreducehaze(B_LAB_INV, 'ContrastEnhancement', 'none'));

A_LAB_ENH(:,:,1)   = A_LAB_ENH .* 100;
A_LAB_ENH(:,:,2:3) = A_LAB(:,:,2:3) * 2;
B_LAB_ENH(:,:,1)   = B_LAB_ENH .* 100;
B_LAB_ENH(:,:,2:3) = B_LAB(:,:,2:3) * 2;

AEnh = lab2rgb(A_LAB_ENH);
BEnh = lab2rgb(B_LAB_ENH);

figure; imshow(AEnh); title('LAB Dehazing - 1');
figure; imshow(BEnh); title('LAB Dehazing - 2');

% Improve Results Using Denoising
A_GUIDED_FILTER = imguidedfilter(A_DEHAZED);
B_GUIDED_FILTER = imguidedfilter(B_DEHAZED);

figure; imshow(A_GUIDED_FILTER); title('Guided Filter - 1');
figure; imshow(B_GUIDED_FILTER); title('Guided Filter - 2');

% Estimate Illumination Map
[A_ENH_INV, A_ILLUM_INV] = imreducehaze(A_INV, 'Method', 'approxdcp', 'ContrastEnhancement', 'none');
[B_ENH_INV, B_ILLUM_INV] = imreducehaze(B_INV, 'Method', 'approxdcp', 'ContrastEnhancement', 'none');
A_ILLUM = imcomplement(A_ILLUM_INV);
B_ILLUM = imcomplement(B_ILLUM_INV);

figure; imshow(A_ILLUM); colormap(hot); title('Illumination Map - 1');
figure; imshow(B_ILLUM); colormap(hot); title('Illumination Map - 2');