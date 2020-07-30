function [root] = secant(func, x0, x1)
% func: target function
% x0, x1: interval
% root: output root0

root = 0; 
i = 1;
while i>=1
    root = x1 - (func(x1) * (x1-x0) / (func(x1)-func(x0)));
    if abs(root-x1)/abs(root) > 1e-5, i = i+1;
    else, break;
    end
    x0 = x1;
    x1 = root;
end
end


