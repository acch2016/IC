function IIR_filter_example(tspan, fs, f_in)
%Definimos vector de tiempo
T = 1/fs
t = (tspan(1):T:tspan(2))
size(t,2)
%Señal de entrada
X = cos(2*pi*f_in*t)
% r= X*0;
Y = X*0;
%Inicializamos muestras pasadas
Xkm1 = 0; Xkm2 = 0; Ykm1 = 0; Ykm2 = 0;
% eta y phi
eta = 0.5;
phi = 0.5;
for k = 1:size(t,2)
%     Y(k) = (X(k) + 2*Xkm1 + Xkm2) /4;
%     r(k)=cos(t(k));
    X(k) = cos(2*pi*f_in*t(k));
    Y(k) = X(k) + 2*cos(phi)*Xkm1 + Xkm2 + 2*eta*cos(phi)*Ykm1 - (eta^2)*Ykm2;
    
    %Actualizar muestras pasadas
    Xkm2 = Xkm1;
    Xkm1 = X(k);
    
    Ykm2 = Ykm1;
    Ykm1 = Y(k);
end

figure; plot(t,X, t,Y, 'red');
%figure; plot(t,r);
end