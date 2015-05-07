function ww_cell(p)  % print in webwork problem format
fprintf('qw(');
for (i = 1:length(p))   
    fprintf('%s ', p{i});   
end
fprintf(');\n');