



% read
I = imread('cameraman.tif');

% display the linear kernels of the following filter

h_disk = fspecial('disk',10);% 21-by-21 matrix
h_laplacian = fspecial('laplacian',0.3); %3-by-3
h_sobel = fspecial('sobel');%3-by-3


% display the frequency responses of the 3 filter

    % fourier transform
H_disk = fft2(h_disk,128,128);
H_laplacian = fft2(h_laplacian,128,128);
H_sobel = fft2(h_sobel,128,128);

[H_d,w_d] = freqz2(h_disk,10);
[H_la,w_la] = freqz2(h_laplacian,10);
[H_s,w_s] = freqz2(h_sobel,10);


% display

%figure(1)

%subplot(1,4,1)
%imshow(h_disk)
%title()

%subplot(1,4,2)
%imshow(H_disk)
%title()

%subplot(1,4,3)
%imshow(I)
%title('originalIma')

%subplot(1,4,4)
%imshow(I_disk)
%title()























