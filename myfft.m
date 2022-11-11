function [xseries,yseries]=myfft(x,dt)
    % dt=0.1;%�������
    N=length(x);%��������
    t=0:dt:(N-1)*dt;%����ʱ��
    fs=1/dt;%����Ƶ�ʣ���Ų��������Ϊ����
    n=0:1:N-1;
    f=(fs/N).*n;%X��ÿ�����Ӧ��Ƶ��
    y=fft(x);%����Ҷ�任�õ�һ������
    Ay=abs(y);%ȡģ
    Ayy=Ay*2/N;%ת����ʵ�ʵķ�ֵ
    
    xseries=f(1:N/2);
    yseries=Ayy(1:N/2)';
end