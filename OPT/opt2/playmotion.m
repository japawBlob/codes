function playmotion(conn,A,B,filename)


if nargin==2
  B = nan(size(A));
end
[m,n] = size(A);
A = reshape(A,[3 m/3 n]);
B = reshape(B,[3 m/3 n]);

% najdi rozsah souradnic pro vsechny body
a = [reshape(A,3,m*n/3) reshape(B,3,m*n/3)];
mina = min(a,[],2);
maxa = max(a,[],2);
axis([mina(1) maxa(1) mina(2) maxa(2) mina(3) maxa(3)])

hold on
grid on
axis vis3d manual

A(:,end+1,:) = NaN;
hA = plot3(A(1,conn,1),A(2,conn,1),A(3,conn,1), '-g.','markersize',20);
B(:,end+1,:) = NaN;
hB = plot3(B(1,conn,1),B(2,conn,1),B(3,conn,1), '-r.','markersize',20);
for i = 1:n
    set(hA,'XData',A(1,conn,i),'YData',A(2,conn,i),'ZData',A(3,conn,i));
    set(hB,'XData',B(1,conn,i),'YData',B(2,conn,i),'ZData',B(3,conn,i));
    pause(0.01);
    
    % If 'filename' is specified, save frame to movie file.
    if nargin>=4
      [imind,cm] = rgb2ind(frame2im(getframe),256);
      if i==1
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'DelayTime',0);
      else 
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0); 
      end
      title(filename)
    end
end
return