function d = compute_dd2(I, Z, K, b, c, s, uu, alpha1, alpha2)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

n1 = sum(I.^2 .* convn(1 ./ s, K, 'same'), 3);
n2 = sum(-2 * c .* I .* convn(b ./ s, K, 'same'), 3);
n3 = sum(c.^2 .* convn(b.^2 ./ s, K, 'same'), 3);
t1 = sum(convn(log(sqrt(2 * pi .* s)), K, 'same'), 3) + (n1 + n2 + n3) ./ 2;
t2 = sum((Z - uu).^2, 3);
d = alpha1 * t1 + alpha2 * t2;
% d = t1;

end

