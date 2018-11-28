


I = imread('eight.tif');
% ADD noise _______________________________________________
Jg1 = imnoise(I,'gaussian',0,0.0015);
Jg2 = imnoise(I,'gaussian',0,0.0025);
Js1 = imnoise(I,'salt & pepper',0.002);
Js2 = imnoise(I,'salt & pepper',0.004);

% smoothing__________________________________________
K1g1 = wiener2(Jg1,[3 3],0.0015);
K2g1 = wiener2(Jg1,[7 7],0.0015);
K3g1 = wiener2(Jg1,[3 3]);
K4g1 = wiener2(Jg1,[7 7]);


K1g2 = wiener2(Jg2,[3 3],0.0025);
K2g2 = wiener2(Jg2,[7 7],0.0025);
K3g2 = wiener2(Jg2,[3 3]);
K4g2 = wiener2(Jg2,[7 7]);

K1s1 = wiener2(Js1,[3 3]);
K2s1 = wiener2(Js1,[7 7]);

K1s2 = wiener2(Js2,[3 3]);
K2s2 = wiener2(Js2,[7 7]);


% compare
%__________________________________________________________________________
figure(1)
subplot(3,2,1)
imshow(I)
title('orginal image')

subplot(3,2,2)
imshow(Jg1)
title('image with Gaussian noise,variance = 0.0015 ')

subplot(3,2,3)
imshow(K1g1)
title('filtered image,NS=[3,3],with real noise variance')

subplot(3,2,4)
imshow(K2g1)
title('filtered image,NS=[7 7],with real noise variance')

subplot(3,2,5)
imshow(K3g1)
title('filtered image,NS=[3,3],without real noise variance')

subplot(3,2,6)
imshow(K4g1)
title('filtered image,NS=[7 7],without real noise variance')
%_____________________________________________________________________________
figure(2)
subplot(3,2,1)
imshow(I)
title('orginal image')

subplot(3,2,2)
imshow(Jg2)
title('image with Gaussian noise,variance = 0.0025 ')


subplot(3,2,3)
imshow(K1g2)
title('filtered image,NS=[3,3],with real noise variance')


subplot(3,2,4)
imshow(K2g2)
title('filtered image,NS=[7 7],with real noise variance')

subplot(3,2,5)
imshow(K3g2)
title('filtered image,NS=[3,3],without real noise variance')

subplot(3,2,6)
imshow(K4g2)
title('filtered image,NS=[7 7],without real noise variance')
%______________________________________________________________________________
figure(3)
subplot(2,2,1)
imshow(I)
title('orginal image')

subplot(2,2,2)
imshow(Js1)
title('image with *salt & pepper* noise,noise,level =0.002')

subplot(2,2,3)
imshow(K1s1)
title('filtered image,NS=[3,3]')

subplot(2,2,4)
imshow(K2s1)
title('filtered image,NS=[7 7]')
%___________________________________________________

figure(4)
subplot(2,2,1)
imshow(I)
title('orginal image')

subplot(2,2,2)
imshow(Js2)
title('image with *salt & pepper* noise,level =0.004')

subplot(2,2,3)
imshow(K1s2)
title('filtered image,NS=[3,3]')

subplot(2,2,4)
imshow(K2s2)
title('filtered image,NS=[7 7]')


























