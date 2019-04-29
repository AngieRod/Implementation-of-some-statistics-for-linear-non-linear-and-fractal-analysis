%%% Non-linear analysis of a signal, with components such as: AMI (Average
%%% mutual information), Series dimension, Lyapunov exponent and phase
%%% diagram, at last is obtained Hurst parameter for fractal analysis

%% AMI
load('señal.mat')
[dl,amix]=ami(ft,70,1000);
figure(7),plot(amix)
ylim([0 5])
title('Información Mutua Promedio (AMI)','FontSize',14)
ylabel('I(td)','FontSize',14)
xlabel('Tiempo de retardo (días)','FontSize',14)
grid on
%% Series dimension
[dim,fnn_est]=fnntest(ft,dl,9);
figure(8),plot(fnn_est,'-*')
title('Dimensión del Precio del café colombiano','FontSize',14)
ylabel('Número de falsos vecinos cercanos','FontSize',14)
xlabel('Dimensión (D))','FontSize',14)
grid on
%% Lyapunov exponent
[F d tlinear]=lyarosenstein(ft,6,20,1405,3000,100,150);
figure(2),plot(d)
rl = F(1)*tlinear + F(2);
tx=1:length(d);
rl=F(1)*tx + F(2);
% plot(d(1:300))
hold on 
plot(rl,'r')
title('Coeficientes de Lyapunov de la señal','FontSize',10)
ylabel('Divergencia','FontSize',10)
xlabel('Tiempo (días)','FontSize',10)
grid on
%% Phase diagram
U=psr_deneme(ft,6,20,5000);
% plot3(U(:,1),U(:,2),U(:,3))
subplot(1,2,2), plot3(U(:,1),U(:,2),U(:,3))
title('Diagrama de fase de la señal','FontSize',14)
xlabel('f(t)','FontSize',14)
ylabel('f(t+T)','FontSize',14)
zlabel('f(t+2T)','FontSize',14)
grid on
%% Hurst parameter
w = hurst(ft',4,8); 
title('Coeficientes de Hurst de la señal','FontSize',14)
ylabel('Factor de re escalamiento log(R/S)','FontSize',14)
xlabel('Escalas log(m)','FontSize',14)
grid on
