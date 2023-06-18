function vals = func_3(x, c, A, b)
    vals = x * c.';
    vals(constraint(x, A, b) == 0) = 0;
end