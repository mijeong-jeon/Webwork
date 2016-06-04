% q001
n = 500;

%% e^(-3x)
a = 0;  b = 2;
x = linspace(a, b, n+1);
f = @(x) exp(-3*x);
y = f(x);
dx = (b-a)/n;
LHR = sum(y(1:n))*dx;
fprintf('e^(-3x) with n=%d: %.5f\n', n, LHR);

%% cos(7x)
a = 0;  b = 4;
x = linspace(a, b, n+1);
f = @(x) cos(7*x);
y = f(x);
dx = (b-a)/n;
LHR = sum(y(1:n))*dx;
fprintf('cos(7x) with n=%d: %.5f\n', n, LHR);

%% (x-2)^(1/3)
a = 4; b = 7;
x = linspace(a, b, n+1);
f = @(x) (x-2).^(1/3);
y = f(x);
dx = (b-a)/n;
LHR = sum(y(1:n))*dx;
fprintf('(x-2)^(1/3) with n=%d: %.5f\n', n, LHR);
