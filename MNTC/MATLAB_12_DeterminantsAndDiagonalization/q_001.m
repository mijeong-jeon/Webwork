% Q01
s = RandStream('mt19937ar','Seed',298753);
RandStream.setGlobalStream(s);

for (i = 1:6)
    M = orth(randn(3, 3));
    M = M / det(M);
    P = diag(round(rand(3, 1), 3))*10;
    Z = M'*P*M;
    fprintf('$M = Matrix([ [%0.4f,%0.4f,%0.4f], [%0.4f,%0.4f,%0.4f], [%0.4f,%0.4f,%0.4f] ]);\n', Z')
    [u, v] = eig(Z,'matrix');
    fprintf('$diag = List(%.4f, %.4f, %.4f);\n', diag(v));
    
end

