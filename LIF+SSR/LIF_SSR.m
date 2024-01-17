function [phi, f1, f2, u1, u2, Hphi, DiracPhi] = LIF_SSR(I, Z, phi, timestep, epsilon, nu, mu, alpha1, alpha2, K)
phi = NeumannBoundCond(phi);

Hphi = Heaviside(phi, epsilon);
DiracPhi = Delta(phi, epsilon);

[f1, f2] = Local_Avr(I, Hphi, K);
[u1, u2] = Global_SSR(Z, Hphi, K);

n1 = alpha1 * sum((I - f1 .* Hphi - f2 .* (1 - Hphi)) .* (f1 - f2), 3);
if size(I, 3) == 1
        n2 = alpha2 * sum((Z - u1 .* Hphi - u2 .* (1 - Hphi)) .* (u1 - u2), 3) / size(Z, 3);
else
        n2 = alpha2 * sum((Z - u1 .* Hphi - u2 .* (1 - Hphi)) .* (u1 - u2), 3);
end
% phi = phi + timestep * (DiracPhi .* (n1 + n2));
phi = phi + timestep * (DiracPhi .* (n1 + n2 + nu * kappa(phi)) + mu * (del2(phi) - kappa(phi)));

function H = Heaviside(phi, epsilon)
H = 0.5 * (1 + (2 / pi) * atan(phi ./ epsilon));

function Delta_h = Delta(phi, epsilon)
Delta_h = (epsilon / pi) ./ (epsilon^2 + phi.^2);

function [f1, f2] = Local_Avr(I, H, K)
f1 = convn(I .* H, K, 'same');
c1 = conv2(H, K, 'same');
f1 = f1 ./ c1;
f2 = convn(I .* (1 - H), K, 'same');
c2 = conv2(1 - H, K, 'same');
f2 = f2 ./ c2;

function [u1, u2] = Global_SSR(Z, H, K)
% u1 = convn(Z .* H, K, 'same');
% c1 = conv2(H, K, 'same');
% u1 = sum(u1 ./ c1, 3);
% u2 = convn(Z .* (1 - H), K, 'same');
% c2 = conv2(1 - H, K, 'same');
% u2 = sum(u2 ./ c2, 3);
u1 = sum(sum(Z .* H)) ./ sum(sum(H));
u2 = sum(sum(Z .* (1 - H))) ./ sum(sum(1 - H));

function g = NeumannBoundCond(f)
% Make a function satisfy Neumann boundary condition
[nrow, ncol] = size(f);
g = f;
g([1 nrow], [1 ncol]) = g([3 nrow-2], [3 ncol-2]);  
g([1 nrow], 2:end-1) = g([3 nrow-2], 2:end-1);          
g(2:end-1, [1 ncol]) = g(2:end-1, [3 ncol-2]);