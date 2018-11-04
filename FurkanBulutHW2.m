%%1.soru a sikki
clc
clear all
close all
fs = 100000;
t = 0:1/fs:1.5;
%f = 100;ekledigim zaman çok yogun bir sinyal çikiyor, anlayamadim
dis = sawtooth(2*pi*50*t);
subplot(1,1,1)
plot(t,dis)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Sawtooth Periodic Wave')
%%1.soru b sikki
clc
clear all
close all
fs = 1000000;%1MHz ?
f = 20; %20Hz genlik
t = 0:1/fs:1.5;
karedalga = square(2*pi*50*f*t);
subplot(2,1,1)
plot(t,karedalga)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Square Periodic Wave')
%%1.soru c sikki
clc
clear all
close all
fs = 100000;
t = -1:1/fs:1;
aperiodic = tripuls(t,100e-3);
subplot(1,1,1)
plot(t,aperiodic)
axis([-0.1 0.1 -0.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Triangular Aperiodic Pulse')
%1.soru d sikki
clc
clear all
close all
fs = 10000;
t = -1:1/fs:1;
aperiodic2 = rectpuls(t,50e-3);
subplot(2,1,1)
plot(t,aperiodic2)
axis([-0.1 0.1 -0.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Rectangular Aperiodic Pulse')
%1.soru e sikki
clc
clear all
close all
tc = gauspuls('cutoff',50e3,0.5,[],-60); 
t1 = -tc : 1e-6 : tc; 
y1 = gauspuls(t1,50e3,0.6)
plot(t1,y1)
%1.soru f sikki
clc
clear all
close all
fs = 200E9;                    % örnekleme frekansim 200GHz
D = [2.5 10 17.5]' * 1e-9;     % 7.5 nS gecikmeler
t = 0 : 1/fs : 2500/fs;        
w = 2e-9;                       
yp = pulstran(t,D,@rectpuls,w);
subplot(1,1,1)
plot(t*1e9,yp);
axis([0 25 -0.2 1.2])
xlabel('Time (ns)')
ylabel('Amplitude')
title('Rectangular Train')
%1.soru g sikki
clc
clear all
close all
T = 0 : 1/50e3 : 10e-3;
D = [0 : 1/1e3 : 10e-3 ; 0.8.^(0:10)]';
Y = pulstran(T,D,@gauspuls,10E3,.5);
subplot(1,1,1)
axis([0 25 -0.2 1.2])
plot(T*1e3,Y)
xlabel('Time (ms)')
ylabel('Amplitude')
title('Gaussian Pulse Train')
%2.soru impulse kodu
clc 
clear all
close all
t = (0:1:10)';
impulse = t==0;
stem(impulse,'filled')
%mathwork'den aldim kodu, impulse kodu
%2.soru unit ramp function
clc
clear all
close all
t = (0:1:10)';
unitramp = t>=0;
ramp = t.*unitramp;
stem(ramp,'filled')
%2.soru unitsep function
clc
clear all
close all
t = (0:1:20)';
unitstep = t>=0;
stem(t,unitstep,'filled')
%3.soru kosinüs sinyali
clc
clear all
close all
fs = 1000;
f = 2;%frekansi? 20 yaptigim zaman çok yogun bi sinyal oluyor, anlasilir çikmiyor o yüzden 2 degerini girdim.
t = 0:1/fs:5;
x1 = cos(2*pi*f*t);
plot(t,x1)
grid on
%3.soru sinüs sinyali
clc
clear all
close all
fs = 1000;
f = 2;
t = 0:1/fs:5;
x2 = sin(2*pi*f*t);
plot(t,x2)
grid on
%3.soru ayrik zamanli sinüs sinyali
clc
clear all
close all
fs = 1000;
f = 2;
t = -25:1:25;
y = sin(2*pi*t/36);
stem(t,y,'filled')
%3.soru ayrik zamanli kosinüs sinyali
clc
clear all
close all
fs = 1000;
f = 2;
t = -25:1:25;
y = cos(2*pi*t/36);
stem(t,y,'filled')
%5.soru
clc
clear all
close all
n = 0:24;
y = (0.9.^n).*sin(2*pi*n/24);
sum(abs(y.^2))
%6.soru
clc
clear all
close all
fs = 2000;
f = 1;
t = 0:1/fs:5;
x2 = sin(2*pi*f*t);
stem(t,x2)
%7.soru
clc
clear all
close all
n = 0:57;
x = 4+cos(2*pi*n/24);
x0 = downsample(x,2,0);
x1 = downsample(x,2,1);
y0 = downsample(x0,2,0);
y1 = downsample(x1,2,1);
subplot(3,1,1)
stem(x,'Marker','none')
ylim([0.5 3.5])
title('Original Signal')

subplot(3,1,2)
stem(y0,'Marker','none')
ylim([0.5 3.5])
ylabel('Phase 0')

subplot(3,1,3)
stem(y1,'Marker','none')
ylim([0.5 3.5])
ylabel('Phase 1')
%mathwork downsampling k?sm?ndan direkt olarak ald?m hocam soruya
%uyarlamaya çal??t?m fakat böyle bir sonuç ald?m.