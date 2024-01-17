function phi = TwoPhase2(phi, d1, d2, epsilon, timestep, mu, nu)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

phi = NeumannBoundCond(phi);
DiracF = Dirac(phi, epsilon);
F = sum(d2 - d1, 3);
% F = alpha1 * sum(d2 - d1, 3);
% S = alpha2 * sum((Z - uu1 .* M(:, :, 1) - uu2 .* M(:, :, 2)) .* (uu1 - uu2), 3);

phi = phi + timestep * ((F + nu .* kappa(phi)) .* DiracF + mu * (del2(phi) - kappa(phi))); % level set evolution
% phi = phi + timestep * ((F + S + nu .* kappa(phi)) .* DiracF + mu * (del2(phi) - kappa(phi))); % level set evolution

end

