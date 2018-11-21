


% read 
I = imread('eight.tif');

% add noise
J_g1 = imnoise(I,'gaussian',0,0.01);
J_g2 = imnoise(I,'gaussian',0,0.03);
J_s1 = imnoise(I,'salt & pepper',0.01);
J_s2 = imnoise(I,'salt & pepper',0.03);

%smoothing
h1 = fspecial('gaussian',3,0.03);
h2 = fspecial('gaussian',3,0.06);
h3 = fspecial('average', 2);
h4 = fspecial('average', 4);

K_g1h1 = imfilter(I,h1);
K_g1h2 = imfilter(I,h2);
K_g1h3 = imfilter(I,h3);
K_g1h4 = imfilter(I,h4);

K_g2h1 = imfilter(I,h1);
K_g2h2 = imfilter(I,h2);
K_g2h3 = imfilter(I,h3);
K_g2h4 = imfilter(I,h4);

K_s1h1 = imfilter(I,h1);
K_s1h2 = imfilter(I,h2);
K_s1h3 = imfilter(I,h3);
K_s1h4 = imfilter(I,h4);

K_s2h1 = imfilter(I,h1);
K_s2h2 = imfilter(I,h2);
K_s2h3 = imfilter(I,h3);
K_s2h4 = imfilter(I,h4);
% compare the results

figure(1)

subplot(3,2,1)
imshow(I)
title('original image')
subplot(3,2,2)
imshow(J_g1)
title('Image with gaussian noise,sigma=0.01')
subplot(3,2,3)
imshow(K_g1h1)
title('Img filtered by gaussian filter,sigma =0.03 ')
subplot(3,2,4)
imshow(K_g1h2)
title('Img filtered by guassian filter,sigma = 0.06')
subplot(3,2,5)
imshow(K_g1h3)
title('Img filtered by mean filter,size = 2')
subplot(3,2,6)
imshow(K_g1h4)
title('Img filtered by mean filter,size = 4')


figure(2)

subplot(3,2,1)
imshow(I)
title('original image')
subplot(3,2,2)
imshow(J_g2)
title('Image with gaussian noise,sigma=0.03')
subplot(3,2,3)
imshow(K_g2h1)
title('Img filtered by gaussian filter,sigma =0.03')
subplot(3,2,4)
imshow(K_g2h2)
title('Img filtered by guassian filter,sigma = 0.06')
subplot(3,2,5)
imshow(K_g2h3)
title('Img filtered by mean filter,size = 2')
subplot(3,2,6)
imshow(K_g2h4)
title('Img filtered by mean filter,size = 4')


figure(3)

subplot(3,2,1)
imshow(I)
title('original image')
subplot(3,2,2)
imshow(J_s1)
title('Image with salt & pepper,level=0.01')
subplot(3,2,3)
imshow(K_s1h1)
title('Img filtered by gaussian filter,sigma =0.03')
subplot(3,2,4)
imshow(K_s1h2)
title('Img filtered by guassian filter,sigma = 0.06')
subplot(3,2,5)
imshow(K_s1h3)
title('Img filtered by mean filter,size = 2')
subplot(3,2,6)
imshow(K_s1h4)
title('Img filtered by mean filter,size = 4')

figure(4)

subplot(3,2,1)
imshow(I)
title('original image')
subplot(3,2,2)
imshow(J_s2)
title('Image with salt & pepper,level=0.03')
subplot(3,2,3)
imshow(K_s2h1)
title('Img filtered by gaussian filter,sigma =0.03')
subplot(3,2,4)
imshow(K_s2h2)
title('Img filtered by guassian filter,sigma = 0.06')
subplot(3,2,5)
imshow(K_s2h3)
title('Img filtered by mean filter,size = 2')
subplot(3,2,6)
imshow(K_s2h4)
title('Img filtered by mean filter,size = 4')






