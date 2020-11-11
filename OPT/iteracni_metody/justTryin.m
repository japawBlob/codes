syms x1 x2 r a1 a2

blob = sqrt((a1-x1)^2 + (a2-x2)^2)-r

dx1 = diff(blob, x1)
dx2 = diff(blob, x2)
dr  = diff(blob, r)

a = [-0.7   0.7 0.7  -0.7
     -0.3  -0.3 0.8   0.3]; 

x0 = [0.5 0.2, .7]'; 

k = [x0' a(1,1) a(1,2)]

subs(blob, {x1,x2,r,a1,a2}, k)

subs(dx1, {x1,x2,r,a1,a2}, k)
subs(dx2, {x1,x2,r,a1,a2}, k)
subs(dr, {x1,x2,r,a1,a2}, k)