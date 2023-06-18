function [func] = loss(x, type)
if type == 1
    func = (1 - x(:, 1)).^2 + 100 * (x(:, 2) - x(:, 1).^2).^2;
end
if type == 2
    func = 0.01 .* (x(:, 1) - 0.5) .^ 2 + abs(x(:, 1).^2 - x(:, 2)) + abs(x(:, 1).^2 - x(:, 3));
end

