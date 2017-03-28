%BP�������㷨----����Ӧ��ֵ
clc
clear
disp('��ʼѵ��...')

tic;
data=[0 0 0;0 1 1;1 0 1;1 1 0];
n=2;%����ڵ���
h=2;%����ڵ���
m=1;%�����ڵ���
xlyb=[1 2 3 4];
x_xl=data(xlyb,1:2); %ѵ������x_xl
x_xl=[x_xl -1*ones(length(xlyb),1)];%�����ֵ��
d_xl=data(xlyb,3);%ѵ���������

%��ʼ����ز���
w=0.1*randn(h+1,m);%���Ȩ����
v=0.1*randn(n+1,h);%����Ȩ����
delta_v=zeros(h,1);%����Ȩ�����޸���
delta_w=zeros(m,1);%�����Ȩ�����޸���
o1=zeros(h,1);%�����������
o2=zeros(m,1);%������������
e=0.01;%�����ƾ���
M=1000; %ѵ����������
a=0.4; %ѧϰ��
E=1;%ѵ�����
N=0;%ѵ�������ۼ���
dv=v;%v����
dw=w;%w����

while N<5000 && E>e
    N=N+1;E=0;
    %��ÿһ����������(x_xl,d_xl)����ѵ��
    for num=1:length(d_xl)
        %��  �����o1
        o1=sigmoid((x_xl(num,:)*v)');
        %��������o2
        o1=[o1;-1];%�����ֵ��
        o2=sigmoid((o1'*w)');
        %�����Ȩ�����޸���
        for i=1:m
            delta_w(i)=o2(i)*(1-o2(i))*(d_xl(num,i)-o2(i));
            %������
            E=E+(d_xl(num,i)-o2(i))*(d_xl(num,i)-o2(i));
        end
        %���ز�Ȩ�����޸���
        for i=1:h
            z=0;
            for j=1:m
                z=z+w(i,j)*delta_w(j);
            end
            delta_v(i)=z*o1(i)*(1-o1(i));
        end
        %�޸����Ȩ����
        for j=1:h+1
            for k=1:m
                dw(j,k)=a*o1(j)*delta_w(k);
                w(j,k)=w(j,k)+dw(j,k);
            end
        end
        %�޸�����Ȩ����
        for i=1:n+1
            for j=1:h
                dv(i,j)=a*x_xl(num,i)*delta_v(j);
                v(i,j)=v(i,j)+dv(i,j);
            end
        end
    end
end
disp(['ѵ�����E��',num2str(E)]);
disp(['ѵ������N��',num2str(N)]);
disp(['BP������ѵ��ʱ�䣺',num2str(toc)])

disp('Test...');
for num=1:length(xlyb)
    o1=sigmoid((x_xl(num,:)*v)');
    o1=[o1;-1];%�����ֵ��
    o2=sigmoid((o1'*w)');
    disp(['����ֵ',num2str(d_xl(num,:),'%1.0f\t\t')]);
    disp(['Ԥ��ֵ',num2str(o2','%5.4f\t')]);
end
disp('����Ȩ����v=');
disp(num2str(v));
disp(['������ֵ1��',num2str(-v(3,1)),'��ֵ2��',num2str(-v(3,2))]);
disp('�����Ȩ����w=');
disp(num2str(w));
disp(['�������ֵ��',num2str(-w(3,1))]);