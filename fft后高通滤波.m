load matlab12.mat
x=a(:,2);


dt=0.01;%�������
N=length(x);%��������
t=0:dt:(N-1)*dt;%����ʱ��
fs=1/dt;%����Ƶ�ʣ���Ų��������Ϊ����
n=0:1:N-1;
f=(fs/N).*n;%X��ÿ�����Ӧ��Ƶ��
% x=0.5*sin(2*pi*3*t)+cos(2*pi*10*t);%�ź�
subplot(4,1,1);
plot(t,x);title('δ�˲� ʱ��');
y=fft(x);%����Ҷ�任�õ�һ������
Ay=abs(y);%ȡģ
Ayy=Ay*2/N;%ת����ʵ�ʵķ�ֵ
subplot(4,1,2);
plot(f(1:N/2),Ayy(1:N/2));title('δ�˲� Ƶ��');
f1=0;
f2=1;
yy=zeros(1,length(y));
for m=0:N-1
    tt=m*(fs/N);
   if(tt>=f1&&tt<=f2);%���ο�˹��֮���Ƶ��Ҳ�˳����
%    if(m*(fs/N)>f1&m*(fs/N)&&(fs-f2)&m*(fs/N)<(fs-f1));%���ο�˹��֮���Ƶ��Ҳ�˳����
       yy(m+1)=0;
   else
       yy(m+1)=y(m+1);
   end
end      %��Ƶ��Ϊ8Hz-12Hz���źŵķ�ֵ��0

yyi=abs(yy);
subplot(4,1,3)
plot(f(1:N/2),yyi(1:N/2));title('�˲� Ƶ��');
yi=ifft(yy);
subplot(4,1,4)
plot(t,real(yi));title('�˲� ʱ��');
