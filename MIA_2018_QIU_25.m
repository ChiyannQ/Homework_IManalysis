

%input 
BW = imread('text.png');

%structuring element
n1hood = BW(175:187,202:218);
nhood = true(13,17);
n2hood = xor(nhood,n1hood);

SE1 = strel('arbitrary',n1hood);
SE2 = strel('arbitrary',n2hood);
% hit and miss method
BW2 = bwhitmiss(BW,SE1,SE2);
% filling
h = [0 1 0;1 1 1;0 1 0];
J1 = BW2;
n = 1;
while n == 1
    T = imdilate(J1,h);
    J2 = T & BW;
    if J2 == J1
        n =0;
    else
        J1 = J2;
    end
end
% skeleton
BW3 = bwmorph(J2,'skel',Inf);
%disp
figure
subplot(2,2,1)
imshow(BW)
title('original image')
subplot(2,2,2)
imshow(n1hood)
title('structuring element')
subplot(2,2,3)
imshow(J2)
title('filtered image')
subplot(2,2,4)
imshow(BW3)
title('skeleton image')
