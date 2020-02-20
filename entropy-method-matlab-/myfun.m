y = [0    66*0.045    88*0.08  118*0.17   156*0.24   203*0.31   244*0.38   302*0.45]';
x1 = [50    66    88   118   156   203   244   302]';
x2=[0 0 0.02 0.055 0.09 0.125 0.16 0.195]';
e=sum(y)
y = y ./ sum(y)
a=sum(x1)
x1 = (x1-x1(1)) ./ a
X=[ones(size(y)) x1.^2 x1 x2.*x1 x2.^2 ]
[b,bint,r,rint,stats] = regress(y,X)
Y2=b(2)*x1.^2+b(3)*x1+b(1)+b(4)*x1.*x2+b(5)*x2.^2;
scatter3(x1,x2,y,'filled')
hold on
x1fit = 0:0.01:3;
x2fit = 0:0.01:3;
[X1fit,X2fit] = meshgrid(x1fit,x2fit);
X1a=[590 594 594 599 602 605 609]
X2a=[0.2558 0.252 0.302 0.2029 0.274 0.256 0.2195]
YFa = b(2)*X1a.^2+b(3).*X1a+b(1)+b(4)*X2a.*X1a+b(5)*X2a.^2
%%%%%%sensi ana
%X1b=X1a.*(1-0.025)
%X1c=X1a.*(1+0.025)
%X1d=X1a.*(1-0.05)
%X1e=X1a.*(1+0.05)
%YFa = b(2)*X1a.^2+b(3).*X1a+b(1)+b(4)*X2a.*X1a+b(5)*X2a^2
%YFb = b(2)*X1b.^2+b(3).*X1b+b(1)+b(4)*X2a.*X1b+b(5)*X2a^2
%YFc = b(2)*X1c.^2+b(3).*X1c+b(1)+b(4)*X2a.*X1c+b(5)*X2a^2
%YFd = b(2)*X1d.^2+b(3).*X1d+b(1)+b(4)*X2a.*X1d+b(5)*X2a^2
%YFe = b(2)*X1e.^2+b(3).*X1e+b(1)+b(4)*X2a.*X1e+b(5)*X2a^2
%disp(YF.*e)
YFIT = b(2)*X1fit.^2+b(3)*X1fit+b(1)+b(4)*X1fit.*X2fit+b(5)*X2fit.^2;
mesh(X1fit,X2fit,YFIT)
hold on
%x2=ones(size(x2))
%scatter3(x1,x2,b(2)*x1.^2+b(3)*x1+b(1)+b(4)*x1.*x2+b(5)*x2.^2,'filled')
hold off
