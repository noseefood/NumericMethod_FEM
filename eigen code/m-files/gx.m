function gaussx = gx(n)
%  n表示使用了几个数据点
    if n == 1
       gaussx = [0];
    elseif n == 2
       gaussx = [-1 / sqrt(3), 1 / sqrt(3)];
    else
       gaussx = [-sqrt(3 / 5), 0, sqrt(3 / 5)];
    end  
end

