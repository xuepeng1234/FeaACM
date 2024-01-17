function M = compute_M(phi, epsilon, row, col, dim)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

phi = NeumannBoundCond(phi);
H1 = Heaviside(phi, epsilon);
M = zeros(row, col, dim);
M(:, :, 1) = H1;
M(:, :, 2) = 1 - H1;

end

