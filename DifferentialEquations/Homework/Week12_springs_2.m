% Week12_Springs1
% 2 mass, 2 spring system
A = @(m, k, c) (1/m)*[0,1,0,0; -2*k, -c, k, 0; 0,0,0,1; k, 0, -k, -c];
m = 1;

% Case 1
k = 4;
c = 1;
A1 = A(m, k, c);
[vecs, vals] = eig(A1);
fprintf('m = %.2f, k = %.2f, c = %.2f\n', m, k, c);
fprintf('Eigenvalues: \n');
disp(diag(vals));
disp(vecs);

% Case 2
k = 6;
c = 2;
A2 = A(m, k, c);
[vecs, vals] = eig(A2);
fprintf('m = %.2f, k = %.2f, c = %.2f\n', m, k, c);
fprintf('Eigenvalues: \n');
disp(diag(vals));
disp(vecs);