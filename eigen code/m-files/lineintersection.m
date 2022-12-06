function  lineintersection()
%UNTITLED4 此处显示有关此函数的摘要
    theta = logspace(-20, 5, 1000);
    xex = 1;
    xnum = theta./(1+theta-1);  % P1, P2组成函数当y等于2的时候的x值
    X = abs(xex - xnum);
    loglog(theta,X, 'b'),hold on   % log图
    grid on
end

