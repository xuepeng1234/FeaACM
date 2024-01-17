function s = compute_s(I, K, b, c, M)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

s = zeros(size(I));
I2 = I.^2;
for i = 1:size(M, 3)
	KIM2 = conv2(M(:, :, i) .* I2, K, 'same');
	bc = b .* c(:, :, i);
	bcKIM = -2 * bc .* conv2(M(:, :, i) .* I, K, 'same');
	bc2KM = bc.^2 .* conv2(M(:, :, i), K, 'same');
	NM = sum(sum(KIM2 + bcKIM + bc2KM));
	KM = conv2(M(:, :, i), K, 'same');
	d = sum(sum(KM));
	d = d + (d == 0)  * eps;
	s(:, :, i) = NM / d;
end

end

