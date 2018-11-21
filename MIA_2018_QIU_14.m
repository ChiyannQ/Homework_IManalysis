



% read
I = imread('cameraman.tif');

% display the linear kernels of the following filter
disp('following are the filter')
h_disk = fspecial('disk',10)    % 21-by-21 matrix
h_laplacian = fspecial('laplacian',0.3)     %3-by-3
h_sobel = fspecial('sobel')         %3-by-3

figure(1)
subplot(2,2,1)
stem3(h_disk)
title('disk filter')
subplot(2,2,2)
stem3(h_laplacian)
title('laplacian filter')
subplot(2,2,3)
stem3(h_sobel)
title('sobel filter')

% display the frequency responses of the 3 filter
fxshift = (-128/2:128/2-1)/128;
fyshift = (-128/2:128/2-1)/128;  
    % fourier transform
H_disk = abs(fft2(h_disk,128,128))./128;
H_laplacian = abs(fft2(h_laplacian,128,128))./128;
H_sobel = abs(fft2(h_sobel,128,128))./128;
    % shift
Hs_disk = fftshift(H_disk);
Hs_laplacian = fftshift(H_laplacian);
Hs_sobel = fftshift(H_sobel);

figure(2)
subplot(3,1,1)
surf(fxshift,fyshift,Hs_disk)
title('frequency response of disk filter')
subplot(3,1,2)
surf(fxshift,fyshift,Hs_laplacian)
title('frequency response of laplacian filter')
subplot(3,1,3)
surf(fxshift,fyshift,Hs_sobel)
title('frequency response of sobel filter')

% Compare the filter
figure(3)
subplot(2,2,1)
stem3(h_disk)
title('disk filter in the space domain')
subplot(2,2,2)
surf(fxshift,fyshift,Hs_disk)
title('frequency response ofdisk filter')
subplot(2,2,3)
imshow(I)
title('originalIma')
subplot(2,2,4)
imshow(imfilter(I,h_disk))
title('filtered image by disk filter')

figure(4)
subplot(2,2,1)
stem3(h_laplacian)
title('laplacian filter in the space domain')
subplot(2,2,2)
surf(fxshift,fyshift,Hs_laplacian)
title('laplacian filter in the frequency domain')
subplot(2,2,3)
imshow(I)
title('originalIma')
subplot(2,2,4)
imshow(imfilter(I,h_laplacian))
title('filtered image by laplacian filter')

figure(5)
subplot(2,2,1)
stem3(h_sobel)
title('sobel filter in the space domain')
subplot(2,2,2)
surf(fxshift,fyshift,Hs_sobel)
title('sobel filter in the frequency domain')
subplot(2,2,3)
imshow(I)
title('originalIma')
subplot(2,2,4)
imshow(imfilter(I,h_sobel))
title('filtered image by sobel filter')














