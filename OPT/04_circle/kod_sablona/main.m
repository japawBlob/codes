
opts.iterN = 20; % change as you like 
opts.VERBOSE = 1; % enable interactive plots 
opts.mu = 1; % for LM 

% these points are for demonstative purposes only. 
% use your own, try different configurations. 
% load my_points_1.mat 
a = [0.3 0.1 -0.1 -0.3 0.0 0.3 0.1 -0.1 -0.3
     0.0 0.0 0.0 0.0 1 2 2 2 2]; 
%a = [0.3 0.1 -0.1 -0.3
%     0.0 0.0 0.0 0.0];
 
%save my_points_1.mat a

%x0 = [1 0.2, 0.2]';
x0 = [0 0.2, 0.2]'; 




% dist(x0, a);
method = 'GN'; 
[x, f_history] = fit_circle(x0, a, method, opts) 

