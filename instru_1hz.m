% los dos polos iguales, Ganacia 1 pasa bajas
% 10Hz
clc
Wc = 20*pi;
p = sqrt((Wc*Wc)/(sqrt(2)-1))
system = tf ( (p*p) , [ 1 p+p p*p ] )
BW = bandwidth(system)
% figure;
% bode(sys9);
% grid on;
% title(' sys9 ');
% syms R
C = 1e-6
% solve( [ (1/9531)==C*R , 1==(2*C*R) ], R)
% format SHORTENG
R = sqrt( (1/9531)/(C^2) )
R = 4.7e3
sys = tf(1,[C*C*R*R 2*C*R 1]);
bode(sys);
BW2 = bandwidth(sys)
freq_BW2 = BW2 / (2*pi)

