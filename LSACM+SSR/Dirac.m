function DrcU = Dirac(u, epsilon)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

DrcU = (epsilon / pi) ./ (epsilon^2 + u.^2);

% DrcU = (abs(u) <= epsilon) .* (1 + cos((pi * u) / epsilon)) / (2 * epsilon);

end

