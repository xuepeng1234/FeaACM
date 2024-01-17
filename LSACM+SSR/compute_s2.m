function [s1, s2] = compute_s2(I, K, b, c1, c2, M)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

s1 = zeros(size(I));
s2 = zeros(size(I));
for k = 1:size(I, 3)
	KIM2 = conv2(M(:, :, 1) .* I(:, :, k).^2, K, 'same');
	bc = b(:, :, k) .* c1(:, :, k);
	bcKIM = -2 * bc .* conv2(M(:, :, 1) .* I(:, :, k), K, 'same');
	bc2KM = bc.^2 .* conv2(M(:, :, 1), K, 'same');
	NM = sum(sum(KIM2 + bcKIM + bc2KM));
	KM = conv2(M(:, :, 1), K, 'same');
	d = sum(sum(KM));
	d = d + (d == 0)  * eps;
	s1(:, :, k) = NM / d;
    
    KIM2 = conv2(M(:, :, 2) .* I(:, :, k).^2, K, 'same');
	bc = b(:, :, k) .* c2(:, :, k);
	bcKIM = -2 * bc .* conv2(M(:, :, 2) .* I(:, :, k), K, 'same');
	bc2KM = bc.^2 .* conv2(M(:, :, 2), K, 'same');
	NM = sum(sum(KIM2 + bcKIM + bc2KM));
	KM = conv2(M(:, :, 2), K, 'same');
	d = sum(sum(KM));
	d = d + (d == 0)  * eps;
	s2(:, :, k) = NM / d;
end

end

