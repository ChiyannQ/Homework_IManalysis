
% Ziyang Qiu
% medical faculty ,mannheim
% Biomedical Engineering
% 3565830

% read
Img = imread('rice.png');

% Qa adjust image intensity values

Max = double(max(max(Img))); % largest intensity value
Min = double(min(min(Img))); % smallest intensity value

    % mapping the lower half to the full range
J1 = imadjust(Img,[0; 0.5],[0 1]);
    % mapping the upper half to the full range
J2 = imadjust(Img,[0.5; 1],[0 1]);


%display
subplot(3,2,1)
imshow(Img)
title('original image')

subplot(3,2,2)
imhist(Img)
title('histogram of original image')
xlim([-10 270])

subplot(3,2,3)
imshow(J1)
title('high contrast of the dark part')

subplot(3,2,4)
imhist(J1)
title('histogram of the image on the left side')
xlim([-10 270])

subplot(3,2,5)
imshow(J2)
title('high contrast of the bright part')

subplot(3,2,6)
imhist(J2)
title('histogram of the image on the left side')
xlim([-10 270])


