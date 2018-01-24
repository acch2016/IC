load('Ejercicio 3_Cap_1.mat');
size(t)
error1 = X1 - Y;
error2 = X2 - Y;
avg1 = mean(X1);
avg2 = mean(X2);
exactitud1 = 1 - abs((Y-X1)./Y);
exactitud2 = 1 - abs((Y-X2)./Y);
precision1 = 1 - abs((X1-avg1)/avg1);
precision2 = 1 - abs((X2-avg2)/avg2);

plot(t,error1,t,error2);
title('Error');
xlabel('t');
legend('Error Sensor 1','Error Sensor 2');

figure;
plot(t,exactitud1,t,exactitud2);
title('Exactitud');
xlabel('t');
legend('Exactitud Sensor 1','Exactitud Sensor 2');

figure;
plot(t,precision1,t,precision2);
title('Precision');
xlabel('t');
legend('Precision Sensor 1','Precision Sensor 2');

avgdevX1 = mad(X1); %Average Deviation
avgdevX2 = mad(X2);
stddevX1 = std(X1); %Standard Deviation
stddevX2 = std(X2);
varX1 = var(X1);     %Variance
varX2 = var(X2);


