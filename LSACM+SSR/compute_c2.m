function [c1, c2] = compute_c2(I, K, M, b)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

c1 = zeros(size(I));
c2 = zeros(size(I));

for k = 1:size(I, 3)
    KbIM = conv2(b(:, :, k), K, 'same') .* I(:, :, k) .* M(:, :, 1);
    Kb2M = conv2(b(:, :, k).^2, K, 'same') .* M(:, :, 1);
    de = sum(sum(Kb2M));
    de = de + (de == 0) * eps;
    c1(:, :, k) = sum(sum(KbIM)) / de; % c1 is the region of inside contour
    
    KbIM = conv2(b(:, :, k), K, 'same') .* I(:, :, k) .* M(:, :, 2);
    Kb2M = conv2(b(:, :, k).^2, K, 'same') .* M(:, :, 2);
    de = sum(sum(Kb2M));
    de = de + (de == 0) * eps;
    c2(:, :, k) = sum(sum(KbIM)) / de; % c1 is the region of outside contour
end

end

