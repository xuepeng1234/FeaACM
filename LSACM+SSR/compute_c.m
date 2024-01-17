function c = compute_c(I, K, M, b)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

c = zeros(size(M));

for i = 1:size(M, 3)
    KbIM = conv2(b, K, 'same') .* I .* M(:, :, i);
    Kb2M = conv2(b.^2, K, 'same') .* M(:, :, i);
    de = sum(sum(Kb2M));
    de = de + (de == 0) * eps;
    c(:, :, i) = sum(sum(KbIM)) / de;
end

end

