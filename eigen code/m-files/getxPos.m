function x = getxPos(nodes, xi, eta)
%GETXPOS ��������(x-y����ϵ��)
%   ����Fkt.I ��Assign3
    val = linquadref(xi,eta); % valΪ4 * 1 ��N_1, N_2, N_3, N_4 
    % x = sum(nodes .* val);
    x = val' * nodes ; 
end

