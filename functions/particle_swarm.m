function [answer] = particle_swarm(alpha, beta, gamma, n_iter, m, type)
if type == 1
    n_args = 2;
    x = unifrnd(-10, 10, m, n_args);
    v = unifrnd(-3, 3, m, n_args);
end
if type == 2
    n_args = 3;
    x = zeros(m, n_args);
    x(:, 1) = unifrnd(-0.2, 1, m, 1);
    x(:, 2) = unifrnd(-0.3, 1, m, 1);
    x(:, 3) = unifrnd(-0.5, 1, m, 1);
    v = unifrnd(-0.05, 0.05, m, n_args);
end
p = x;
[~, ind] = min(loss(p, type));
J = x(ind, :);
for i = 1:n_iter
    xi_1 = unifrnd(0, 1, m, n_args);
    xi_2 = unifrnd(0, 1, m, n_args);
    v = alpha .* v + beta .* (xi_1 .* (p - x)) + gamma .* xi_2 .* (J - x);
    x = x + v;
    for j = 1:m
        if loss(x(j, :), type) < loss(p(j, :), type)
            p(j, :) = x(j, :);
        end
    end
    [~, ind] = min(loss(p, type));
    J = x(ind, :);
answer = J;
end

