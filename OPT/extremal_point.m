    function [E]=extremal_point(A,b)
    n = size(A,2);
    m = size(A,1);

    h = [1:n];
    pot_E = [];
    E = [];
    while h(1) <= (m-n+1)
        H_A = [];
        H_b = [];
        h %just for print
        for i=1:n
            H_A = cat(1,H_A,A(h(i),:));
            H_b = cat(1,H_b,b(h(i),:));
        end
        [pot_E, r] = linsolve(H_A,H_b);
        b_H = A*pot_E;
        b;
        h_n = 0;
        for k = 1:m
            if b_H(k) >= b(k)
                h_n = h_n+1;
            end
            h_n;
            if h_n == m
                'yes';
                pot_E;
                if isempty(E)
                    E=pot_E; 
                else
                    E=cat(2,E,pot_E);
                end
            end
        end
        
        for j = 1:n
            j;
            if h(n-j+1) == m && h(1) ~= m
                'ok';
                h(n-j) = h(n-j)+1;
                h(n-j+1:end) = [h(n-j)+1:h(n-j)+j];
                h(n)=h(n)-1;
            end
        end    
        h(n)=h(n)+1;
              
    end
   
end