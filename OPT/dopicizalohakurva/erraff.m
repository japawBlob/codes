function d = erraff(A)
    [V,D] = eig(A'*A);
    [m,n] = size(V);
    %V
    for i = 1:m
        VT = V(:, 1:(n-i));
        blob = sum(VT);
        d(i) = sum(blob, 2);
    end
    
    %[U S H] = svd(A);
    %[m,n] = size(U);
    
    %tohle proste musi jit udelat aj SVD rozkladem...
    %U = U(:, 1 : k);
    %U
    %H
    %for i = 1:m
    %    K = H(:, i+1 : end);
    %    X = sum(K)
    %    s(i) = sum(X')
    %end
    %s;
    %d;
end