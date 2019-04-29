%%% Linear analysis of a signal, with components such as: Autocorrelation, histogram,
%%% Interpolated histogram, and the fast Fourier transform

load ('señal');
%% Autocorrelation
figure(1),autocorr(ft,5477);
%% Histogram
figure(2),histogram(ft,20)
title('Histograma de la señal')
ylabel('Número de repeticiones','FontSize',12)
xlabel('Precio ($/125kg)','FontSize',12)
%% Interpolated histogram
figure(3),ksdensity(ft)
title('Histograma interpolado de la señal')
xlabel('Precio ($/125kg)','FontSize',12)
ylabel('Frecuencia','FontSize',12)
%% Fast Fourier transform
y=fft(ft);
y1=fftshift(y);
g=abs(y1);
[a,b]=max(g);
g1=g(b:end);
g2=log(g1);
h=(1:length(g1));
h1=log(h);
figure(4),plot(h1,g2), grid on
title ('Espectro de potencia de la señal');
xlabel('Frecuencia en escala logarítmica (log(f))');
ylabel('Amplitud en escala logarítmica (log(A))');
g2=g2';
p=polyfit(h1,g2,1);
r=p(1)*h1+p(2);
figure(5),plot(h1,g2,'g')   
figure(5),hold on 
figure(5),plot(h1,r);
title ('Regresion lineal de la Transformada de Fourier');
xlabel('Frecuencia en escala logarítmica (log(f))');
ylabel('Amplitud en escala logarítmica (log(A))');
d=corrcoef(g2,r);
d2=d(1,2)^2;
grid on