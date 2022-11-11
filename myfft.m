function [xseries,yseries]=myfft(x,dt)
    % dt=0.1;%采样间隔
    N=length(x);%采样点数
    t=0:dt:(N-1)*dt;%采样时刻
    fs=1/dt;%采样频率，与才采样间隔互为倒数
    n=0:1:N-1;
    f=(fs/N).*n;%X轴每个点对应的频率
    y=fft(x);%傅里叶变换得到一个复数
    Ay=abs(y);%取模
    Ayy=Ay*2/N;%转换成实际的幅值
    
    xseries=f(1:N/2);
    yseries=Ayy(1:N/2)';
end