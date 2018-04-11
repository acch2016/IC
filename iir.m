a= 37;
% b= 0.5;
b= 0.6289;
t= tf( [a 0], [1 -b], 0.0005)
bode(t)
bandwidth(t)