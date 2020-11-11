function [x_new] = make_GN_iter(x, a)
% function [x_new] = make_GN_iter(x, a)
%
% makes the Gauss-Newton iteration. 
%
% INPUT:
% x, a   are as usual (see dist.m for explanation) 
%
% x_new is the updated x.

    %syms x1 x2 x3 a1 a2
    %dist2 = sqrt( (x1-a1)^2 + (x2-a2)^2) - x3;

 [m,n] = size(a);
 gfx = zeros(1,n);
 gfy = zeros(1,n);
 gfr = zeros(1,n);
 g = zeros(1,n);
 %dx = diff(dist2 , x1);
%dy = diff(dist2, x2);
 %dr = diff(dist2, x3);
 
 %gradd = gradient(dist2);
 
 for index = 1:n
     %vals = [x' a(1,index) a(2,index)];
     gfx(1, index) = -(2*a(1,index) - 2*x(1))/(2*((a(1,index) - x(1))^2 + (a(2,index) - x(2))^2)^(1/2));
     gfy(1, index) = -(2*a(2,index) - 2*x(2))/(2*((a(1,index) - x(1))^2 + (a(2,index) - x(2))^2)^(1/2));
     gfr(1, index) = -1;
     
     g(1, index) = dist(x, [a(1, index); a(2, index)]);
     
 end
 gf = [gfx ;gfy ;gfr]';
 g = g';
 %x;
 %g;
 %grad = 2*gf'*gf
 
 x_new = x - inv((gf' * gf)) * gf' * g;
 
 %vals = [x' x_new(1) x_new(2)];
 %eval(subs(gradd, {x1,x2,x3,a1,a2}, k))
 
  gfx(1, index) = -(2*x_new(1) - 2*x(1))/(2*(x_new(1) - x(1))^2 + (x_new(2) - x(2))^2)^(1/2);
  gfy(1, index) = -(2*x_new(2) - 2*x(2))/(2*(x_new(1) - x(1))^2 + (x_new(2) - x(2))^2)^(1/2);
  gfr(1, index) = -1;
gf = [gfx ;gfy ;gfr]';
 
grad = 2*gf'*g;
end
    
