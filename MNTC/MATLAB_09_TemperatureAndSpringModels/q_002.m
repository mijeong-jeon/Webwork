close all;
m = 2;
k = 26;
c = 12;
om = 3.6;

DE = @(t, w) [w(2); (1/m)*(-k * w(1) - c*w(2) + cos(om*t))];

tspan = [0, 30];
y0 = 12;
w0 = [y0, 0];

[t, w] = ode45( DE, tspan, w0);
plot(t, w(:,1));
fprintf('Period = %.3f s\n', 2*pi*sqrt(m/k));
fprintf('Natural freq = %.3f rad/s\n', sqrt(k/m));