function d = compute_d(I, K, Z, F, U, lamda, alpha1, alpha2)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

n1 = sum(convn((I - F).^2, K, 'same'), 3) / size(I, 3);
n2 = sum((Z - U).^2, 3);
d = alpha1 * lamda * n1 + alpha2 * n2;

end

