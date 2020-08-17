function exitflag = new_old

%Enter the data and the initial guess.

td = [0:3];
new = [7.5 7.5 7.1 7.3 7.3 7.4 7.6 7.4];
old = [7.6 7.7 7.5 7.5 7.6 7.3 7.2 7.3];
p = [7.5 7.6 -5.2486 -0.0376 -3.9998 0.0024]; %initial conditions and coefficients

%Finally we use the fminsearch routine as follows:

[p,fval,exitflag] = fminsearch(@leastcomp,p,[],td,new,old);
p
fval

function J = leastcomp(p,tdata,xdata,ydata)
%Create the least squares error function to be minimized.
n1 = length(tdata);
[t,y] = ode23(@lotvol,tdata,[p(1),p(2)],[],p(3),p(4),p(5),p(6));
errx = y(:,1)-xdata(1:n1)';
erry = y(:,2)-ydata(1:n1)';
J = errx'*errx + erry'*erry;

function dydt = lotvol(t,y,a1,a2,b1,b2)
% Predator and Prey Model
tmp1 = y(1)*(-a1*(1-y(1)/7.4194) + a2*y(2));
tmp2 = y(2)*(-b1*(1-y(2)/7.4194) + b2*y(1));
dydt = [tmp1; tmp2];