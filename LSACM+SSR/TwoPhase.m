function phi = TwoPhase(phi, d, epsilon, timestep, mu, nu)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

phi = NeumannBoundCond(phi);
DiracF = Dirac(phi, epsilon);

phi = phi + timestep * ((d(:, :, 2) - d(:, :, 1) + nu .* kappa(phi)) .* DiracF + mu * (del2(phi) - kappa(phi))); % level set evolution

end

