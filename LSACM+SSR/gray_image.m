function JS = gray_image(img, I, K, phi, dim, Iternum, epsilon, timestep, mu, nu, alpha1, alpha2, GT)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

[row, col] = size(img);
[nrow, ncol] = size(I);

figure; imshow(uint8(img)); hold on; axis off;
hold on;
[c, h] = contour(phi, [0 0], 'r', 'LineWidth', 2);
pause(0.01);

Is = zeros(1, nrow * ncol);
nn = 0;
for i = 1:nrow
	for j = 1:ncol
        nn = nn + 1;
        Is(1, nn) = I(i, j);
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

%-----Parameter initialization
b = ones(row, col);
s = zeros(row, col);
for i = 1:dim
    s(:, :, i) = i;
end

%----------------------------------------
for i = 1:Iternum
	M = compute_M(phi, epsilon, row, col, dim); % the membership function, i.e., M(:,:,1)=H(phi),M(:,:,2)=1-H(phi)
    c = compute_c(img, K, M, b);
    b = compute_b(img, K, M, c, s);
    s = compute_s(img, K, b, c, M); % si is the variance of original image

    uu1 = sum(sum(z1 .* M(:, :, 1))) ./ sum(sum(M(:, :, 1)));
    uu2 = sum(sum(z1 .* M(:, :, 2))) ./ sum(sum(M(:, :, 2)));

    d = compute_d2(img, z1, K, b, c, s, uu1, uu2, alpha1, alpha2);

%     phi = NeumannBoundCond(phi);
%     DiracF = Dirac(phi, epsilon);
%     T_Region = (d2 - d1) .* DiracF;
%     T_Regulator = nu .* DiracF .* kappa(phi) + mu .* (del2(phi) - kappa(phi));
%     phi = phi + timestep .* (T_Region + T_Regulator);
    phi = TwoPhase(phi, d, epsilon, timestep, mu, nu);
%     phi = phi + delt2 * 4 * del2(phi); % level set regularization
    %----------------------------------------
    if mod(i, 10) == 0
        imshow(uint8(img));hold on;
        contour(phi, [0 0], 'r', 'LineWidth', 2);
%         iterNum = [num2str(i), 'iterations'];  
%         title(iterNum); hold off;
        pause(0.0001);
    end
end

end

