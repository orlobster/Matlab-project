function [answer] = multistart(n_times)
loss_best = 1000;
x = zeros(n_times, 3);
for i = 1:n_times
    x = particle_swarm(0.6, 0.3, 0.3, 10000, 100, 2);
    if loss(x, 2) < loss_best
        loss_best = loss(x, 2);
        answer = x;
    end
end

