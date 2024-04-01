image = imread("image.jpg");

h1 = figure; 
imshow(image); 
title('Original Image');


%Step 1
red = [255 10 10]';
a = 0.2;
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(image,T,R,'FillValues',red); 
h2 = figure; imshow(B);
title('Sheared Image');


%Step 2
[U,V] = meshgrid(0:64:2200,0:64:2100);
[X,Y] = tformfwd(T,U,V);
gray = 0.65 * [1 1 1];

figure(h2);
hold on;
line(X, Y, 'Color',gray);
line(X',Y','Color',gray);



%Step 3
XData = [-99 2700];
YData = [-99 2100];
R = makeresampler({'cubic','nearest'},'fill');
Bf = imtransform(image,T,R,'XData',XData,'YData',YData,...
                 'FillValues',red);
figure, imshow(Bf);
title('Pad Method = ''fill''');

R = makeresampler({'cubic','nearest'},'replicate');
Br = imtransform(image,T,R,'XData',XData,'YData',YData);
figure, imshow(Br);
title('Pad Method = ''replicate''');

R = makeresampler({'cubic','nearest'}, 'bound');
Bb = imtransform(image,T,R,'XData',XData,'YData',YData,...
                 'FillValues',red);
figure, imshow(Bb);
title('Pad Method = ''bound''');


%Step 4
Thalf = maketform('affine',[1 0; a 1; 0 0]/2);

R = makeresampler({'cubic','nearest'},'circular');
Bc = imtransform(image,Thalf,R,'XData',XData,'YData',YData,...
                 'FillValues',red);
figure, imshow(Bc);
title('Pad Method = ''circular''');

R = makeresampler({'cubic','nearest'},'symmetric');
Bs = imtransform(image,Thalf,R,'XData',XData,'YData',YData,...
                 'FillValues',red);
figure, imshow(Bs);
title('Pad Method = ''symmetric''');