% q001


%% x^2 e^(4x), x=0..2
a = 0;  b = 2;
f = @(x) x.^2 .* exp(4*x);
I = integral(f, a, b);
fprintf('x^2 e^(4x) : %.5f\n', I);


%% x^3 (x+3)^(2/3)
a = 0;  b = 2;
f = @(x)  x.^3 .*(x+3).^(2/3);
I = integral(f, a, b);
fprintf(' x^3 (x+3)^(2/3) : %.5f\n', I);

%% x.^2 .* cos(4*x);
a = -1; b = 1;
f = @(x)  x.^2 .* cos(4*x);
I = integral(f, a, b);
fprintf(' x.^2 .* cos(4*x): %.5f\n', I);

%% sqrt(1-x^2) x^3
a = 0; b = 0.9;
f = @(x) sqrt(1-x.^2).*x.^3;
I = integral(f, a, b);
fprintf('sqrt(1-x^2) x^3: %.5f\n', I);


