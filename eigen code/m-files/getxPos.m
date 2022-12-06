function x = getxPos(nodes, xi, eta)
%GETXPOS 返回坐标(x-y坐标系下)
%   调用Fkt.I 见Assign3
    val = linquadref(xi,eta); % val为4 * 1 即N_1, N_2, N_3, N_4 
    % x = sum(nodes .* val);
    x = val' * nodes ; 
end

