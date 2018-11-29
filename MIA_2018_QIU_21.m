


I = imread('eight.tif');

% add noise
Jg1 = imnoise(I,'gaussian',0,0.015);
Jg2 = imnoise(I,'gaussian',0,0.0075);

Js1 = imnoise(I,'salt & pepper',0.03);
Js2 = imnoise(I,'salt & pepper',0.01);



% smoothing by the median filter

K1g1 = medfilt2(Jg1); % default [3,3]
K2g1 = medfilt2(Jg1,[5,5]);
K3g1 = medfilt2(Jg1);         % default '0 padding'
K4g1 = medfilt2(Jg1,'symmetric');


K1g2 = medfilt2(Jg2);
K2g2 = medfilt2(Jg2,[5,5]);
K3g2 = medfilt2(Jg2);
K4g2 = medfilt2(Jg2,'symmetric');


K1s1 = medfilt2(Js1);
K2s1 = medfilt2(Js1,[5,5]);
K3s1 = medfilt2(Js1);
K4s1 = medfilt2(Js1,'symmetric');

K1s2 = medfilt2(Js2);
K2s2 = medfilt2(Js2,[5,5]);
K3s2 = medfilt2(Js2);
K4s2 = medfilt2(Js2,'symmetric');


% compare result

figure(1)
subplot(3,2,1)
imshow(I)
title('original')

subplot(3,2,2)
imshow(Jg1)
title('noisy image,variance = 0.015')

subplot(3,2,3)
imshow(K1g1)
title('NSZ = [3 3]')

subplot(3,2,4)
imshow(K2g1)
title('NSZ = [5,5]')

subplot(3,2,5)
imshow(K3g1)
title('boudary option:0 padding')

subplot(3,2,6)
imshow(K4g1)
title('boudary option: symmetric')
%_____________________________________________________________
figure(2)

subplot(3,2,1)
imshow(I)
title('original')

subplot(3,2,2)
imshow(Jg2)
title('noisy image,variance = 0.0075')

subplot(3,2,3)
imshow(K1g2)
title('NSZ = [3 3]')

subplot(3,2,4)
imshow(K2g2)
title('NSZ = [5,5]')

subplot(3,2,5)
imshow(K3g2)
title('boudary option:0 padding')

subplot(3,2,6)
imshow(K4g2)
title('boudary option: symmetric')

%_____________________________________________________________

figure(3)
subplot(3,2,1)
imshow(I)
title('original')

subplot(3,2,2)
imshow(Js1)
title('noisy image,level = 0.003')

subplot(3,2,3)
imshow(K1s1)
title('NSZ = [3 3]')

subplot(3,2,4)
imshow(K2s1)
title('NSZ = [5,5]')

subplot(3,2,5)
imshow(K3s1)
title('boudary option:0 padding')

subplot(3,2,6)
imshow(K4s1)
title('boudary option: symmetric')
%_____________________________________________________________
figure(4)
subplot(3,2,1)
imshow(I)
title('original')

subplot(3,2,2)
imshow(Js2)
title('noisy image,level = 0.001')

subplot(3,2,3)
imshow(K1s2)
title('NSZ = [3 3]')

subplot(3,2,4)
imshow(K2s2)
title('NSZ = [5,5]')

subplot(3,2,5)
imshow(K3s2)
title('boudary option:0 padding')

subplot(3,2,6)
imshow(K4s2)
title('boudary option: symmetric')