% q_001
% Modelling the temperature equation

tspan = [0, 10];
y0 = -5;
Text = 20;
k = 0.2;
DE = @(t, y) -k*(y - Text);
[t, y] = ode45(DE, tspan, y0);
plot(t, y);