load matlab12.mat
x=a(:,2);


dt=0.01;%采样间隔
N=length(x);%采样点数
t=0:dt:(N-1)*dt;%采样时刻
fs=1/dt;%采样频率，与才采样间隔互为倒数
n=0:1:N-1;
f=(fs/N).*n;%X轴每个点对应的频率
% x=0.5*sin(2*pi*3*t)+cos(2*pi*10*t);%信号
subplot(4,1,1);
plot(t,x);title('未滤波 时域');
y=fft(x);%傅里叶变换得到一个复数
Ay=abs(y);%取模
Ayy=Ay*2/N;%转换成实际的幅值
subplot(4,1,2);
plot(f(1:N/2),Ayy(1:N/2));title('未滤波 频域');
f1=0;
f2=1;
yy=zeros(1,length(y));
for m=0:N-1
    tt=m*(fs/N);
   if(tt>=f1&&tt<=f2);%将奈奎斯特之后的频率也滤除点掉
%    if(m*(fs/N)>f1&m*(fs/N)&&(fs-f2)&m*(fs/N)<(fs-f1));%将奈奎斯特之后的频率也滤除点掉
       yy(m+1)=0;
   else
       yy(m+1)=y(m+1);
   end
end      %将频率为8Hz-12Hz的信号的幅值置0

yyi=abs(yy);
subplot(4,1,3)
plot(f(1:N/2),yyi(1:N/2));title('滤波 频域');
yi=ifft(yy);
subplot(4,1,4)
plot(t,real(yi));title('滤波 时域');
