function printWebworkMatrix(matrix_name, P, precision_str)
% Currently assumes that P is square
N = size(P, 1);

fprintf('$%s = Matrix->new_from_array_ref([', matrix_name);
for (r = 1:N)
    fprintf('[');
    for (c = 1:N)
        fprintf(precision_str, P(r, c));
        if (c < N) fprintf(','); end
    end
    fprintf(']');
    if (r < N) fprintf(','); end
    
end
fprintf(']);\n');
