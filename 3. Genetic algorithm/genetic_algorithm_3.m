function x = genetic_algorithm_3(m, m_c, l, n, c, A, b, int_idx)
    x = create_random_x(int_idx, m, n);
    for iteration = 1:l
        [~, indexes] = sort(func_3(x, c, A, b), 'descend');
        x = x(indexes, :);
        ind = randi([1, m], [m-m_c-1, 1]);
        xi = rand(m - m_c - 1, n);
        fit = func_3(x, c, A, b);
        probas = fit(2:m - m_c) ./ ((fit(2:m - m_c) + fit(ind)) + 1e-5);
        mask = probas >= xi;
        x(2:m - m_c, :) = mask .* x(2:m - m_c, :) + (1 - mask) .* x(ind, :);
        x(m - m_c + 1:m, :) = create_random_x(int_idx, m_c, n);
    end
    x = x(1, :);
end

