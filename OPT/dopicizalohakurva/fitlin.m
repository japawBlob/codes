function [U, C] = fitlin(A,k)

%[U S V] = svd(A);
%[m, n] = size(V);

%U = V(:, n-k : end);
%[x,y] = size(U);
%B = (eye(x,y) - U*(U')) * A;

%c = U^-1 * B;
[R T] = eig(A*A');
R
T

    [U S V] = svd(A);
    U
    V
    U*U'
    U = U(:, 1 : k);

    C = U \ (A' * U* U')';
    
    

end