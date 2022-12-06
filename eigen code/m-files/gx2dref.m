function gaussx = gx2dref(n)
    if n == 1
       gaussx = [0 0]; %注意要用两个分量
    elseif n == 2
       % 换行和分号都可以表示矩阵分行
       gaussx=[-1/sqrt(3) -1/sqrt(3)
               -1/sqrt(3) 1/sqrt(3)
               1/sqrt(3)  -1/sqrt(3)
               1/sqrt(3)  1/sqrt(3)];
    elseif n == 3
       gaussx=[-sqrt(3/5) -sqrt(3/5) 
                -sqrt(3/5) 0 
                -sqrt(3/5) sqrt(3/5)
                0          -sqrt(3/5) 
                0          0 
                0          sqrt(3/5) 
                sqrt(3/5)  -sqrt(3/5)  
                sqrt(3/5)  0
                sqrt(3/5)  sqrt(3/5) ];
    else
        disp("error n")
    end  
end

