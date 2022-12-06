function wert_dpoly = LagrangeDerivPolynom(x,n,x_node,f_node)
%UNTITLED9 此处显示有关此函数的摘要
%   n为grad, x_node,f_node为输入的拟合点数值
    wert_dpoly = 0; % 输出的函数值
    for i = 1 : (n+1)   % 遍历所有数据点和对应的L_ni        
        L_d_ni = LagrangeDerivBasis(x,n,i,x_node);
        wert_dpoly = wert_dpoly + L_d_ni * f_node(i);
    end
end

