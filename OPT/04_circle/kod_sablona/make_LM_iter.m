
function [x_new, success] = make_LM_iter(x, a, mu)
% function [x_new, success] = make_LM_iter(x, a, mu)
% 
% makes the Levenberg-Marquardt iteration. 
%
% INPUT:
% x, a   are as usual (see dist.m for explanation) 
% mu is the damping factor (the factor which multiplies the
% regularizing identity matrix)
%
% OUTPUT: 
% success == 1 if the iteration is successful, i.e. 
% value of criterion f is decreased after the update 
% of x. 
% success == 0 in the oposite case. 
%
% x_new is the updated x if success == 1. 
% x_new is set equal to the input x if success == 0. 


%    syms x1 x2 x3 a1 a2
%    dist2 = sqrt( (x1-a1)^2 + (x2-a2)^2) - x3;

 [m,n] = size(a);
 gfx = zeros(1,n);
 gfy = zeros(1,n);
 gfr = zeros(1,n);
 g = ones(1,n);
 %dx = diff(dist2 , x1);
 %dy = diff(dist2, x2);
 %dr = diff(dist2, x3);

 
 for index = 1:n
     %vals = [x' a(1,index) a(2,index)];
     gfx(1, index) = -(2*a(1,index) - 2*x(1))/(2*((a(1,index) - x(1))^2 + (a(2,index) - x(2))^2)^(1/2));
     gfy(1, index) = -(2*a(2,index) - 2*x(2))/(2*((a(1,index) - x(1))^2 + (a(2,index) - x(2))^2)^(1/2));
     gfr(1, index) = -1;
     
     g(1, index) = dist(x, [a(1, index); a(2, index)]);
 end
 gf = [gfx ;gfy ;gfr]';
 g = g';
 
 [s,r] = size(gf);
 
 I = eye(r,r);
 x_potencial_new = x - inv((gf' * gf + mu * I )) * gf' * g;
 
 f = compute_criterion(x, a);

 f_new = compute_criterion(x_potencial_new, a);
 
 if f > f_new
     x_new = x_potencial_new;
     success = 1
 else 
     x_new = x;
     success = 0
 end
     
end

%funkce vykradena z fit_circle
function [f] = compute_criterion(x, a)

[c, r] = deal( [x(1); x(2)], x(3) );
% residuals 
g = dist(x, a); 
% criterion 
f = sum(g.^2); 

end
    