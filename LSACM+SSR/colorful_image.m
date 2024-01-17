function phi = colorful_image(img, I, K, phi, dim, Iternum, epsilon, timestep, mu, nu, alpha1, alpha2, GT)

phi0 = phi; % phi0 is the initial contour
row = size(img, 1);
col = size(img, 2);
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

%-----Parameter initialization
b = ones(size(img));
s1 = zeros(size(img));
s2 = zeros(size(img));
for i = 1:size(img, 3)
    s1(:, :, i) = 1;
    s2(:, :, i) = 2;
end

Ii = [];
E = [];

figure; imshow(uint8(img)); hold on; axis off;
hold on;
% [c, h] = contour(phi, [0 0], 'r', 'LineWidth', 2);
contour(phi, [0 0], 'r', 'LineWidth', 2);
pause(0.01);

%----------------------------------------
for i = 1:Iternum
	M = compute_M(phi, epsilon, row, col, dim); % the membership function, i.e., M(:,:,1)=H(phi),M(:,:,2)=1-H(phi)
    [c1, c2] = compute_c2(img, K, M, b);
    b = compute_b2(img, K, M, c1, c2, s1, s2);
    [s1, s2] = compute_s2(img, K, b, c1, c2, M);

    uu1 = sum(sum(z1 .* M(:, :, 1))) ./ sum(sum(M(:, :, 1)));
    uu2 = sum(sum(z1 .* M(:, :, 2))) ./ sum(sum(M(:, :, 2)));

    d1 = compute_dd2(img, z1, K, b, c1, s1, uu1, alpha1, alpha2);
    d2 = compute_dd2(img, z1, K, b, c2, s2, uu2, alpha1, alpha2);

    phi = TwoPhase2(phi, d1, d2, epsilon, timestep, mu, nu);
    
    Ii = [Ii, i];
    a = log(s1) + (img - b .* c1).^2 ./ (2 * s1.^2);
    e1 = sum(sum(sum(alpha1 * convn(a, K, 'same') .* M(:, :, 1))));
    b = log(s2) + (img - b .* c2).^2 ./ (2 * s2.^2);
    e2 = sum(sum(sum(alpha1 * convn(b, K, 'same') .* M(:, :, 2))));
    e3 = sum(sum(sum(alpha2 * (z1 - uu1).^2 .* M(:, :, 1))));
    e4 = sum(sum(sum(alpha2 * (z1 - uu2).^2 .* M(:, :, 2))));
    e5 = sum(sum(nu * Dirac(phi, epsilon) .* kappa(phi) + mu / 2 * (kappa(phi) - 1).^2));
    e = e1 + e2 + e3 + e4 + e5;
    E = [E, e];
    
    %----------------------------------------
    if mod(i, 10) == 0
        imshow(uint8(img));hold on;
%         if i == Iternum
%             contour(phi0, [0 0], 'b', 'LineWidth', 2);
%         end
%         annotation('arrow', [0.35, 0.4], [0.88, 0.8], 'color', [1 1 0], 'LineWidth', 5);
        hold on;
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
        end
    end
end

figure();
scatter(Ii, E, 'k', '.');
% axis([0 50 2.6*10^8 3.4*10^8]);
set(gca, 'FontName', 'Times New Rome', 'FontSize', 20);

end

