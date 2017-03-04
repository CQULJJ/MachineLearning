function [jVal,gradient] = costFunction(theta)
  x = [-3;-2;-1;0;1;2;3];%%������xֵ
  y = [0.01;0.05;0.3;0.45;0.8;1.1;0.99];%%������yֵ
  m = size(x,1);%%����������
  hypothesis = h_func(x,theta);%%�������ǵļ��������yֵ
  jVal = -sum(log(hypothesis+0.01).*y+(1-y).*log(1-hypothesis+0.01))/m;%%������ʧ����
  gradient(1)=sum(hypothesis-y)/m;%%��ƫ��
  gradient(2) = sum((hypothesis-y).*x)/m;%%��ƭ��
 end