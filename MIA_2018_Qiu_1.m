

%read img
rgbImg = imread('onion.png');

%extract
r = rgbImg(:, :, 1);% Red channel
g = rgbImg(:, :, 2);% Green channel
b = rgbImg(:, :, 3);% Blue channel

%rebuild
rImg = cat(3,r,zeros(size(g)),zeros(size(b)));
gImg = cat(3,zeros(size(r)),g,zeros(size(b)));
bImg = cat(3,zeros(size(r)) , zeros(size(g)),b);
%convert
gray=rgb2gray(rgbImg);% Gray Scale

%save in 8-bit PNG files
imwrite(rImg,'R.png');
imwrite(gImg,'G.png');
imwrite(bImg,'B.png');
imwrite(gray,'Gray.png');


%display topleft 10*10 elements of the grayscale img


gray10=gray(1:10,1:10);
imshow(gray10);








