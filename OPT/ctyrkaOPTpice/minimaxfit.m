function [a, b, r] = minimaxfit(x, y)
blob = [y'; -y'];
[m, n]  = size(x);
A  = [x', ones(n, 1), -ones(n, 1); -x', -ones(n, 1), -ones(n, 1)];
%f = [0, 0, 1];
%blob = 
[m, n] = size(A);
f = [zeros(n-1, 1); 1];
[blob, ~, ~] = linprog(f, A, blob);

%a = blob(1,1);
%b = blob(2,1);
%r = blob(3,1);

a = blob(1:end-2);
b = blob(end-1);
r = blob(end);

