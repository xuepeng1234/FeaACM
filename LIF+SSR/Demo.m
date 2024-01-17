clear all; close all; clc;

addpath('./image');
addpath('./imgs');

flag = 27;
switch flag
    case 1
        Img = double(imread('3c.bmp'));
        sigma = 7.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.45; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
        K_phi = fspecial('gaussian', 5, sigma_phi);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1.5;
        IterNum = 50;
        nu = 0.0001 * 255^2;
        mu = 0.1;
        alpha1 = 0.8;
        alpha2 = 1 - alpha1;
        phi = ones(nrow, ncol);
        phi(15:nrow-15, 15:ncol-15) = -1;
    case 2
        Img = double(imread('brain.bmp'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.65; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
        K_phi = fspecial('gaussian', 5, sigma_phi);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 0.025;
        epsilon = 1;
        IterNum = 500;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.7;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2).^2 / 2) - 20;
    case 3
        Img = double(imread('vessel3.bmp'));
%         sigma = 10; % the key parameter which needs to be tuned properly.
        sigma = 5;
        sigma_phi = 0.6; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
        K_phi = fspecial('gaussian', 5, sigma_phi);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1.5;
        IterNum = 20000;
        nu = 0.001 * 255^2;
        mu = 0.1;
        alpha1 = 0.95;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2 + 50).^2) - 10;
    case 4
        Img = double(imread('vessel2.bmp'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.6; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
        K_phi = fspecial('gaussian', 5, sigma_phi);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1.5;
        IterNum = 6500;
        alpha1 = 0.9;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 10).^2 + (Y - nrow / 2 + 30).^2) - 10;
    case 5
        Img = double(imread('picture_458.png'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 200;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 30).^2 + (Y - nrow / 2).^2) - 25;
        GT = imread('picture_458.bmp');
    case 6
        Img = double(imread('nitpix_p1280114.png'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 50;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2).^2) - 50;
        GT = imread('nitpix_p1280114_35.bmp');
    case 7
        Img = double(imread('moth061304_0679.png'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 500;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2).^2 / 3) - 30;
        GT = imread('moth061304_0679_27.bmp');
    case 9
        Img = double(imread('113044.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 3500;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 20).^2 / 2 + (Y - nrow / 2 + 15).^2) - 120;
        GT = imread('9.bmp');
    case 10
        Img = double(imread('8068.jpg'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
%         IterNum = 800;
        IterNum = 1200;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 110).^2 / 2 + (Y - nrow / 2 - 10).^2) - 60;
%         phi = ones(nrow, ncol);
%         phi(120:230, 170:430) = -1;
        GT = imread('10.bmp');
    case 11
        Img = double(imread('163014.jpg'));
        sigma = 7.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1.5;
        IterNum = 620;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 50).^2 + (Y - nrow / 2 + 50).^2 / 3) - 50;
        GT = imread('11.bmp');
    case 12
        Img = double(imread('196027.jpg'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 950;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 10).^2 + (Y - nrow / 2 + 50).^2 / 3) - 50;
        GT = imread('12.bmp');
    case 13
        Img = double(imread('196015.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 520;
        nu = 0.04 * 255^2;
        mu = 0.1;
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 10).^2 / 2 + (Y - nrow / 2 - 10).^2) - 20;
        GT = imread('13.bmp');
    case 14
        Img = double(imread('135069.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 800;
        nu = 0.01 * 255^2;
        mu = 0.1;
        alpha1 = 0.8;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 25).^2 + (Y - nrow / 2 + 40).^2) - 25;
        GT = imread('14.bmp');
    case 15
        Img = double(imread('66075.jpg'));
        sigma = 3.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1.5;
        IterNum = 800;
        nu = 0.04 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 10).^2 + (Y - nrow / 2 + 20).^2 / 4) - 60;
        GT = imread('15.bmp');
    case 16
        Img = double(imread('100039.jpg'));
        sigma = 6; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 0.1;
        IterNum = 1400;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 10).^2 + (Y - nrow / 2 - 55).^2 / 3) - 50;
        GT = imread('16.bmp');
    case 17
        Img = double(imread('103078.jpg'));
        sigma = 2.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 2250;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 40).^2 / 9 + (Y - nrow / 2).^2) - 30;
        GT = imread('17.bmp');
    case 18
        Img = double(imread('208001.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 1250;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 40).^2 + (Y - nrow / 2 - 65).^2 / 16) - 30;
        GT = imread('18.bmp');
    case 19
        Img = double(imread('48025.jpg'));
        sigma = 6; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 0.1;
        IterNum = 2500;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.3;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 / 5 + (Y - nrow / 2 - 70).^2) - 50;
        GT = imread('19.bmp');
    case 20
        Img = double(imread('3096.jpg'));
        sigma = 15; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 500;
        nu = 0.06 * 255^2;
        mu = 0.1;
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 60).^2 / 2 + (Y - nrow / 2 - 50).^2) - 30;
        GT = imread('20.jpg');
    case 21
        Img = double(imread('3063.jpg'));
        sigma = 15; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 2.5;
        IterNum = 1000;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 50).^2 / 3 + (Y - nrow / 2 - 30).^2) - 50;
        GT = imread('21.jpg');
    case 22
        Img = double(imread('86016.jpg'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 200;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.5;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 / 3 + (Y - nrow / 2 + 60).^2) - 80;
        GT = imread('22.jpg');
    case 23
        Img = double(imread('bbmf_lancaster_july_06.png'));
        sigma = 7.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 50;
        nu = 0.01 * 255^2;
        mu = 0.1;
        alpha1 = 0.6;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2 - 10).^2) - 30;
        GT = imread('23.bmp');
    case 24
        Img = double(imread('chain98.png'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 400;
        nu = 0.01 * 255^2;
        mu = 0.1;
        alpha1 = 0.1;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 / 5 + (Y - nrow / 2 + 10).^2) - 30;
        GT = imread('24.bmp');
    case 25
        Img = double(imread('dscf3583.png'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 0.1;
        IterNum = 2200;
        nu = 0.03 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 40).^2 / 2 + (Y - nrow / 2 - 40).^2) - 50;
        GT = imread('25.bmp');
    case 26
        Img = double(imread('20060319_087.png'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 600;
        nu = 0.05 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 45).^2 + (Y - nrow / 2).^2 / 3) - 30;
        GT = imread('26.bmp');
    case 27
        Img = double(imread('hpim1242.png'));
        sigma = 1; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 2;
        IterNum = 500;
        nu = 0.007 * 255^2;
        mu = 0.1;
        alpha1 = 0.9;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 25).^2 + (Y - nrow / 2 + 10).^2 / 3) - 30;
        GT = imread('27.bmp');
    case 28
        Img = double(imread('100007.jpg'));
        sigma = 2.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 300;
        nu = 0.01 * 255^2;
        mu = 0.1;
        alpha1 = 0.9;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 60).^2 / 3 + (Y - nrow / 2 - 10).^2) - 25;
        GT = imread('33.bmp');
    case 29
        Img = double(imread('35070.jpg'));
        sigma = 2.5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 500;
        nu = 0.01 * 255^2;
        mu = 0.1;
        alpha1 = 0.9;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 50).^2 / 5 + (Y - nrow / 2).^2) - 50;
        GT = imread('148.bmp');
    case 30
        Img = double(imread('159091.jpg'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 700;
        nu = 0.001 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 80).^2 / 2 + (Y - nrow / 2 + 5).^2) - 50;
        GT = imread('159091.bmp');
    case 31
        Img = double(imread('2893016528_eea3aa6c46.jpg'));
        sigma = 10; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 300;
        nu = 0.001 * 255^2;
        mu = 0.1;
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2).^2 + (Y - nrow / 2 + 50).^2 / 2) - 80;
        GT = imread('2893016528_eea3aa6c46.png');
    case 32
        Img = double(imread('2704220545_351ea9bb0c.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 100;
        nu = 0.001 * 255^2;
        mu = 0.1;
        alpha1 = 0.2;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 + 40).^2 / 5 + (Y - nrow / 2 - 30).^2) - 25;
        GT = imread('2704220545_351ea9bb0c.png');
    case 33
        Img = double(imread('369292516_70b0e4838f.jpg'));
        sigma = 5; % the key parameter which needs to be tuned properly.
        sigma_phi = 0.5; % the variance of regularized Gaussian kernel
        K = fspecial('gaussian', 2 * round(2 * sigma) + 1, sigma);
%         K_phi = fspecial('gaussian', 9, sigma_phi);
        K_phi = fspecial('average', 9);
        nrow = size(Img, 1);
        ncol = size(Img, 2);
        timestep = 1;
        epsilon = 1;
        IterNum = 100;
        nu = 0.001 * 255^2;
        mu = 0.1;
        alpha1 = 0.4;
        alpha2 = 1 - alpha1;
        [X, Y] = meshgrid(1:ncol, 1:nrow);
        phi = sqrt((X - ncol / 2 - 20).^2 + (Y - nrow / 2 - 50).^2 / 8) - 50;
        GT = imread('369292516_70b0e4838f.png');
end

tic

Z = compute_ssr(Img);
Ii = [];
E = [];

figure; imshow(uint8(Img)); hold on;
contour(phi, [0 0], 'r', 'LineWidth', 2);

for n = 1:IterNum
	[phi, f1, f2, u1, u2, Hphi, DiracPhi] = LIF_SSR(Img, Z, phi, timestep, epsilon, nu, mu, alpha1, alpha2, K);
    Ii = [Ii, n];
    e1 = sum(sum(sum(alpha1 * (Img - f1 .* Hphi - f2 .* (1 - Hphi)).^2)));
    e2 = sum(sum(sum(alpha2 * (Z - u1 .* Hphi - u2 .* (1 - Hphi)).^2)));
    e3 = sum(sum(nu * DiracPhi .* kappa(phi) + mu / 2 * (kappa(phi) - 1).^2));
    e = e1 + e2 + e3;
    E = [E, e];
% 	phi = conv2(phi, K_phi, 'same');
	if mod(n, 10) == 0
        pause(0.0001);
        imshow(uint8(Img)); hold on;
        contour(phi, [0 0], 'r', 'LineWidth', 2);
        iterNum=[num2str(n), ' iterations'];        
%         title(iterNum);
        hold off;
	end
	if n == IterNum
        figure;
        mask = Mask(phi);
        imshow(mask);
        mask1 = logical(mask);
        GT1 = logical(GT);
        JS = jaccard(mask1, GT1);
        Dice = dice(mask1, GT1);
	end
end

toc

figure;
mesh(phi);

figure();
scatter(Ii, E, 'k', '.');
% axis([0 500 2.42*10^7 2.52*10^7]);
set(gca, 'FontName', 'Times New Rome', 'FontSize', 20);

