function val = linquadref(xi,eta)
%LINQUADREF 此处显示有关此函数的摘要
%  Lagrange-Polynome im Punkt(xi, eta) 二维插值
%  返回的是一个vector(4*1)
    val=[1/4 * (1-xi) * (1-eta); 1/4 * (1+xi) * (1-eta); 1/4 * (1+xi)*(1+eta); 1/4 * (1-xi)*(1+eta)];
end

