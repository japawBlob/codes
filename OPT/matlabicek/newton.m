syms a b

f(a,b) = [a b]' - inv([2-4*sin(b^2-2*a) 4*b*sin(b^2-2*a); 4*b*sin(b^2-2*a) 2*cos(b^2-2*a)-4*b^2*sin(b^2-2*a)])*[2*a-cos(b^2-2*a) -1+2*b*cos(b^2-2*a)]';
x = f(1,1);

eval(x);

syms x y

g(x) = [x^2+x-1; x^2-x-1];
dg(x) = [2*x+1; 2*x-1];
f(a) = a - inv(dg(a)'*dg(a))*dg(a)'*g(a);

blob = f(a);
simplify(f(a));
h = g(x)'*g(x);
simplify(h);

f(x,y) = (x+y-2*x*y-1)^2+(-x+y+x*y+3)^2+(x-y+x*y-1)^2;
grad = simplify(gradient(f));
hess = jacobian(simplify(gradient(f)));
sol = [x y]' - inv(hess)*grad;
simplify(sol);

h = [-100:5:100]

j = h.^2;

r=2;
x0=0;
y0=0;
hold on
plot(j,h)
ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r^2)
hold off
axis equal

