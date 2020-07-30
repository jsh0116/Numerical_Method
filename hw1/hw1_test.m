close all
clear
clc

%--------------------------------------------------------------------------
% Part 1: LU decomposition

% Tolerance
tol = 1e-8;

% Target matrices
A = [2 1 1; 4 -6 0; -2 7 2];
B = [2 3 1 5; 6 13 5 19; 2 19 10 23; 4 10 11 31];

% Do LU decomposition for matrix A
%[L, U] = hw1_lu_sol(A);
[L, U] = hw1_lu(A);

% Check results
disp(istril(L));
disp(istriu(U));
disp(norm(L*U-A, 'fro') < tol);

% Do LU decomposition for matrix B
%[L, U] = hw1_lu_sol(B);
[L, U] = hw1_lu(B);

% Check results
disp(istril(L));
disp(istriu(U));
disp(norm(L*U-B, 'fro') < tol);

%--------------------------------------------------------------------------
% Part 2: Image alignment

% Corresponding points (x; y)
pA = [120 422 106 557; ...
       28   6 472 400];
pB = [201 501  81 536; ...
        6  28 420 462];

% Load images
I1 = imread('book1.jpg');
I2 = imread('book2.jpg');

% Plot points
N = size(pA,2);
figure(1);
imshow(I1, []);
for i = 1:N
    rectangle('Position', [pA(1,i)-4 pA(2,i)-4 8 8], 'FaceColor', 'r');
end
title('Image 1');
figure(2);
imshow(I2, []);
for i = 1:N
    rectangle('Position', [pB(1,i)-4 pB(2,i)-4 8 8], 'FaceColor', 'r');
end
title('Image 2');

% Compute transformation matrix from point correspondences
%T = hw1_transform_sol(pA, pB);
T = hw1_transform(pA, pB);

% Get the inverse transformation from image2 to image1
invT = inv(T);

% Use interp2 to get transformed image1
[xi, yi] = meshgrid(1:640, 1:480);
xx = invT(1,1)*xi + invT(1,2)*yi + invT(1,3);
yy = invT(2,1)*xi + invT(2,2)*yi + invT(2,3);
foo1 = interp2(double(I1), xx, yy);
figure(3);
imshow(uint8(foo1));
title('Transformed Image 1');

% Check results
pA = [pA; ones(1,N)];
tA = T*pA;
error = sqrt(sum((tA(1:2,:)-pB).^2,1));
disp(all(error < 12.0));

