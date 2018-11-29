
% 12:edge detection and orientation

I = imread('rice.png');

% a. sobel filter

	% write the Sobel filter kernels 
hx = [1 0 -1;2 0 -2;1 0 -1];
hy = [1 2 1;0 0 0;-1 -2 -1];

	% use the kernels to filter the image
Jx = imfilter(I,hx);
Jy = imfilter(I,hy);

	% gradient magnitude and gradient orientation

Jm = sqrt(double(Jx.^2+Jy.^2));
Jo = atan(double(Jy./Jx));

% display
figure(1)
subplot(2,2,1)
imshow(I)
title('original image')


subplot(2,2,3)
imshow(Jx)

subplot(2,2,4)
imshow(Jy)
%_______________________________

figure(2)
subplot(2,2,1)
imshow(Jm)
title('approximated gradient magnitude')

subplot(2,2,2)
imhist(Jm)
title('histogram of approximated gradient magnitude')
xlim([-1 2])

subplot(2,2,3)
imshow(Jo)
title('approximated gradient orientation')

subplot(2,2,4)
imhist(Jo)
title('histogram of approximated gradient orientation')
xlim([-1 2])