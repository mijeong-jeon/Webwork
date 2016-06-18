%% q_001 
close all;
DE = @(t, y) 8-2*y;
tspan = [0, 10];
y0 = 12;
[t, y] = ode45(DE, tspan, y0);
plot(t, y);

%% 
close all;
DE = @(t, y) y-4;
tspan = [0, 10];
y0 = 5;
[t, y] = ode45(DE, tspan, y0);
plot(t, y);

%% 
close all;
DE = @(t, y) -y.^2;
tspan = [0, 10];
y0 = 8;
[t, y] = ode45(DE, tspan, y0);
plot(t, y);

%% 
close all;
DE = @(t, y) y+1;
tspan = [0, 10];
y0 = -3;
[t, y] = ode45(DE, tspan, y0);
plot(t, y);