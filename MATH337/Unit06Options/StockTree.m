function S = StockTree(risk_free_r, s, T, N, S0)
% Simulation of stock trees for call options
dt = T/N;
% Store some simple exponential factors
e_rt = exp(risk_free_r*dt);

u = exp(s*sqrt(dt)); 
d = exp(-s*sqrt(dt));

q = (e_rt-d)/(u-d);

% Build the stock price tree
S = zeros(N+1, N+1);
S(1,1) = S0;
for (c = 1:N)
    S(1, c+1) = S(1, c) * u;
    for (r = 1:c)
        S(r+1, c+1) = S(r, c+1) * d^2;
    end
end

% Generate the probabilities of each of the final stock prices
% v = binopdf(N:-1:0, N, q);  % N->1 down, because first element of S is u^N, or N wins/successes
% fprintf('Expected stock price (tree): %.3f\n', dot(S(:,N+1), v));
% fprintf('Expected stock price (risk-free growth): %.3f\n', S0*exp(rate*T));

