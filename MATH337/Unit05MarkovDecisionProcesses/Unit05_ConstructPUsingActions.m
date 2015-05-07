function P = Unit05_ConstructPUsingActions(A, demand_mean)
% A length = 0...maxI states
maxI = length(A)-1;
P = zeros(maxI+1, maxI+1);

% probability of demand vector
Pd = poisspdf(0:maxI, demand_mean);
for (s = 0:maxI)
    new_s = s + A(s+1);  % old inventory level + re-order
    if (new_s > maxI)
        error('Reorder of %d to state %d puts inventory over limit of %d', A(s+1), s, maxI);
    end
    v = Pd(1:new_s+1);
    P(s+1, 1:(new_s+1)) = v(end:-1:1);  % s_n+1 = new_s - demand, so prob's are Poisson in reverse order
    P(s+1, 1) = 1 - sum(P(s+1, 2:end));  % entry for s_n+1 = 0 is accumulation of all higher demands
end
