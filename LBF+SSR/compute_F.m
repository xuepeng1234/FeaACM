function F = compute_F(I, K, M)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

KMI = convn(M .* I, K, 'same');
KM = convn(M, K, 'same');
F = KMI ./ KM;

end

