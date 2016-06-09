% q001A


%% ODE 1a
close all;
tspan = [0, 10];
y0 = -1;
DE = @(t, y) (4-y);
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_1.png');

%% ODE 1b
close all;
tspan = [0, 10];
y0 = -1;
DE = @(t, y) -y;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_2.png');

%% ODE 1C
close all;
tspan = [0, 10];
y0 = -1;
DE = @(t, y) y^2;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_3.png');


%% ODE 1D
close all;
tspan = [0, 10];
y0 = -1;
DE = @(t, y) -(7+y);
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_4.png');


%% ODE 2a
close all;
tspan = [1, 4];
y0 = 5;
DE = @(t, y) sin(t) - 1./y;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part2_1.png');

%% ODE 2b
close all;
tspan = [1, 4];
y0 = 5;
DE = @(t, y) cos(t) + 1./y;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part2_2.png');

%% ODE 2C
close all;
tspan = [1, 4];
y0 = 5;
DE = @(t, y) sin(t) + 1./y;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part2_3.png');

%% ODE 2D
close all;
tspan = [1, 4];
y0 = 5;
DE = @(t, y) cos(t) - 1./y;
[t, y] = ode45(DE, tspan, y0);
plot(t, y, 'linewidth', 2.5);
print('-dpng', 'q_001_Part2_4.png');
