function m = Mask(phi)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

m = ones(size(phi));
m = m .* (phi < 0);

end

