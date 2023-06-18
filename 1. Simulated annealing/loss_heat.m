function [f] = loss_heat(x, a)
f = x^2 * (2 + abs(sin(a*x)));
end
