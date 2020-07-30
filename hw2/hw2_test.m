close all
clear
clc
keyboard;

% Tolerance level
tol = 1e-5;


%--------------------------------------------------------------------------
% Part 1: Project a vector onto a subspace

% Test data
x = [1; 2; 3];
V = [[1; 0; 0] [0; 1; 1]];

% Test projection
y = proj(x, V);

% Check
if norm(y-[1;5;5]) < tol
    fprintf('ok\n')
else
    fprintf('error\n')
end


%--------------------------------------------------------------------------
% Part 2: Projected iteration for eigen-decomposition

% Test data
v0 = [1; 1; 1];
A = [1 1 1; 1 2 3; 1 3 6];

% MATLAB eigen function
[V0, D0] = eig(A);
V0 = V0.*sign(V0(1,:));

% Projected iteration
[V1, D1] = projected_iteration(A);
V1 = V1.*sign(V1(1,:));

% Check
if norm(V0-V1) < tol
    fprintf('ok\n')
else
    fprintf('error\n')
end

%--------------------------------------------------------------------------
% Part 3: Secant method

% Use the secant method to determine the mass of the object with a
% drag coefficient of 0.25 kg/m to have a velocity of 36 m/s after 4 s of
% free fall. Note: The acceleration of gravity is 9.81 m/s^2.

% Velocity of a free-falling object as a function of gravitational
% acceleration g, mass m, drag coefficient cd, and time t:
% v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)

y = @(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)-36;
[mass] = secant(y, 140, 141);

mass0 = fzero(y, 140);

% Check
if norm(mass-mass0) < tol
    fprintf('ok\n')
else
    fprintf('error\n')
end


%--------------------------------------------------------------------------
% Part 4: Golden section search method

% Plot objective function
x = -2.0:0.1:4.0;
f = (x.^2)/10-2*sin(x);
figure;
plot(x,f);

% Test golden section search with [0, 4]
[xmin, fmin] = golden(@(x) (x^2)/10-2*sin(x), 0, 4);

% Use MATLAB fminbnd
[xmin0, fmin0] = fminbnd(@(x) (x^2)/10-2*sin(x), 0, 4);

% Check
if (norm(xmin-xmin0) < tol) || (norm(fmin-fmin0) < tol)
    fprintf('ok\n')
else
    fprintf('error\n')
end


