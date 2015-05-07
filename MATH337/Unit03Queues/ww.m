function ww(P)  % print in Webwork problem format
fprintf('Matrix(');
for (i = 1:size(P,1))
    fprintf('[');
    for (j = 1:size(P,2))
        fprintf('%.12e', P(i,j));
        if (j < size(P,2))
            fprintf(', ');
        end
    end
    if (i < size(P,1))
        fprintf('],\n');
    else
        fprintf(']');
    end
    
end
fprintf(');\n');
