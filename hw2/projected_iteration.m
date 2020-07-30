function [V, D] = projected_iteration(A)
% A: nxn matrix
% V: nxn matrix whose column vectors are eigenvectors of A
% D: nxn diagonal matrix whose diagonal elements are eigenvalues of A

k = size(A,1);
V = zeros(k);
D = zeros(k);
V = [];
for j = 1:k
    v_l = [1;1;1];
    for i = 1:100
        u = v_l - proj(v_l, V);
        w = A*u;
        v_l = w/norm(w);
    end
    V = [v_l V];
    lamda = (v_l.'*A*v_l)/(v_l.'*v_l);
    D(k-j+1,k-j+1) = lamda;
end
end