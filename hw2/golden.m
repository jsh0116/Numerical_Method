function [x_min, f_min] = golden(f, a, b)
% f: target objective function
% a, b: interval
% x_min: local minimum of f
% f_min: f(x_min)

x_min = 0;
f_min = 0;

gr = (sqrt(5) - 1) / 2; % golden ratio
x0 = a + (1 - gr)*(b-a);
x1 = a + gr*(b-a);
f0 = f(x0);
f1 = f(x1);
i = 1;
while i>=1
    if f0>=f1
        a = x0;
        x0 = x1;
        f0 = f1;
        x1 = a + gr*(b-a);
        f1 = f(x1);
    else
        b = x1;
        x1 = x0;
        f1 = f0;
        x0 = a + (1-gr)*(b-a);
        f0 = f(x0);
    if abs(x0-x1) > 1e-5, i = i+1;
    else, break;
    end
    end
end
x_min = x0;
f_min = f0;
end
