function printLatexMatrix(matrix_name, P, precision_str)
% Currently assumes that P is square
N = size(P, 1);

fprintf('%s = \\begin{bmatrix}', matrix_name);
for (r = 1:N)
    fprintf('');
    for (c = 1:N)
        fprintf(precision_str, P(r, c));
        if (c < N) fprintf('&'); end
    end
    
    if (r < N) fprintf('\\\\\n'); end
    
end
fprintf('\\end{bmatrix}\n');
