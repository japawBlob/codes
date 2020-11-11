load bodiky.mat

%y = rand(10,1);
%x = rand(10,1);

%save bodiky.mat


[a, b, r] = minimaxfit(x', y')

plotline(x, y, a, b, r)