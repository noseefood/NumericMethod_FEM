function deriv = linquadderivref(xi,eta)
%LINQUADDERIVREF 此处显示有关此函数的摘要
%  返回的是一个vector(4*2) 即四个点对xi,eta的导数
    deriv = [-1/4 * (1-eta), -1/4 * (1-xi); 1/4 * (1-eta), -1/4 * (1+xi); 1/4 * (1+eta), 1/4 * (1+xi); -1/4 * (1+eta),1/4 * (1-xi) ];
end

