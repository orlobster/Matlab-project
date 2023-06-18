function [result] = func2(x)
    loss = [];
    for i = 1:size(x, 1)
        a_1 = find(x(i,:) == 1);
        a_0 = find(x(i,:) == 0);
        loss(i) = abs(sum(a_1) - sum(a_0));
    end
    result = loss;
end