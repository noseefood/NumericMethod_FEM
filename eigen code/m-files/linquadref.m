function val = linquadref(xi,eta)
%LINQUADREF �˴���ʾ�йش˺�����ժҪ
%  Lagrange-Polynome im Punkt(xi, eta) ��ά��ֵ
%  ���ص���һ��vector(4*1)
    val=[1/4 * (1-xi) * (1-eta); 1/4 * (1+xi) * (1-eta); 1/4 * (1+xi)*(1+eta); 1/4 * (1-xi)*(1+eta)];
end

