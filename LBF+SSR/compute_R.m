function R = compute_R(I, K, Z, F1, F2, U1, U2, L1, L2, alpha1, alpha2)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

n1 = I.^2 .* (L1 - L2);
n2 = - 2 * I .* convn((L1 * F1 - L2 * F2), K, 'same');
n3 = convn((L1 * F1 .^ 2 - L2 * F2 .^ 2), K, 'same');
t1 = sum(n1 + n2 + n3, 3);
t2 = sum((Z - U1).^2 - (Z - U2).^2, 3);
R = alpha1 * t1 + alpha2 * t2;

end

