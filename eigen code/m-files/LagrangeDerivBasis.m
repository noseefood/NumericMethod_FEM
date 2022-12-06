function L_d_ni = LagrangeDerivBasis(x,n,i,x_node)
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
    L_d_ni = 0;
    for m = 1:n+1
      if m ~= i
          p = 1;
        for k = 1:n+1
           if k ~= i && k ~= m  % k同时不等于j和m
             p = p * (x - x_node(k))/(x_node(i) - x_node(k));% als product
           end
        end
        L_d_ni = L_d_ni + 1/(x_node(i)-x_node(m)) * p;
      end
    end
end

