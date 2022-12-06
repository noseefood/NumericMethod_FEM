function  wert_basis = LagrangeBasis(x,n,i,x_node) 
% 返回L_ni参数 Basispolynom
% i表示当前basis对应n+1个数据点中的第几个数据点 i从1:n+1
    L_ni = 1;
    for k = 1 : (n+1)
        if k ~= i % 感觉不需要
           L_ni = L_ni * (x - x_node(k))/(x_node(i) - x_node(k));
        end        
    end
    wert_basis = L_ni;
end

