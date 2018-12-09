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
