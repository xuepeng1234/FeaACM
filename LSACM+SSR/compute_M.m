function M = compute_M(phi, epsilon, row, col, dim)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

phi = NeumannBoundCond(phi);
H1 = Heaviside(phi, epsilon);
M = zeros(row, col, dim);
M(:, :, 1) = H1;
M(:, :, 2) = 1 - H1;

end

