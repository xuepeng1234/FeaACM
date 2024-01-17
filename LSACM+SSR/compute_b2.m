function b = compute_b2(I, K, M, c1, c2, s1, s2)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

b = zeros(size(I));

for k = 1:size(I, 3)
    cs1 = c1(:, :, k) ./ s1(:, :, k);
    c2s1 = c1(:, :, k).^2 ./ s1(:, :, k);
    J1 = conv2(I(:, :, k) .* M(:, :, 1), K, 'same') .* cs1;
    J2 = conv2(M(:, :, 1), K, 'same') .* c2s1;
    cs2 = c2(:, :, k) ./ s2(:, :, k);
    c2s2 = c2(:, :, k).^2 ./ s2(:, :, k);
    J3 = conv2(I(:, :, k) .* M(:, :, 2), K, 'same') .* cs2;
    J4 = conv2(M(:, :, 2), K, 'same') .* c2s2;
    b(:, :, k) = (J1 + J3) ./ (J2 + J4 + ((J2 + J4) == 0) .* eps);
end

end

