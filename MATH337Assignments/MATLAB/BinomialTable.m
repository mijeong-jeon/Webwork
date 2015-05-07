% Create a random M matrix, print it and its eigenvalues/eigenvectors
clear
close all;
clc
p = 0.2;


fprintf('$bino_start = begintable(7);\n');
fprintf('$bino_head = row("",');
for (x = 0:6)
    fprintf('"x=%d"', x);
    if (x < 6)
        fprintf(',');
    end
end
fprintf(');\n');

for (n = 1:6)
    x = 0:n;
    y = binopdf(x, n, p);
    fprintf('$bino_%d = row("N=%d", "', n, n);
    for (yi = y)
        if (yi ~= y(end))
            fprintf('%.3f", "', yi);
        else
            fprintf('%.3f', yi);
        end
    end
    fprintf('");\n');
    
end
fprintf('$bino_end = endtable();\n');
