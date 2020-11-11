function[b0, u, x, y] = drawfitline(A)
    load line.mat;
    [U, C, b0] = fitaff(A,1);
    B = U*C + b0;
    
    hold on

    
    %plot(A, B, "green")
    [m,n] = size(A);
    for c = 1:n
        plot(A(1,c), A(2,c), 'rx');
        plot([A(1,c) B(1,c)], [A(2,c) B(2,c)], "red");
    end
    
    A1 = [B(1,1) B(1,2)];
    A2 = [B(2,1) B(2,2)];
    
    %plot(A1, A2, '*')
    
    %hold on
    line(A1,A2);
    %hold off
    
    xlim = get(gca,'XLim');
    m = (A2(2)-A2(1))/(A1(2)-A1(1));
    n = A2(2) - A1(2)*m;
    y1 = m*xlim(1)+n;
    y2 = m*xlim(2)+n;
    line([xlim(1) xlim(2)],[y1 y2])
    
    
    m = (A2(2)-A2(1))/(A1(2)-A1(1)) ;  % slope of line 
    N = 100 ; 
    x = linspace(-2,2,N) ;  % specify your x limits 
    y = A1(2)+m*(x-A1(2)) ;  % y = y1+m*(x-x1) ;
    %plot(x,y,'.r')
    
    xL = xlim;
    yL = ylim;
    line([0 0], yL, 'color', 'black');  
    line(xL, [0 0], 'color', 'black');
    
    
    hold off
    
    
    
    axis equal
    %axis([-1 11 2 7])
end