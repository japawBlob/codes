function plottraj2(A)
    [U,C,b0] = fitaff(A,2);
    B = U*C + b0; %projekce posunuta o teziste
    plot(B(1,:),B(2,:),'r');
end