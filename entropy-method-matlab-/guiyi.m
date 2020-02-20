a1 = [0    66*0.045    88*0.08  118*0.17   156*0.24   203*0.31   244*0.38   302*0.45];
a2 = [27/50    33/66   44/88   61/118  79/156 102/203  115/244   141/302];
a3 = [50    66    88   118   156   203   244   302];
a4=[0 0 0.02 0.055 0.09 0.125 0.16 0.195];
x0 = a1;
x1 = a2;
x2 = a3;
x3 = a4;
x0 = (x0-x0(1)) ./ sum(x0)
x1 = (x1-x1(1)) ./ sum(x1)
x2 = (x2-x2(1)) ./ sum(x2)
x3 = (x3-x3(1)) ./ sum(x3)
% global min and max
global_min = min(min(abs([x1; x2; x3] - repmat(x0, [3, 1]))));
global_max = max(max(abs([x1; x2; x3] - repmat(x0, [3, 1]))));
% set rho
rho = 0.7;
for i=1:10
 rho=0.1*i;
% calculate zeta relation coefficients
 zeta_1 = (global_min + rho * global_max) ./ (abs(x0 - x1) + rho * global_max);
 zeta_2 = (global_min + rho * global_max) ./ (abs(x0 - x2) + rho * global_max);
 zeta_3 = (global_min + rho * global_max) ./ (abs(x0 - x3) + rho * global_max);
 disp(mean(zeta_3))
end
