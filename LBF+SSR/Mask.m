function m = Mask(phi)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

m = ones(size(phi));
m = m .* (phi < 0);

end

