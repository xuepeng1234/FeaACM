function H = Heaviside(u, epsilon)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

H = 0.5 * (1 + 2 / pi * atan(u ./ epsilon));

% H = (u > epsilon) .* 1;
% H = H + (abs(u) <= epsilon) .* (0.5 * (1 + u / epsilon + sin((pi * u) / epsilon) / pi));

end

