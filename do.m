T = readtable('FFT-DATA.xlsx','Range','A3:H403');
T=table2array(T);

x1=T(:,2);
x2=T(:,5);
x3=T(:,8);

result=[]

figure(1)
[res_x,res_y]=myfft(x1,0.1);
plot(res_x,res_y,'-k');
xlabel('Frequency (Hz)');
legend('0.3m/s');
title('Spectrum density function of ice load (kN*kN*s)');
axis([-0.1 6 -0.2 2.1])
result=[result res_x' res_y']

figure(2)
[res_x,res_y]=myfft(x2,0.1);
plot(res_x,res_y,'-k');
xlabel('Frequency (Hz)');
legend('0.5m/s');
title('Spectrum density function of ice load (kN*kN*s)');
axis([-0.1 6 -0.2 2.1])
result=[result res_x' res_y']

figure(3)
[res_x,res_y]=myfft(x3,0.1);
plot(res_x,res_y,'-k');
xlabel('Frequency (Hz)');
legend('0.7m/s');
title('Spectrum density function of ice load (kN*kN*s)');
axis([-0.1 6 -0.2 2.1])
result=[result res_x' res_y']

csvwrite('res_freq.csv',result)