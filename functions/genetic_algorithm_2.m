function [result] = genetic_algorithm_2(m, m_c, l, n)
    x = binornd(1, 0.5, m, n);
    for iter_ = 1:l
        [~, indexes] = sort(fit_func(func2(x)), 'descend');
        x = x(indexes, :);
        ind = randi([1, m], [m-m_c-1, 1]);
        xi = rand(m-m_c-1, n);
        fit = fit_func(func2(x));
        probas = (fit(2:m-m_c) ./ (fit(2:m-m_c) + fit(ind))).';
        mask = 1 * (probas >= xi);
        x(2:m-m_c, :) = mask .* x(2:m-m_c, :) + (1 - mask) .* x(ind, :);
        x(m-m_c+1:m,:) = binornd(1, 0.5, m_c, n);
    end
    result = x(1,:);
end