function [x] = new_heatalg(a, n_iter, T_0, alpha)
x_old = unifrnd(-10, 10);
T = T_0;
for i = 1:n_iter
    loss_old = loss_heat(x_old, a);
    x_new = x_old + unifrnd(-1, 1);
    T = T * alpha;
    loss_new = loss_heat(x_new, a);
    delta_loss = loss_new - loss_old;
    if delta_loss < 0
        x_old = x_new;
    end
    if delta_loss >= 0
        prob = exp(-delta_loss/T);
        if prob > unifrnd(0,1)
            x_old = x_new;
        end
    end
x = x_old;
end