function x = wages_fit_model(t, M)
% function x = wages_fit_model(t, M)
%
% INPUT: N data points specified by
% t : N-by-1 vector, years
% M : N-by-1 vector, wages
%
% OUTPUT:
% x: 2-by-1 vector specifying the estimated model 
% M(t) = x[1] + x[2]*t

% discard the code from here and implement the functionality:
%x = [10000 - 2000000, 1000]'; 


Data = load('mzdy.txt', '-ascii'); 
t = Data(:, 1); % years
M = Data(:, 2); % wages

I = ones(length(t),1);
A = [I, t];

blob = inv(A'*A);

x = blob*A'*M;
Z = x(1) + x(2)*t;

%display(x);
%display(Z);
%t2 = 2009.25;
%Z2 = x(1) + x(2)*t2;
%display(Z2);

%{
plot(t, Z, 'Color', '#002347');
hold on
%%plot(t, M, 'Color', '#AA791D');
scatter(t, M, 'filled', 'MarkerEdgeColor', '#AA791D', 'MarkerFaceColor', '#AA791D');
hold off
%}



