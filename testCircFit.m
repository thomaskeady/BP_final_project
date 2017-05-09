% From http://blogs.mathworks.com/pick/2008/03/14/fitting-a-circle-easily/

R = 10; x_c = 5; y_c = 8;
thetas = 0:pi/64:pi;
xs = x_c + R*cos(thetas);
ys = y_c + R*sin(thetas);

% Now add some random noise to make the problem a bit more challenging:
mult = 0.5;
xs = xs+mult*randn(size(xs));
ys = ys+mult*randn(size(ys));

figure
plot(xs,ys,'b.')
axis equal

[xfit,yfit,Rfit] = circfit(xs,ys);
figure
plot(xs,ys,'b.')
hold on
rectangle('position',[xfit-Rfit,yfit-Rfit,Rfit*2,Rfit*2],...
    'curvature',[1,1],'linestyle','-','edgecolor','r');
title(sprintf('Best fit: R = %0.1f; Ctr = (%0.1f,%0.1f)',...
    Rfit,xfit,yfit));
plot(xfit,yfit,'g.')
xlim([xfit-Rfit-2,xfit+Rfit+2])
ylim([yfit-Rfit-2,yfit+Rfit+2])
axis equal

