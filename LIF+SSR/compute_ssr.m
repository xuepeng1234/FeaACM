function z1 = compute_ssr(img)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

I = imresize(img, 0.1, 'nearest');
[row, col, dim] = size(img);
[nrow, ncol, ndim] = size(I);

Is = zeros(ndim, nrow * ncol);
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

end

