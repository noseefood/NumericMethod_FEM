function deriv = linquadderivref(xi,eta)
%LINQUADDERIVREF �˴���ʾ�йش˺�����ժҪ
%  ���ص���һ��vector(4*2) ���ĸ����xi,eta�ĵ���
    deriv = [-1/4 * (1-eta), -1/4 * (1-xi); 1/4 * (1-eta), -1/4 * (1+xi); 1/4 * (1+eta), 1/4 * (1+xi); -1/4 * (1+eta),1/4 * (1-xi) ];
end

