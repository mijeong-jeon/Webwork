function C = Unit05_ConstructCUsingActions(A, demand_mean, order_fixed_cost, order_unit_cost, inventory_cost, unmet_cost);
maxI = length(A)-1;
C = zeros(maxI+1, 1);
for (s = 0:maxI)
    if (A(s+1) > 0) % if a re-order occurs
        C(s+1) = order_fixed_cost + A(s+1) * order_unit_cost;
    end
    % Inventory cost is on s + a
    C(s+1) = C(s+1) + inventory_cost * (s + A(s+1));
    % Unmet demand cost is expected value, using Poisson demand
    dem = 0:100;
    Pdem = poisspdf(dem, demand_mean);
    unmet_count = max(dem - (s + A(s+1)), 0);
    expected_unmet_cost = unmet_cost * sum(unmet_count .* Pdem);
    C(s+1) = C(s+1) + expected_unmet_cost;
end
