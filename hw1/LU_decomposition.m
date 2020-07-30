function [L, U] = LU_decomposition(A)
% hw1_lu: LU factorization without pivoting
% input
%   A : input square & invertible matrix
% output
%   L : lower triangular matrix
%   U : upper triangular matrix

[m,n] = size(A);
if m~=n
    error('Matrix A must be square');
end

% Initialize upper triangular matrix
U = A;
% Initialize lower triangular matrix
L = eye(n);
% Standard basis vectors
e = cell(1,n);
for i = 1:n
    e{i} = zeros(n,1);
    e{i}(i) = 1;
end

% Compute upper triangular matrix L (IMPLEMENT HERE!!!)
for i=1:n-1
   L(i+1:n,i) = U(i+1:n,i)/U(i,i);
% Compute lower triangular matrix U (IMPLEMENT HERE!!!)
   U(i+1:n,i:n) = U(i+1:n,i:n) - L(i+1:n,i)*U(i,i:n);
end

end
   
   


