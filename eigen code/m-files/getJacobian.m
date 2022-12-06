function [J, detJ, invJ] = getJacobian(nodes, xi, eta)
    Jt = nodes' * linquadderivref(xi,eta); % linquadderivref[4*2] nodes[4*2]  Jt[2*2]
    J = Jt;
    detJ = det(J);
    invJ = inv(J);
end

