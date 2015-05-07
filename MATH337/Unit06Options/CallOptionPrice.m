function D0 = CallOptionPrice(risk_free_r, s, T, N, S0, X)

S = StockTree(risk_free_r, s, T, N, S0);

% Build the option price
D = zeros(N+1, N+1);
c = N+1;
for (r = 1:(N+1))
    D(r, c) = max(S(r, c) - X, 0);
end
for (c = N:-1:1)
    for (r = 1:c)
        D(r, c) = (q*D(r, c+1) + (1-q)*D(r+1, c+1))/e_rt;
    end
end
D0 = D(1, 1);
% fprintf('mu = %.3f, price = %.2f\n', mu, D(1,1));

