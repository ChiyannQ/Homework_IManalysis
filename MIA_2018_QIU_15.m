


% noise estimation by PCA

% a: sample generation
    % reset the random number generator to the startup state

sigma = [0.25,0.2;0.2,0.25];
rng('default');
R1 = mvnrnd([1,5],sigma,50);
rng('default');
R2 = mvnrnd([3,1],sigma,50);

% b :PCA
    % apply PCA of the 100 sample,mean,eigen,eigenvectors
[coeff1,score,eigen1,tsquared,explained,mu1] = pca(R1);


[coeff2,score,eigen2,tsquared,explained,mu2] = pca(R2);

    %noise estimation:square root of the smallest eigenvalue
err1 = sqrt(min(eigen1));
err2 = sqrt(min(eigen2));


U1 = [coeff1(1,1),coeff1(2,1)];
U1 = U1/norm(U1)*sqrt(eigen1(1));

U2 = [coeff1(1,2),coeff1(2,2)];
U2 = U2/norm(U2)*sqrt(eigen1(2));

V1 = [coeff2(1,1),coeff2(2,1)];
V1 = V1/norm(V1)*sqrt(eigen2(1));

V2 = [coeff2(1,2),coeff1(2,2)];
V2 = V2/norm(V2)*sqrt(eigen2(2));

% Display
figure(1)
scatter(R1(:,1),R1(:,2),'green');
hold on
scatter(R2(:,1),R2(:,2),'green');
hold on
quiver(mu1(1),mu1(2),U1(1),U1(2),'Color','red','LineWidth',2)
hold on
quiver(mu1(1),mu1(2),U2(1),U2(2),'Color','blue','LineWidth',2)
hold on
quiver(mu2(1),mu2(2),V1(1),V1(2),'Color','red','LineWidth',2)
hold on
quiver(mu2(1),mu2(2),V2(1),V2(2),'Color','blue','LineWidth',2)
p1 = 'estimated noise for the 2 samples is ';
title([p1,num2str(err1)])
daspect([1 1 1])














