function y = proj(x, V)
% x (nx1): input vector
% V (nxk): matrix
% y (nx1): projection of x onto the span of the column vectors of V

y = zeros(size(x));
% v1 = reshape(V(1:3),[3 1]);
% v2 = reshape(V(4:6),[3 1]);
% y = dot(v1,x)*v1 + dot(v2,x)*v2;
[m,n] = size(V);
for j=1:n
    tmp = dot(V(:,j),x)*V(:,j);
    y = y + tmp;
end
end


