function x = create_random_x(int_idx, m, n)
    x = rand(m, n) * 100;
    x(:, int_idx) = randi([0, 100], m, length(int_idx));
end

