function [y] = func1(x)
    y = (x.^2) .* (1 + abs(sin(100 .* x)));
    y = sum(y, 2);
end

