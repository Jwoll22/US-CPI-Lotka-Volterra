% =========================================================================
% Matlab program to draw a phase portrait for the LotkaVolterra Predetor
% Pey model. The results are shown at each time step. 
% In addition, the user has the option of plotting a time series graph for x or y. 
% Set the parameter choice = 1 for a time series plot for x.
% Set choice = 2 for a time series plot for y. 
% Equation parameters alpha, beta, gamma and detla can be changed by the
% user.
% Equations are solved using a numerical ODE solver. 
%
% James Adams 3/4/14
% =========================================================================

function LotkaVolterra_JA
clear  % Clears command window
clc    % Clears command history
clf    % Removes anything in the figure window before simulation. 

countdown = 3;  % Countdown time length before simulation runs. 
iterations = 1;  % Sets initial interation count to 1;
pausetime = 0.1;  % Shows solutions at each time step. 
runtime = 10;    % Duration time of simulation.

% ================ Equation parameter values ==============================
alpha = -5.2486;
beta = 0.0376;
gamma = -3.9998;
delta = -0.0024;
kappa1 = 7.4194;
kappa2 = 7.4194;

% =============== Initial conditions for x and y ==========================
initialx = 7.5;
initialy = 7.6;

fprintf('----------------------------------\nLotkaVolterra Predetor Prey model \n\nMatlab code written by James Adams\n----------------------------------')
fprintf('\n\nParameter values set,')
fprintf('\n\nalpha = %2.6f \nbeta = %2.6f \ngamma = %2.6f \ndelta = %2.6f ',alpha,beta,gamma,delta)
fprintf('\n\nTo plot a time series graph for x, set the choice parameter in the code to 1.') 
fprintf('\nSet choice to 2 to plot a time series graph for y.\n\nSimulation will run in ')

for i = 3:-1:1
    fprintf('\n%8i',countdown')    % Countdown to simulation start.
    countdown = countdown-1;
    pause(1)
end

% Solves equations using numerical ODE solver 45 (nonstiff runge kutta)
deq1=@(t,x) [x(1)*(-alpha*(1-x(1)/kappa1) - beta*x(2)); x(2)*(-gamma*(1-x(2)/kappa2) - delta*x(1))];
[t,sol] = ode45(deq1,[0 runtime],[initialx initialy]);

arraysize = size(t);  % Sets time array size for the for loop.

%============ Solutions are plotted at each time step =====================

for i = 1 : max(arraysize) 
    subplot(2,1,1)
    plot(sol(iterations,1),sol(iterations,2),'.','color',[rand; rand; rand],'markersize',14,'MarkerFaceColor','b');                               
    hold on
    title(['Lotka-Volterra Equations       t = ' num2str(t(iterations))],'fontsize',12)
    xlabel('x','fontsize',12)
    ylabel('y','fontsize',12)
    axis([min(7) max(8) min(7) max(8)])
    
    subplot(2,1,2)
    text(0.1,0.5,'Time Series graph will be shown at the end of the simulation')
    
    iterations = iterations + 1;   % Adds 1 to the iteration count. 
    pause(pausetime)
end

% ==== Plots time series of x or y graph depending on choice ============== 
subplot(2,1,2)
plot(t(:,1),sol(:,1),'b.',t(:,1),sol(:,2),'r.','markersize',10,'MarkerFaceColor','b')
title(['Lotka-Volterra time series for new and old administration'],'fontsize',12)
xlabel('Year')
ylabel('CPI')
axis([min(t(:,1)) max(t(:,1)) min(7) max(8)])
%====================== End of program ====================================
