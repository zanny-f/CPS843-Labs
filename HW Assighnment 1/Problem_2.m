i = rgb2gray(imread("image.jpg"));

% Convert the original grayscale image to double for manipulation
i = double(i);


% Perform 8-bit plane slicing
bitplane1 = bitget(i, 1);
bitplane2 = bitget(i, 2);
bitplane3 = bitget(i, 3);
bitplane4 = bitget(i, 4);
bitplane5 = bitget(i, 5);
bitplane6 = bitget(i, 6);
bitplane7 = bitget(i, 7);
bitplane8 = bitget(i, 8);

% Display each bit-plane slice
figure;
subplot (4, 4, 1);
imshow(bitplane1, []);
title("Bit plane 1");
subplot (4, 4, 2);
imshow(bitplane2, []);
title("Bit plane 2");
subplot (4, 4, 3);
imshow(bitplane3, []);
title("Bit plane 3");
subplot (4, 4, 4);
imshow(bitplane4, []);
title("Bit plane 4");
subplot (4, 4, 5);
imshow(bitplane5, []);
title("Bit plane 5");
subplot (4, 4, 6);
imshow(bitplane6, []);
title("Bit plane 6");
subplot (4, 4, 7);
imshow(bitplane7, []);
title("Bit plane 7");
subplot (4, 4, 8);
imshow(bitplane8, []);
title("Bit plane 8");


% Reconstruct the image from the highest 2 and 4 bit-planes
highest4bits = bitplane8*(2^8) + bitplane7*(2^7) + bitplane6*(2^6) + bitplane5*(2^5);
highest2bits = bitplane8*(2^8) + bitplane7*(2^7);


% Display the reconstructed images
figure;
subplot(3, 3, 1);
imshow(uint8(grayimage));
title ("Original Image");

subplot (3, 3, 2);
imshow(highest2bits, []);
title("Highest 2bit planes");

subplot(3, 3, 3);
imshow(highest4bits, []);
title("Highest 4bit planes");

