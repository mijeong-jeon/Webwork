% Create a random M matrix, print it and its eigenvalues/eigenvectors
clear
close all;
N = 6;
P = zeros(N, N);

matrix_str = '$P = Matrix->new_from_array_ref(';
vector_str_P = '$P_v1 = Matrix->new_from_array_ref(';
vector_str_Pt = '$Pt_v1 = Matrix->new_from_array_ref(';

% Pick one row to have 1 in the diagonal
self_row1 = randi(N);
self_row2 = randi(N);
while (self_row1 == self_row2)
    self_row2 = randi(N);
end

for (r = 1:N)
    p1 = randi(4)/10;
    p2 = randi(4)/10;
    p3 = 1 - p1 - p2;
    if (r == self_row1)
        P(r, r) = 1;
    elseif (r == self_row2)
        P(r, r) = 1;
    else
        P(r, r) = p1;
        P(r, mod(r+1, N)+1) = p2;
        P(r, mod(r-2, N)+1) = p3;
    end
end
disp(P);

% Pretty print for Webwork
fprintf('%s[', matrix_str);
for (r = 1:N)
    fprintf('[');
    for (c = 1:N)
        fprintf('%.1f', P(r, c));
        if (c < N) fprintf(','); end
    end
    fprintf(']');
    if (r < N) fprintf(','); end
    
end
fprintf(']);\n');

fprintf('#Eigens of P\n');
[vP, uP] = eig(P);
for (i = 1:N)
    if (isreal(uP(i,i)))
        fprintf('%.2f\n', uP(i,i));
        % print the eigenvector
        fprintf('%s[[', vector_str_P);
        for (r = 1:N)
            fprintf('%.3f', vP(r, i));
            if (r < N) fprintf(','); end
        end
        fprintf(']]);\n');
    end
end


fprintf('#Eigens of P transpose\n');
[vPt, uPt] = eig(P');
for (i = 1:N)
    if (isreal(uPt(i,i)))
        fprintf('%.2f\n', uPt(i,i));
        % print the eigenvector
        fprintf('%s[[', vector_str_Pt);
        for (r = 1:N)
            fprintf('%.3f', vPt(r, i));
            if (r < N) fprintf(','); end
        end
        fprintf(']]);\n');
    end
end

% Finds the vectors corresponding to eigenvalue 1
[r, c] = find(abs(uP - 1)<1e-4, 2);
% for each eigenvector, find the location of the largest value;
% that will be the absorbing state (i.e. with a_jj = 1)
for (i = 1:2)
    p = vP(:,r(i));
    [maxp, ind] = max(p);
    p = p / max(p); % normalize
    fprintf('$j1 = %d;\n', ind);
    fprintf('@a_ij = qw(');
    fprintf('%.5f ', p);
    fprintf(');\n');
end
% and finally the eigenvalues
for (r = 1:N)
    fprintf('$e_1 = sprintf(''%%.2f'', %.2f);\n', uP(r,r));
end
