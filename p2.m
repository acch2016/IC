clc;
% sys = tf ( 3.162 , [ 0.00001 0.0005 ] ) ;
% bode(sys);
% grid on;
% title(' tf ( 3.162 , [0.00001 0.0005] )');

p1=1;
p2=10;
sys2 = tf ( 3.162*(p1*p2) , [ 1 p1+p2 p1*p2 ] ) ;
bandwidth(sys2)
figure;
bode(sys2);
grid on;
title(' sys2 ');

po2=200;
sys3 = tf ( 2*(200*po2) , [ 1 200+po2 200*po2 ] ) ;
% figure;
bode(sys3);
grid on;
title(' sys3 ');
bandwidth(sys3)

% los dos polos iguales, Ganacia 2, fc=200
Wc=200;
p=sqrt((Wc*Wc)/(sqrt(2)-1));
sys4 = tf ( 2*(p*p) , [ 1 p+p p*p ] ) ;
figure;
bode(sys4);
grid on;
title(' sys4 ');
bandwidth(sys4)

% sys5 = tf ( sqrt(10)*(100*pi)*(100*pi+100) , [1 (200*pi)+100 (10000*pi*pi)+(10000*pi)] );
% figure;
% bode(sys5);
% grid on;
% title(' sys5 ');
% bandwidth(sys5)

polo1=200.9498*pi;
polo2=200000+(100*pi);
sys6 = tf ( sqrt(10)*(100*pi)*(100*pi+100) , [1 2*((polo1)+(polo2)) (polo1)*(polo2)] );
figure;
bode(sys6);
grid on;
title(' sys6 ');
bandwidth(sys6)

% los dos polos iguales, Ganacia 2 pasa bajas
Wc=200;
p=sqrt((Wc*Wc)/(sqrt(2)-1))
sys7 = tf ( 2*(p*p) , [ 1 p+p p*p ] ) ;
figure;
bode(sys7);
grid on;
title(' sys7 ');
bandwidth(sys7)
% los dos polos iguales, Ganacia 2 pasa altas
Wc=100;
p=sqrt(sqrt(2)*Wc*Wc-Wc*Wc)
sys8 = tf ( [2 0 0] , [ 1 p+p p*p ] ) ;
figure;
bode(sys8);
grid on;
title(' sys8 ');
bandwidth(sys8)

% pasabanda
clc
clear all

Wc=200;
p1=sqrt((Wc*Wc)/(sqrt(2)-1))
sys1 = tf ( 2*(p1*p1) , [ 1 p1+p1 p1*p1 ] ) ;
Wc=100;
p2=sqrt(sqrt(2)*Wc*Wc-Wc*Wc)
sys2 = tf ( [2 0 0] , [ 1 p2+p2 p2*p2 ] ) ;

sys3 = sys1 * sys2 % multiplicacion de FDT
bandwidth(sys3)
figure;
bode(sys3);
grid on;
title('pasabanda');

% opcion pasabanda partiendo de pasabajas y pasaaltas de ganancia uno pero
% multiplicando por 2 las transformadas 

% obtener R
eqns = [1/(p*p), 3*x+1];
solve(eqns, x)

% examen
% polos FDT
clc
syms s;
roots(s*s+200*s-2000)

% los dos polos iguales, Ganacia 1 pasa bajas
clc
Wc = 20*pi;
p = sqrt((Wc*Wc)/(sqrt(2)-1))
sys9 = tf ( (p*p) , [ 1 p+p p*p ] ) ;
bandwidth(sys9)
figure;
bode(sys9);
grid on;
title(' sys9 ');

% los dos polos iguales, Ganacia 1 pasa altas
clc
Wc = 400*pi;
p = sqrt(sqrt(2)*Wc*Wc-Wc*Wc)
sys10 = tf ( [1 0 0] , [ 1 p+p p*p ] ) ;
bandwidth(sys10)
figure;
bode(sys10);
grid on;
title(' HPF ');

% rechazabanda
clc
Wc1=20*pi;
p1=sqrt((Wc1*Wc1)/(sqrt(2)-1));
sys9 = tf ( (p1*p1) , [ 1 p1+p1 p1*p1 ] ) ;
Wc2=400*pi;
p2=sqrt(sqrt(2)*Wc2*Wc2-Wc2*Wc2);
sys10 = tf ( [1 0 0] , [ 1 p2+p2 p2*p2 ] ) ;

sys11 = sys9+sys10;% suma de FDT
bandwidth(sys11)
figure;
bode(sys11);
grid on;
title('rechazabanda');


