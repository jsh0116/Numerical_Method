function [T] = Image_Alignment(pA, pB)
% hw1_transform: compute transformation from A to B

% Number of points
N = size(pA,2);
% Initialize transformation matrix T
T = eye(3);

% Compute transformation matrix T (IMPLEMENT HERE!!)
A_ = zeros(2*N,2*(N-1));
B = zeros(2*N,1);
for j=1:N
    for i=1:N-1
        if i == N-1
            pA(i,j) = 1;
        end
        A_(j,i) = pA(i,j);
        A_(j+N,i+(N-1)) = pA(i,j);
    end
end
a = 1;
while a<=2*N
    for i=1:N-2
        for j = 1:N
            B(a,1) = pB(i,j);
            a = a+1;
        end
    end
end
X = A_ \ B;
T_ = reshape(reshape(X,2,3),3,2)';
for i=1:N/2
    for j=1:N-1
        T(i,j) = T_(i,j);
    end
end

end
