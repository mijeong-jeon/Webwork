% Price an option
clc
risk_free_r = 0.05;
S0 = 50;
s = 0.2;
N = 5;
X = 52;
T = 2;

S = StockTree(risk_free_r, s, T, N, S0);
disp(S);

D = PutOptionTreeEuropean(risk_free_r, s, T, N, S0, X);
% disp(D);
fprintf('Option price: %.2f\n', D(1, 1));

D = PutOptionTreeAmerican(risk_free_r, s, T, N, S0, X);
fprintf('Option price: %.2f\n', D(1, 1));
