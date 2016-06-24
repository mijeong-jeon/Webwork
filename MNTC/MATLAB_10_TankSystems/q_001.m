% Four tank systems

%% System 1
close all;
system = 1;
ain_flow = 0;  ain_conc = 0;
aout = 0;
ab = 3;
ba = 3;
bin_flow = 6;  bin_conc = 15;
bout = 6;
VA = 100;
VB = 200;

C0 = [0, 0];
tspan = [0, 100];
DE = @(t, C) tankSystem1(t, C, ain_flow, ain_conc, ab, aout, bin_flow, bin_conc, ba, bout, VA, VB);
[t, C] = ode45(DE, tspan, C0);
plot(t, C, 'linewidth', 2);
set(gca,'YTick',[]);
grid on;
xlabel('Time', 'Fontsize', 20);
ylabel('Concentration', 'Fontsize', 20);
print('-dpng', sprintf('q_001_TankSystemSolution_%d.png', system));

%% System 2
close all;
system = 2;
ain_flow = 0;  ain_conc = 0;
aout = 8;
ab = 2;
ba = 10;
bin_flow = 8;  bin_conc = 9;
bout = 0;
VA = 100;
VB = 200;

C0 = [0, 0];
tspan = [0, 100];
DE = @(t, C) tankSystem1(t, C, ain_flow, ain_conc, ab, aout, bin_flow, bin_conc, ba, bout, VA, VB);
[t, C] = ode45(DE, tspan, C0);
plot(t, C, 'linewidth', 2);
set(gca,'YTick',[]);
grid on;
xlabel('Time', 'Fontsize', 20);
ylabel('Concentration', 'Fontsize', 20);
print('-dpng', sprintf('q_001_TankSystemSolution_%d.png', system));

%% System 3
close all;
system = 3;
ain_flow = 6;  ain_conc = 10;
aout = 6;
ab = 8;
ba = 8;
bin_flow = 0;  bin_conc = 0;
bout = 0;
VA = 100;
VB = 50;

C0 = [0, 0];
tspan = [0, 100];
DE = @(t, C) tankSystem1(t, C, ain_flow, ain_conc, ab, aout, bin_flow, bin_conc, ba, bout, VA, VB);
[t, C] = ode45(DE, tspan, C0);
plot(t, C, 'linewidth', 2);
set(gca,'YTick',[]);
grid on;
xlabel('Time', 'Fontsize', 20);
ylabel('Concentration', 'Fontsize', 20);
print('-dpng', sprintf('q_001_TankSystemSolution_%d.png', system));

%% System 4
close all;
system = 4;
ain_flow = 6;  ain_conc = 30;
aout = 6;
ab = 15;
ba = 0;
bin_flow = 0;  bin_conc = 0;
bout = 15;
VA = 100;
VB = 50;

C0 = [0, 0];
tspan = [0, 100];
DE = @(t, C) tankSystem1(t, C, ain_flow, ain_conc, ab, aout, bin_flow, bin_conc, ba, bout, VA, VB);
[t, C] = ode45(DE, tspan, C0);
plot(t, C, 'linewidth', 2);
set(gca,'YTick',[]);
grid on;
xlabel('Time', 'Fontsize', 20);
ylabel('Concentration', 'Fontsize', 20);
print('-dpng', sprintf('q_001_TankSystemSolution_%d.png', system));



