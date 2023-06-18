function [x] = genetic_algorithm(m, m_c, l, n)
    x = rand(m, n) .* 20 - 10;
    for iter_ = 1:l
        [~, indexes] = sort(fit_func(func1(x)), 'descend');
        x = x(indexes, :);
        ind = randi([1, m], [m-m_c-1, 1]);
        xi = rand(m-m_c-1, n);
        fit = fit_func(func1(x));
        probas = fit(2:m-m_c) ./ (fit(2:m-m_c) + fit(ind));
        mask = 1 * (probas >= xi);
        x(2:m-m_c, :) = mask .* x(2:m-m_c, :) + (1 - mask) .* x(ind, :);
        x(m-m_c+1:m, :) = rand(m_c, n) .* 20 - 10;
    end
    x = x(1, :);
end

