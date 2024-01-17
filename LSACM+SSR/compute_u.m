function [u1, u2] = compute_u(I, K, M)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

u1 = zeros(size(I));
u2 = zeros(size(I));

for k = 1:size(I, 3)
    KI = conv2(I(:, :, k), K, 'same');
    KONE = conv2(ones([size(I, 1) size(I, 2)]), K, 'same');
    I1 = I(:, :, k) .* M(:, :, 1); % enlarge the comparison of pixels inside and outside the zero level set
    temp1 = conv2(M(:, :, 1), K, 'same');
	temp2 = conv2(I1, K, 'same');
    u1(:, :, k) = temp2 ./ temp1;
    u2(:, :, k) = (KI - temp2) ./ (KONE - temp1);
end

end

