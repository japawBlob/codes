function [x, omega] = temps_fit_model(t, T)
% function x = temps_fit_model(t, T)
%
% INPUT: N data points specified by
% t : N-by-1 vector, days
% T : N-by-1 vector, temperatures
%
% OUTPUT:
% x: 4-by-1 vector specifying the estimated model 
% T(t) = x[1] + x[2]*t + x[3]*sin(omega*t) + x[4]*cos(omega*t) 
%
% omega: a scalar. Set to a constant in the code, not estimated
%        from the data.
%

% discard the code from here and implement the functionality:
%omega = 0.02; 
%x = [10, 0, 0, -10]';

Data = load('teplota.txt', '-ascii'); 
t = Data(:, 1); % days
T = Data(:, 2); % temperature measurements

I = ones(length(t),1);
omega = 2*pi/365;
A = [I, t, sin(omega*t), cos(omega*t)];

blob = inv(A'*A);

x = blob*A'*T;
Z = x(1) + x(2)*t + x(3)*sin(omega*t) + x(4)*cos(omega*t);

%{
plot(t, Z, 'Color', '#002347');
hold on
%plot(t, T, 'Color', '#AA791D');
scatter(t, T, 'filled', 'MarkerEdgeColor', '#AA791D', 'MarkerFaceColor', '#AA791D');
hold off
%}

