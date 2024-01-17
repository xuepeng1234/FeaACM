function H = Heaviside(u, epsilon)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

H = 0.5 * (1 + 2 / pi * atan(u ./ epsilon));

% H = (u > epsilon) .* 1;
% H = H + (abs(u) <= epsilon) .* (0.5 * (1 + u / epsilon + sin((pi * u) / epsilon) / pi));

end

