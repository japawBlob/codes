syms x

digits(64)

f(x) = sin(x) - 1/2*x; % Equation definition
fp(x) = cos(x) - 1/2; % First-order derivative of f
x0 = 1; % Initial guess
N = 20; % Maximum number of iterations
tol = 1E-10000000000000; % Convergence tolerance
x = zeros(N + 1,1); % Preallocate solution vector where row => iteration
x(1) = x0; % Set initial guess
% Newton's Method algorithm
n = 2;
nfinal = N + 1; % Store final iteration if tol is reached before N iterations
while (n <= N + 1)
 fe = vpa(f(x(n - 1)));
 fpe = vpa(fp(x(n - 1)));
 x(n) = vpa(x(n - 1) - fe/fpe);
 blob = vpa(x(n - 1) - fe/fpe);

 if (abs(fe) <= tol)
 nfinal = n; % Store final iteration
 break;
 end
 n = n + 1;
end
% Plot evolution of the solution
%figure('Color','White')
%plot(0:nfinal - 1,x(1:nfinal))
%title('Newton''s Method Solution: $f(x) = x + x^{\frac{4}{3}}$','FontSize',
%20,'Interpreter','latex')
%xlabel('Iteration','FontSize',16)
%ylabel('$x$','FontSize',16,'Interpreter','latex')
x
vpa(x(20))
nfinal
blob