%Problem 1A
coefficients = [1, 1, -2];
roots_of_polynomial = roots(coefficients);

disp('The roots of the polynomial are:');
disp(roots_of_polynomial);

%Problem 1B
coefficients = [0, 0, -2, 6];
roots_of_polynomial = roots(coefficients);

disp('The roots of the polynomial are:');
disp(roots_of_polynomial);

%%
%Problem 2A
% Coefficient matrix M
M = [1 -2 3; 2 1 1; -3 -3 -2];

% Right-hand side vector b
b = [7; 4; -10];

% Solve the system of linear equations
solution = M \ b;

% Extract the values of x, y, and z from the solution vector
x = solution(1);
y = solution(2);
z = solution(3);

% Display the values of x, y, and z
disp(['x = ', num2str(x)]);
disp(['y = ', num2str(y)]);
disp(['z = ', num2str(z)]);

%2B
% Coefficient matrix M
M = [1 -2 3; 2 1 1; -3 -3 -2];

% Constants column matrix N
N = [7; 4; -10];

% Solve the system of linear equations
solution = M \ N;

% Extract the values of x, y, and z from the solution vector
x = solution(1);
y = solution(2);
z = solution(3);

% Display the values of x, y, and z
disp(['x = ', num2str(x)]);
disp(['y = ', num2str(y)]);
disp(['z = ', num2str(z)]);

%2C
% Coefficient matrix M
M = [1 -2 3; 2 1 1; -3 -3 -2];

% Constants column matrix N
N = [7; 4; -10];

% Calculate the X matrix using the backslash operator
X = M \ N;

% Extract the values of x, y, and z from the X matrix
x = X(1);
y = X(2);
z = X(3);

% Display the values of x, y, and z
disp(['x = ', num2str(x)]);
disp(['y = ', num2str(y)]);
disp(['z = ', num2str(z)]);

%%
%Problem 3A
% Define the function
f = @(x) 3*cos(x) - x/2;

% Define the interval
interval = [0, 2*pi];

% Find the root within the interval
x_root = fzero(f, interval);

% Display the root
disp(['The root in the interval [0, 2π] is x = ', num2str(x_root)]);

%3B
% Define the function
f = @(x) exp(-0.1*x) - (4*x - 3);

% Define the interval
interval = [0, 4];

% Find the root within the interval
x_root = fzero(f, interval);

% Display the root
disp(['The root in the interval [0, 4] is x = ', num2str(x_root)]);

%3C
% Define the function
f = @(x) 5*x^2 + 6*x + 1;

% Define the interval
interval = [-2, -1];

% Find the root within the interval
x_root = fzero(f, interval);

% Display the root
disp(['The root in the interval [-2, -1] is x = ', num2str(x_root)]);

%%
%Problem 4A
function F = waqas(X)
    X1 = X(1);
    X2 = X(2);
    
    % Define the nonlinear equations
    equation1 = X1^2 + X2^2 - 26;
    equation2 = 3*X1^2 + 25*X2^2 - 100;
    
    % Return the equations as elements of a column vector
    F = [equation1; equation2];
end

%4B
% Define the initial guess
initial_guess = [2; 2];

% Define a function handle for the system of equations
equations = @(X) [X(1)^2 + X(2)^2 - 26;
                  3*X(1)^2 + 25*X(2)^2 - 100];

% Use fsolve to solve the equations
options = optimoptions('fsolve', 'Display', 'iter'); % Display the iterations
[x_solution, ~, exitflag, output] = fsolve(equations, initial_guess, options);

% Display the solution
disp(['Solution: x1 = ', num2str(x_solution(1)), ', x2 = ', num2str(x_solution(2))]);

% Display the number of iterations
disp(['Number of iterations: ', num2str(output.iterations)]);

