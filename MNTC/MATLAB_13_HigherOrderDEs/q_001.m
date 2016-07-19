% q001A


%% ODE 1a
close all;
tspan = [0, 10];
% 'y'' -2 y' + y = 2'; 
% roots: 1, 1
DE = @(t, w) [w(2); 2 - w(1) + 2 * w(2)];
w0 = [0, 0];
[t, w] = ode45(DE, tspan, w0);
plot(t, w(:,1), 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_1.png');
%% ODE 1b
close all;
tspan = [0, 10];
% 'y'' +2 y' + y = 2'; 
% roots: 1, 1
DE = @(t, w) [w(2); 2 - w(1) - 2 * w(2)];
w0 = [0, 0];
[t, w] = ode45(DE, tspan, w0);
plot(t, w(:,1), 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_2.png');

%% ODE 1c
close all;
tspan = [0, 10];

% '5 y'' + y' +5 y = 2'; 
% roots:   -0.1000 + 0.9950i
DE = @(t, w) [w(2); (1/5)*( 2 - 5*w(1) - w(2))];
w0 = [0, 0];
[t, w] = ode45(DE, tspan, w0);
plot(t, w(:,1), 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_3.png');

%% ODE 1d
close all;
tspan = [0, 10];

% '5 y'' - y' +5 y = 2'; 
% roots:   -0.1000 + 0.9950i
DE = @(t, w) [w(2); (1/5)*( 2 - 5*w(1) + w(2))];
w0 = [0, 0];
[t, w] = ode45(DE, tspan, w0);
plot(t, w(:,1), 'linewidth', 2.5);
print('-dpng', 'q_001_Part1_4.png');



