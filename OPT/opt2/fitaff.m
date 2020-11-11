function [U, C, b0] = fitaff(A,k)


    blob = A'/size(A', 1);
    b0 = sum(blob);
    
    %B = ones(1,size(A',1))' * b0 - A'
    B = A' - ones(1,size(A',1))' * b0;
    [U,C] = fitlin(B',k);
    b0 = b0';
end