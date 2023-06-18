function [h] = calculate(q, n)
h = 0;
for i = 1:n
    for j = i+1:n
        if abs(q(i) - q(j)) == abs(i-j)
            h = h + 2;
        end
    end
end
