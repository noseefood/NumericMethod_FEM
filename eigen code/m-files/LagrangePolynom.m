function wert_poly = LagrangePolynom(x,n,x_node,f_node)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
%   n为grad, x_node,f_node为输入的拟合点数值
    wert_poly = 0; % 输出的函数值
    for i = 1 : (n+1)   % 遍历所有数据点和对应的L_ni        
        L_ni = LagrangeBasis(x,n,i,x_node); % i from 1 to n+1
        wert_poly = wert_poly + L_ni * f_node(i);
    end
end

