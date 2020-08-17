function exitflag = solve

new = [7.5 7.5 7.1 7.3 7.3 7.4 7.6 7.4];
old = [7.6 7.7 7.5 7.5 7.6 7.3 7.2 7.3];
%k1k2 = carypot(new(2), new(3), new(4), old(2), old(3), old(4));
k1k2 = [7.4194 7.4194];
%a1b1 = [0.46 0.46];
a1b1 = ratios(new(2), new(3), old(2), old(3), k1k2(1), k1k2(2));
a2b2 = coef(a1b1(1), a1b1(2), new(3), old(3), new(3)-new(2), old(3)-old(2), k1k2(1), k1k2(2));
k1k2
a1b1
a2b2

function k1k2 = carypot(nx0,nx1,nx2, ny0, ny1, ny2)
k1 = nx1*(2*nx0*nx2-nx0*nx1-nx1*nx2)/(nx0*nx2-nx1*nx1);
k2 = ny1*(2*ny0*ny2-ny0*ny1-ny1*ny2)/(ny0*ny2-ny1*ny1);
k1k2 = [k1; k2];

function a1b1 = ratios(nx0, nx1, ny0, ny1, K1, K2)
A = log(nx0 / (nx0-K1));
C = log(ny0 / (ny0-K2));
a1 = -(log((K1+nx1) / nx1) + A);
b1 = -(log((K2+ny1) / ny1) + C);
a1b1 = [a1; b1];

function a2b2 = coef(a1, b1, x, y, xP, yP, K1, K2)
a2 = (-xP - x*(a1*(1-x/K1))) / (x*y);
b2 = (-yP - y*(b1*(1-y/K2))) / (x*y);
a2b2 = [a2; b2];
