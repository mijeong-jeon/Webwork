% Create a random M matrix, print it and its eigenvalues/eigenvectors
clear
close all;
N = 6;
P = zeros(N, N);

% Pick two rows w/1's in them.
one_plus_row = randi(N);
one_less_row = randi(N);
while  (one_plus_row == one_less_row)
    one_less_row = randi(N);
end
for (r = 1:N)
    p1 = randi(4)/10;
    p2 = randi(4)/10;
    p3 = 1 - p1 - p2;
    if (r == one_plus_row)
        P(r, mod(r, N)+1) = 1;
    elseif (r == one_less_row)
        P(r, mod(r-2, N)+1) = 1;
    else
        P(r, r) = p1;
        P(r, mod(r, N)+1) = p2;
        P(r, mod(r-2, N)+1) = p3;
        
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







