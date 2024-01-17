function b = compute_b(I, K, M, c, s)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

[J1, J2] = deal(zeros(size(I)));

for i = 1:size(M, 3)
    csi = c(:, :, i) ./ s(:, :, i);
    c2si = c(:, :, i).^2 ./ s(:, :, i);
    J1 = J1 + conv2(I .* M(:, :, i), K, 'same') .* csi;
    J2 = J2 + conv2(M(:, :, i), K, 'same') .* c2si;
end

b = J1 ./ (J2 + (J2 == 0) .* eps);

end

