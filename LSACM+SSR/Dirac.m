function DrcU = Dirac(u, epsilon)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

DrcU = (epsilon / pi) ./ (epsilon^2 + u.^2);

% DrcU = (abs(u) <= epsilon) .* (1 + cos((pi * u) / epsilon)) / (2 * epsilon);

end

