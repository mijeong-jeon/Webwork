% Create a random M matrix, print it and its eigenvalues/eigenvectors
clear
close all;
N = 5;
P = zeros(N, N);

only_ones_row = randi(N);
for (r = 1:N)
    p1 = randi(9)/10;
    p2 = 1 - p1;
    if (r == only_ones_row)
        P(r, mod(r, N)+1) = 1;
    else
        P(r, r) = p1;
        P(r, mod(r, N)+1) = p2;
    end
end

% Pretty print for Webwork
fprintf('[');
for (r = 1:N)
    fprintf('[');
    for (c = 1:N)
        
        fprintf('%.1f', P(r, c));
        if (c < N) fprintf(','); end
    end
    fprintf(']');
    if (r < N) fprintf(','); end
    
end
fprintf(']\n');

fprintf('Eigens of P\n');
[v, u] = eig(P);
for (i = 1:N)
    if (isreal(u(i,i)))
        fprintf('%.2f\n', u(i,i));
        % print the eigenvector
        fprintf('[[');
        for (r = 1:N)
            fprintf('%.3f', v(r, i));
            if (r < N) fprintf(','); end
        end
        fprintf(']]\n');
    end
end
fprintf('Eigens of P transpose\n');
[v, u] = eig(P');

for (i = 1:N)
    if (isreal(u(i,i)))
        fprintf('%.2f\n', u(i,i));
        % print the eigenvector
        fprintf('[[');
        for (r = 1:N)
            fprintf('%.3f', v(r, i));
            if (r < N) fprintf(','); end
        end
        fprintf(']]\n');
    end
    if ( abs(u(i,i) - 1) < 1e-3)
        ev_index = i;
    end
end

% Normalized probabilities
p = v(:,ev_index);
p = p / sum(p);
fprintf('@long_term_probs = qw(');
fprintf('%.5f ', p);
fprintf(');\n');







