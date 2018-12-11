
% read
I = imread('cameraman.tif');

% convert and  add noise

I = im2double(I);
J = imnoise(I,'gaussian',0,0.02);

% Gaussian filters 
    
g1 = imgaussfilt(J,0.5);
g2 = imgaussfilt(J,1.0);
g3 = imgaussfilt(J,1.5);
g4 = imgaussfilt(J,2.0);
g5 = imgaussfilt(J,2.5);
g6 = imgaussfilt(J,3.0);
g7 = imgaussfilt(J,3.5);
g8 = imgaussfilt(J,4.0);
g9 = imgaussfilt(J,4.5);
g10 = imgaussfilt(J,5.0);

% median filters , different sizes: 1:2:9
m1 = medfilt2(J,[1 1]);
m3 = medfilt2(J,[3 3]);
m5 = medfilt2(J,[5 5]);
m7 = medfilt2(J,[7 7]);
m9 = medfilt2(J,[9 9]);

% Peak-Signal-to-Noise-Ratio 
g1_psnr = psnr(g1,I);
g2_psnr = psnr(g2,I);
g3_psnr = psnr(g3,I);
g4_psnr = psnr(g4,I);
g5_psnr = psnr(g5,I);
g6_psnr = psnr(g6,I);
g7_psnr = psnr(g7,I);
g8_psnr = psnr(g8,I);
g9_psnr = psnr(g9,I);
g10_psnr = psnr(g10,I);

m1_psnr = psnr(m1,I);
m3_psnr = psnr(m3,I);
m5_psnr = psnr(m5,I);
m7_psnr = psnr(m7,I);
m9_psnr = psnr(m9,I);

% display 

x1 = 0.5:0.5:5;
x2 = 1:2:9;
y1 = [g1_psnr;
      g2_psnr;
      g3_psnr;
      g4_psnr;
      g5_psnr;
      g6_psnr;
      g7_psnr;
      g8_psnr;
      g9_psnr;
      g10_psnr];
  
 y2 = [m1_psnr;
       m3_psnr;
       m5_psnr;
       m7_psnr;
       m9_psnr];
 
 figure
 subplot(1,2,1)
 plot(x1,y1)
 xlabel('sd')
 ylabel('PSNR')
 title('PSNR of Gaussian Filter')
 ylim([15 40])
 subplot(1,2,2)
 plot(x2,y2)
 xlabel('size')
 ylabel('PSNR')
 title('PSNR of Median Filter')
 ylim([15 40])
 
% ----------------------------------------------------------
%iterative denoising 
TV_I = func_denoising_tv_grad_desc(J, 0.01, 0.1, 5000);

TV_psnr = psnr(TV_I,I);

%  compare 

% the original image, the noisy image, and the
% (best) outputs of the 3 denoising methods
% with the .argest PSNR
figure
subplot(3,2,1)
imshow(I)
title('original image')
subplot(3,2,2)
imshow(J)
title('noisy image')
subplot(3,2,3)
imshow(TV_I)
title(['TV filter' 'PSNR = '  num2str(TV_psnr)])
subplot(3,2,4)
imshow(g1)

title(['gaussian filter' 'PSNR = ' num2str(g1_psnr)])
subplot(3,2,5)
imshow(m3)

title(['median filter' 'PSNR = ' num2str(m3_psnr)])



function I = func_denoising_tv_grad_desc( I, dt, beta, iterations )
% I             - noisy input image
% dt            - time step parameter needed for the gradient descent optimization algorithm
% beta          - regularization parameter of TV
% iterations    - number of iterations

% Maurice Debatin

I0 = I;
[ny, nx] = size( I );

for i = 1:iterations
    % estimate derivatives
    I_x = (I(:, [2:nx, nx]) - I(:, [1, 1:nx-1])) / 2;
    I_y = (I([2:ny, ny], :) - I([1, 1:ny-1], :)) / 2;
    I_xx = I(:, [2:nx, nx]) + I(:, [1, 1:nx-1]) - 2 * I;
    I_yy = I([2:ny, ny], :) + I([1, 1:ny-1], :) - 2 * I;
    Dp = I([2:ny, ny], [2:nx, nx]) + I([1, 1:ny-1], [1, 1:nx-1]);
    Dm = I([1, 1:ny-1], [2:nx, nx]) + I([2:ny, ny], [1, 1:nx-1]);
    I_xy = (Dp - Dm) / 4;
    
    % compute flow
    Num = I_xx .* (0.0001 + I_y .^2) - 2 * I_x .* I_y .* I_xy + I_yy .* (0.0001 + I_x .^2);
    Den = (0.0001 + I_x .^ 2 + I_y.^2) .^(3 / 2);
    tv = Num ./ Den;
    
    % denoiseing
    I = I + dt .* (beta .* tv + (I0 - I));
end
end