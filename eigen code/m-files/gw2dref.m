function gaussw = gw2dref(n)
%   nΪ��ÿһ�����������������м���������
    if n == 1
        gaussw = [4];
    elseif n == 2
        gaussw=[1
                1
                1
                1];
    elseif n == 3
        gaussw=[5/9*5/9 
                5/9*8/9 
                5/9*5/9
                8/9*5/9 
                8/9*8/9
                8/9*5/9
                5/9*5/9 
                5/9*8/9 
                5/9*5/9];
    else
        disp('false n')
end

