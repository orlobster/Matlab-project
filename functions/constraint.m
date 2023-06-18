function result = constraint(x, A, b)
    result = all((x * A.' <= b), 2);
end

