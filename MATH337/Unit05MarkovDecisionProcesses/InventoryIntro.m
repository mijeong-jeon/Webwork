% InventoryIntro
clc
% Cut and paste from problem
reorder = [2	3	3	6	3	    2	3	2	1	0];
mean_demand = 3.9;
% ev = [0.749503768361299	0.0936956727492644	0.0497529035482521	0.029907576940675	0.0242398036946762	0.0200694776723455	0.0160532351327936	0.0105548333105243	0.00495278397993117	0.00126994461023876];
order_fixed_cost = 120;
order_unit_cost = 40;
inventory_cost = 15;
unmet_cost = 10;

max_state = length(reorder) - 1;

% Create P matrix
P = zeros(max_state+1, max_state+1);
for (s = 0:max_state)
    for (sn = 1:max_state)
        d = (s + reorder(s+1) - sn);
        pd = poisspdf(d, mean_demand);
        P(s+1, sn+1) = pd;
    end
    P(s+1,1) = 1 - sum(P(s+1,2:end)); % P(0 left) = 1 - sum of other outcomes
end
[vec, val] = eig(P');
val = diag(val);
ind = find (abs(val - 1) < 1e-5);
ss_prob = vec(:,ind);
ss_prob = ss_prob / sum(ss_prob);
fprintf('Steady state prob: \n');
fprintf('%.4f ', ss_prob);
fprintf('\n');
% fprintf('SSE = %.4g\n', sum(ev - ss_prob'));

% Compute cost for each state
C = zeros(max_state+1, 1);
for (s = 0:max_state)
    A = reorder;
    if (A(s+1) > 0) % if a re-order occurs
        C(s+1) = order_fixed_cost + A(s+1) * order_unit_cost;
    end
    % Inventory cost is on s + a
    C(s+1) = C(s+1) + inventory_cost * (s + A(s+1));
    % Unmet demand cost is expected value, using Poisson demand
    dem = 0:100;
    Pdem = poisspdf(dem, mean_demand);
    unmet_count = max(dem - (s + A(s+1)), 0);
    expected_unmet_cost = unmet_cost * sum(unmet_count .* Pdem);
    C(s+1) = C(s+1) + expected_unmet_cost;    
end
fprintf('Cost for each state: \n');
fprintf('%.4f ', C);
fprintf('\n');

% Compute total cost
total_cost = dot(ss_prob, C);
fprintf('Total expected cost: $%.2f\n', total_cost);
