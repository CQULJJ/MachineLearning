function [res] = h_func(X,theta)
  temp = theta(1)+theta(2)*X;%%�ȼ�������躯����ֵ
  res = 1./(1+exp(-temp));%% ������߼�ģ��sigmoid����ֵ
  end