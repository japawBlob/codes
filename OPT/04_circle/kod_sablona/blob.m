syms x y z

f(x, y, z) = 1-(x*y*z)
%hess = jacobian(simplify(gradient(f)));

jackob = jacobian(f)

hess = jacobian(simplify(gradient(f)))

v=[x y];
A = [1 0.5;
    0.5 0];

v*A*v' + [0 1]*v'

A = [0 -0.5;
    -0.5 0];

e = eig(A)