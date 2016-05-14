% Sample optimization tasks: some with critical points, and some with end
% point max/mins.

%% x cos(x)
close all;
x = linspace(2, 9);
f = @(x) x.*cos(x);
fn = @(x) -1 * f(x);
plot(x, f(x));
hold on;
[min_x, min_fx] = fminbnd(f, 7, 9);
fprintf('$min_x = Compute("%.4f");\n', min_x);
plot(min_x, min_fx, '.r', 'markersize', 20);
[max_x, max_fx] = fminbnd(fn, 5, 8);
fprintf('$max_x = Compute("%.4f");\n', max_x);
plot(max_x, f(max_x), '.r', 'markersize', 20);


%% cubic polynomial
close all;
x = linspace(-4, 3);
f = @(x) (x-1.5).*(x+2.7).* (x-0.8);
fn = @(x) -1 * f(x);
plot(x, f(x));
hold on;
[min_x, min_fx] = fminbnd(f, -4, -1);
fprintf('$min_x = Compute("%.4f");\n', min_x);
plot(min_x, min_fx, '.r', 'markersize', 20);
[max_x, max_fx] = fminbnd(fn, -3, 0);
fprintf('$max_x = Compute("%.4f");\n', max_x);
plot(max_x, f(max_x), '.r', 'markersize', 20);

%% ln(x) - .05x^2
close all;
x = linspace(1, 10);
f = @(x) log(x) -0.05*x.^2;
fn = @(x) -1 * f(x);
plot(x, f(x));
hold on;
[min_x, min_fx] = fminbnd(f, 7, 10);
fprintf('$min_x = Compute("%.4f");\n', min_x);
plot(min_x, min_fx, '.r', 'markersize', 20);
[max_x, max_fx] = fminbnd(fn, 1, 4);
fprintf('$max_x = Compute("%.4f");\n', max_x);
plot(max_x, f(max_x), '.r', 'markersize', 20);

%% exp(-x) + exp(0.5 *x)
close all;
x = linspace(-3, 3);
f = @(x) exp(-x) + exp(0.5*x);
fn = @(x) -1 * f(x);
plot(x, f(x));
hold on;
[min_x, min_fx] = fminbnd(f, 0, 3);
fprintf('$min_x = Compute("%.4f");\n', min_x);
plot(min_x, min_fx, '.r', 'markersize', 20);
[max_x, max_fx] = fminbnd(fn, -3, 0);
fprintf('$max_x = Compute("%.4f");\n', max_x);
plot(max_x, f(max_x), '.r', 'markersize', 20);
