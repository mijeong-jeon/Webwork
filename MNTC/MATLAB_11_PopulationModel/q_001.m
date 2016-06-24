% Population model

close all;
clc
system = 1;

A = 990;
r  = 0.0005;

tspan = [0, 50];
P0 = 0.6 * A;

eq_growth = r*(A/2)^2;
h = round(0.8*eq_growth, -1)
DE = @(t, P) r * P* (A - P)-h;
[t, P] = ode45(DE, tspan, P0);
plot(t, P, 'linewidth', 2);
ylim([P0, 1000]);
xlabel('Time', 'Fontsize', 20); 
ylabel('Population', 'Fontsize', 20);
grid on;
print('-dpng', sprintf('q_001_PopulationSolution_%d.png', system));

%% Change r and h
system = 2;
r  = 0.0005;
eq_growth = r*(A/2)^2;
h = round(0.5*eq_growth, -1)
DE = @(t, P) r * P* (A - P)-h;
[t, P] = ode45(DE, tspan, P0);
plot(t, P, 'linewidth', 2);
ylim([P0, 1000]);
xlabel('Time', 'Fontsize', 20); 
ylabel('Population', 'Fontsize', 20);
grid on;
print('-dpng', sprintf('q_001_PopulationSolution_%d.png', system));

%% Change r and h
system = 3;
r  = 0.001;
eq_growth = r*(A/2)^2;
% h = round(0.4*eq_growth, -1)
h = 250
DE = @(t, P) r * P* (A - P)-h;
[t, P] = ode45(DE, tspan, P0);
plot(t, P, 'linewidth', 2);
% ylim([P0, 1000]);
xlabel('Time', 'Fontsize', 20); 
ylabel('Population', 'Fontsize', 20);
grid on;
print('-dpng', sprintf('q_001_PopulationSolution_%d.png', system));

%% Change r and h
system = 4;
r  = 0.001;
eq_growth = r*(A/2)^2;
h = round(0.7*eq_growth, -1)
DE = @(t, P) r * P* (A - P)-h;
[t, P] = ode45(DE, tspan, P0);
plot(t, P, 'linewidth', 2);
ylim([P0, 1000]);
xlabel('Time', 'Fontsize', 20); 
ylabel('Population', 'Fontsize', 20);
grid on;
print('-dpng', sprintf('q_001_PopulationSolution_%d.png', system));