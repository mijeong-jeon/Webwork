function ww_arr(p, prec)  % print in webwork problem format
if (nargin() < 2)
    prec = '%.12e';
end
for (i = 1:size(p,1))
    fprintf('(');
    for (j = 1:size(p,2))
        fprintf(prec, p(i,j));
        if (j < size(p,2))
            fprintf(', ');
        end
    end
    fprintf(')');
    
    
end
fprintf(';\n');