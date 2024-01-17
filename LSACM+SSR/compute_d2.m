function d = compute_d2(I, Z, K, b, c, s, uu1, uu2, alpha1, alpha2)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

d = zeros(size(c));
for i = 1:size(c, 3)
	n1 = I.^2 .* conv2(1 ./ (s(:, :, i)), K, 'same');
    n2 = -2 * c(:, :, i) .* I .* conv2(b ./ s(:, :, i), K, 'same');
    n3 = c(:, :, i).^2 .* conv2(b.^2 ./ s(:, :, i), K, 'same');
    t1 = conv2(log(sqrt(2 * pi .* s(:, :, i))), K, 'same') + (n1 + n2 + n3) ./ 2;
    if i == 1
        t2 = sum((Z - uu1).^2, 3) / size(Z, 3);
    else
        t2 = sum((Z - uu2).^2, 3) / size(Z, 3);
    end
    d(:, :, i) = alpha1 * t1 + alpha2 * t2;
end

end

