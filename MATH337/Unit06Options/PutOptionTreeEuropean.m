function D = PutOptionTreeEuropean(risk_free_r, s, T, N, S0, X)

S = StockTree(risk_free_r, s, T, N, S0);

dt = T/N;
% Store some simple exponential factors
e_rt = exp(risk_free_r*dt);
u = exp(s*sqrt(dt));
d = exp(-s*sqrt(dt));

q = (e_rt-d)/(u-d);

% Build the option price
D = zeros(N+1, N+1);
c = N+1;
for (r = 1:(N+1))
    D(r, c) = max(X - S(r, c), 0);
end
for (c = N:-1:1)
    for (r = 1:c)
        D(r, c) = (q*D(r, c+1) + (1-q)*D(r+1, c+1))/e_rt;
    end
end


