function F = compute_F(I, K, M)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

KMI = convn(M .* I, K, 'same');
KM = convn(M, K, 'same');
F = KMI ./ KM;

end

