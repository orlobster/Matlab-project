function [q] = heatalg(q_0, n_iter, T_0, alpha)
q_old = q_0;
n = length(q_old);
T = T_0;
for i = 1:n_iter
    loss_old = calculate(q_old, n);
    if loss_old == 0
        q = q_old;
        break
    end
    q_new = q_old;
    ind = randi(numel(q_new),1,2);
    q_new(ind) = q_new(ind([2,1]));
    T = T * alpha;
    loss_new = calculate(q_new, n);
    delta_loss = loss_new - loss_old;
    if delta_loss < 0
        q_old = q_new;
    end
    if delta_loss >= 0
        prob = exp(-delta_loss/T);
        if prob > unifrnd(0,1)
            q_old = q_new;
        end
    end
end
