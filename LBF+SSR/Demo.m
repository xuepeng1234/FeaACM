clear all; close all; clc;

addpath('./image');
addpath('./imgs');
flag = 26;

switch flag
    case 1
        Img = imread('2892179357_58d8f94f51.jpg');
        Img = double(imnoise(Img, 'speckle', 0.05));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5;
        Iternum = 50; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.008 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 10).^2 + (Y - row / 2).^2 / 3) - 50;
        GT = imread('2892179357_58d8f94f51_gt.png');
	case 10
        Img = double(imread('8068.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5.5;
        Iternum = 3500; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.02 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.1;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 110).^2 / 3 + (Y - row / 2 - 10).^2) - 60;
        GT = imread('10.bmp');
    case 11
        Img = double(imread('163014.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 4;
        Iternum = 1500; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.03 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.1;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 50).^2 + (Y - row / 2 + 60).^2 / 3) - 50;
        GT = imread('11.bmp');
    case 12
        Img = double(imread('196027.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5;
        Iternum = 1650; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.03 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 10).^2 + (Y - row / 2 + 50).^2 / 3) - 50;
        GT = imread('12.bmp');
    case 13
        Img = double(imread('196015.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 4;
        Iternum = 1000; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.06 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 10).^2 / 2 + (Y - row / 2 - 10).^2) - 20;
        GT = imread('13.bmp');
    case 14
        Img = double(imread('135069.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5;
        Iternum = 1500; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.01 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 25).^2 + (Y - row / 2 + 40).^2) - 25;
        GT = imread('14.bmp');
    case 15
        Img = double(imread('66075.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5;
        Iternum = 1700; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.07 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2).^2 + (Y - row / 2 + 20).^2 / 4) - 60;
        GT = imread('15.bmp');
    case 16
        Img = double(imread('100039.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 3.5;
        Iternum = 800; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 1;
        L2 = 2;
        nu = 0.05 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 5).^2 + (Y - row / 2 - 75).^2 / 3) - 50;
        GT = imread('16.bmp');
    case 17
        Img = double(imread('103078.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 3;
        Iternum = 1000; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.05 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 40).^2 / 8 + (Y - row / 2 + 5).^2) - 35;
        GT = imread('17.bmp');
    case 18
        Img = double(imread('208001.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 2.5;
        Iternum = 1400; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.05 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 40).^2 + (Y - row / 2 - 65).^2 / 16) - 30;
        GT = imread('18.bmp');
    case 19
        Img = double(imread('48025.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 10;
        Iternum = 400; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.06 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2).^2 / 5 + (Y - row / 2 - 70).^2) - 50;
        GT = imread('19.bmp');
    case 20
        Img = double(imread('3096.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 10;
        Iternum = 450; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.08 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.6;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 60).^2 / 2 + (Y - row / 2 - 50).^2) - 30;
        GT = imread('20.jpg');
    case 21
        Img = double(imread('3063.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 15;
        Iternum = 1500; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.1 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 50).^2 / 3 + (Y - row / 2 - 30).^2) - 50;
        GT = imread('21.jpg');
    case 22
        Img = double(imread('86016.jpg'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 10;
        Iternum = 100; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.08 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2).^2 / 3 + (Y - row / 2 + 60).^2) - 80;
        GT = imread('22.jpg');
    case 23
        Img = double(imread('bbmf_lancaster_july_06.png'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 7.5;
        Iternum = 50; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.01 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2).^2 + (Y - row / 2 - 10).^2) - 30;
        GT = imread('23.bmp');
    case 24
        Img = double(imread('chain98.png'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 15;
        Iternum = 300; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 2;
        nu = 0.01 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.1;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2).^2 / 5 + (Y - row / 2 + 10).^2) - 30;
        GT = imread('24.bmp');
    case 25
        Img = double(imread('dscf3583.png'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 10;
        Iternum = 1500; % Iternum is the number of iterations
        epsilon = 1.5;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.03 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.1;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 40).^2 / 2 + (Y - row / 2 - 40).^2) - 50;
        GT = imread('25.bmp');
    case 26
        Img = double(imread('20060319_087.png'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 5;
%         Iternum = 500; % Iternum is the number of iterations
        Iternum = 800; % Iternum is the number of iterations
        epsilon = 1;
        timestep = 1;
        L1 = 1;
        L2 = 1;
        nu = 0.1 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 - 40).^2 + (Y - row / 2).^2 / 3) - 30;
        GT = imread('26.bmp');
    case 27
        Img = double(imread('hpim1242.png'));
        row = size(Img, 1);
        col = size(Img, 2);
        sigma = 1.5;
        Iternum = 80; % Iternum is the number of iterations
        epsilon = 0.1;
        timestep = 1;
        L1 = 2;
        L2 = 1;
        nu = 0.01 * 255^2; % the parameter of length regularization term
        mu = 0.1; % the parameter of signed distance function
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:col, 1:row);
        phi = sqrt((X - col / 2 + 25).^2 + (Y - row / 2 + 5).^2 / 3) - 30;
        GT = imread('27.bmp');
end

%%
K = fspecial('gaussian', 1 + 4 * sigma, sigma);

tic

I = imresize(Img, 0.1, 'nearest');
[nrow, ncol, ndim] = size(I);
Is = zeros(1, nrow * ncol);
nn = 0;
for i = 1:nrow
	for j = 1:ncol
        nn = nn + 1;
        for k = 1:ndim
            Is(k, nn) = I(i, j, k);
        end
	end
end
affine = true;
alpha = 20;
z = admmLasso_mat_func(Is, affine, alpha);
z = (z + z') / 2;
nn = nrow * ncol;
ma = max(max(z));
mi = min(min(z));
z1 = zeros(nrow, ncol, nn);
for i = 1:nrow
	for j = 1:ncol
        for k = 1:nn
            z1(i, j, k) = ((z((i - 1) * ncol + j, k) - mi) / (ma - mi)) * 255;
        end
	end
end
z1 = imresize3(z1, [row col nn], 'linear');

Ii = [];
E = [];  % store the energy

figure; imshow(uint8(Img)); hold on; axis off;
hold on;
[c, h] = contour(phi, [0 0], 'r', 'LineWidth', 2);
pause(0.01);

for i = 1:Iternum
    H_eps = (1 + (2 / pi) * atan(phi ./ epsilon)) / 2;
    Delta_eps = (1 / pi) .* (epsilon ./ (epsilon^2 + phi.^2));

    F1 = compute_F(Img, K, H_eps);
    F2 = compute_F(Img, K, 1 - H_eps);
    U1 = sum(sum(z1 .* H_eps)) ./ sum(sum(H_eps));
    U2 = sum(sum(z1 .* (1 - H_eps))) ./ sum(sum((1 - H_eps)));
%     d1 = compute_d(Img, K, z1, F1, U1, L1, alpha1, alpha2);
% 	d2 = compute_d(Img, K, z1, F2, U2, L2, alpha1, alpha2);
    
%     T_Region = Delta_eps .* (d2 - d1);
    R = compute_R(Img, K, z1, F1, F2, U1, U2, L1, L2, alpha1, alpha2);
    T_Region = -Delta_eps .* R;
    T_Regulator = nu .* Delta_eps .* kappa(phi) + mu .* (del2(phi) - kappa(phi));
    
    phi = phi + timestep .* (T_Region + T_Regulator);
   
    Ii = [Ii, i];
    e1 = sum(sum(sum(alpha1 * L1 * (Img.^2 - 2 * Img .* convn(F1, K, 'same') + convn(F1.^2, K, 'same')) .* H_eps)));
    e2 = sum(sum(sum(alpha1 * L2 * (Img.^2 - 2 * Img .* convn(F2, K, 'same') + convn(F2.^2, K, 'same')) .* (1 - H_eps))));
    e3 = sum(sum(sum(alpha2 * (z1 - U1).^2 .* H_eps)));
    e4 = sum(sum(sum(alpha2 * (z1 - U2).^2 .* (1 - H_eps))));
    e5 = sum(sum(nu * Delta_eps .* kappa(phi) + mu / 2 * (kappa(phi) - 1).^2));
    e = e1 + e2 + e3 + e4 + e5;
    E = [E, e];
    
    if mod(i, 10) == 0
        imshow(uint8(Img));hold on;
        contour(phi, [0 0], 'r', 'LineWidth', 2);
        iterNum = [num2str(i), 'iterations'];  
%         title(iterNum);
        hold off;        
        pause(0.01);
        if i == Iternum
            figure;
            mask = Mask(phi);
            imshow(mask);
            mask1 = logical(mask);
            GT1 = logical(GT);
            JS = jaccard(mask1, GT1);
            Dice = dice(mask1, GT1);
        end
    end
end

toc

figure();
scatter(Ii, E, 'k', '.');
% axis([0 50 2.6*10^8 3.4*10^8]);
set(gca, 'FontName', 'Times New Rome', 'FontSize', 20);

