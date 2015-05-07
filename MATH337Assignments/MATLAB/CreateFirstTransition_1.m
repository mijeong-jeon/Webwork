% First transition probability calc
clc
clear all
N = 5;
P = zeros(N, N);

matrix_str = '$P = Matrix->new_from_array_ref(';

% Make first & last state absorbing
P(1,1) = 1;
P(N, N) = 1;

for (r = 2:N-1)
    p1 = randi(4)/10;
    p2 = randi(4)/10;
    p3 = 1 - p1 - p2;
    P(r, r) = p1;
    P(r, mod(r, N)+1) = p2;
    P(r, mod(r-2, N)+1) = p3;
    
end
disp(P);
% Print the size for Webwork
fprintf('$N = %d;\n', N)
% Print the P matrix for Webwork
printWebworkMatrix('P', P, '%.1f');


% Print the first 4 powers of P
printWebworkMatrix('P2', P^2, '%.3f');
printWebworkMatrix('P3', P^3, '%.3f');
printWebworkMatrix('P4', P^4, '%.3f');
