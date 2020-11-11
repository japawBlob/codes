function plotline(x,y,a,b,r)
hold on

line = a*x + b;

plot(x, y, 'x');
plot(x, line + r, 'r');
plot(x, line, 'b');
plot(x, line - r, 'r');

axis tight equal
hold off