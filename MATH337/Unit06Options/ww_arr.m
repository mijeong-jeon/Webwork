function ww_arr(p, prec)  % print in webwork problem format
if (nargin() < 2)
    prec = '%.12e';
end
fprintf('(');

for (i = 1:length(p))
    
    fprintf(prec, p(i));
    if (i < length(p));
        fprintf(', ');
    end
    
    
    
end
fprintf(');\n');