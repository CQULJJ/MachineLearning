%������һ������3����������ʧ������
%X��ʾ����ֵ��ѵ��������������������
%y��ʾ��ǩ
%theta��ʾ����ѡȡ�ĺ�����ϵ��
function J = costFunctionJ(X,y,theta)
%�����������������
m=size(X,1);
%��������ǵ�Ԥ��ֵ
predictions=X*theta;
%examples
%���Ԥ��ֵ��ʵ��ֵ��ƽ����
sqrErrors = (predictions-y).^2;
J = (1/(2*m))*sum(sqrErrors);