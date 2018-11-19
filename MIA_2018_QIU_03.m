


%read img
I = imread('eight.tif');

% a 
% add noise to the imag
J = imnoise(I,'gaussian',0,0.02);


% compute the mse with M function
err = immse(I,J);
% compute by denifition
J_d = double(J);
I_d = double(I);
[N,M] = size(J_d);
D = J_d-I_d;
err_def = 1/N/M * norm(D,'fro')* norm(D,'fro');

% display the values in the console
disp(['the MSE of the image is ,using the built-in functoin,',num2str(err),'.'])
fprintf('\n')
disp(['the MSE of the image,computed by its definition , is ',num2str(err_def),'.']) 
fprintf('\n')



%c
% compute by function
peaksnr = psnr(J,I);
% compute by definition
peaksnr_def = 10* log10(255^2/err);

fprintf('\n')
disp(['the PSNR of the image is ,using the built-in functoin,',num2str(peaksnr),'.'])
fprintf('\n')
disp(['the PSNR of the image,computed by its definition , is ',num2str(peaksnr_def),'.']) 
fprintf('\n')













