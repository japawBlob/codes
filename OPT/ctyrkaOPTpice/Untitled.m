A = [2 -1 3;
    1 0 2;
    -2 1 4]

eig(A)

ATA = A'*A

[v D] = eig(ATA)

[U S V] = svd(A)

Snew = [5.3887 0 0;
    0 3.2872 0;
    0 0 0.3952]

Sh = [5.3887 0 0;
    0 3.2872 0;
    0 0 0]

N = U*Sh*V'

norm(A-N)
