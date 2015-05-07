function ww(P, prec)  % print in Webwork problem format
if (nargin() < 2)
    prec = '%.12e';
end
fprintf('Matrix->new_from_array_ref(');
    fprintf('[');
for (i = 1:size(P,1))
    fprintf('[');
    for (j = 1:size(P,2))
        fprintf(prec, P(i,j));
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
fprintf(']);\n');
