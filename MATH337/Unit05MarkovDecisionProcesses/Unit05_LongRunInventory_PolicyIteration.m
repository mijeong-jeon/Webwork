% MDP optimization for long-term inventory modeling
clc
clear all;
ver = 5;

if (ver == 1)
    demand_mean = 3.1;
    unmet_cost = 100;
    order_fixed_cost = 30;
    order_unit_cost = 25;
    inventory_cost = 10;
    maxI = 8;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 2 )
    demand_mean = 2.8;
    unmet_cost = 100;
    order_fixed_cost = 30;
    order_unit_cost = 25;
    inventory_cost = 5;
    maxI = 9;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 3 )
    demand_mean = 4.5;
    unmet_cost = 40;
    order_fixed_cost = 40;
    order_unit_cost = 10;
    inventory_cost = 10;
    maxI = 9;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 4 )
    demand_mean = 4.1;
    unmet_cost = 60;
    order_fixed_cost = 50;
    order_unit_cost = 10;
    inventory_cost = 20;
    maxI = 8;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 5 )
    demand_mean = 5.1;
    unmet_cost = 70;
    order_fixed_cost = 40;
    order_unit_cost = 40;
    inventory_cost = 10;
    maxI = 9;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 6 )
    demand_mean = 3.7;
    unmet_cost = 80;
    order_fixed_cost = 10;
    order_unit_cost = 40;
    inventory_cost = 5;
    maxI = 9;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 7 )
    demand_mean = 4.4;
    unmet_cost = 140;
    order_fixed_cost = 100;
    order_unit_cost = 25;
    inventory_cost = 20;
    maxI = 10;  % set AFTER seeing optimal results; S +1 or +2
elseif (ver == 8 )
    demand_mean = 3.5;
    unmet_cost = 110;
    order_fixed_cost = 10;
    order_unit_cost = 25;
    inventory_cost = 30;
    maxI = 8;  % set AFTER seeing optimal results; S +1 or +2
    
else
    error('Unrecognized version number');
end

% maxI = 20;  % max inventory;  Inventory levels are 0...maxI, or maxI+1 levels
A = zeros(1, maxI+1);  % Default decisions for each state: re-order to maxI
cont_search = 1;
best_cost = Inf;

while(cont_search)
    for (s = 0:maxI)
        %     for (s=0)
        best_a = 0;
        best_a_cost = Inf;
        for (a = 0:(maxI-s))
            %         for (a=5)
            
            % Construct the P matrix
            A(s+1) = a;
            P = Unit05_ConstructPUsingActions(A, demand_mean);
            
            % Find the steady-state distribution over the states
            vP = Unit05_ComputeSteadyStateDistribution(P);
            
            % Compute the costs/state
            C = Unit05_ConstructCUsingActions(A, demand_mean, order_fixed_cost, order_unit_cost, inventory_cost, unmet_cost);
            
            % Construct the vector of costs/state
            expected_cost_of_policy = dot(vP, C);
            %                         fprintf('s = %d, a = %d, cost = %.2f\n', s, a, expected_cost_of_policy);
            
            if (expected_cost_of_policy < best_a_cost)
                best_a = a;
                best_a_cost = expected_cost_of_policy;
            end
        end
        % Store the best A as our new policy for state s
        A(s+1) = best_a;
    end
    %     best_cost =
    
    % We have done one full iteration, and A contains our best policy so
    % far
    % Recompute the benefit, and see if it is better than we saw before.
    P = Unit05_ConstructPUsingActions(A, demand_mean);
    
    % Find the steady-state distribution over the states
    vP = Unit05_ComputeSteadyStateDistribution(P);
    
    % Compute the costs/state
    C = Unit05_ConstructCUsingActions(A, demand_mean, order_fixed_cost, order_unit_cost, inventory_cost, unmet_cost);
    
    % Construct the vector of costs/state
    expected_cost_of_policy = dot(vP, C);
    
    % If no improvement, stop the search
    if (expected_cost_of_policy >= best_cost)
        break;  % skip out of greedy search loop
    else  % new cost is lower: keep it
        best_cost = expected_cost_of_policy;
        fprintf('New best cost: %.2f\n', best_cost);
    end
    
end

% Show the best policy
fprintf('Best policy: ');
fprintf('%d ', A);
fprintf('\n');
S = A(1);
v = A(1):-1:0;
ind = min([find( abs(A(1:S+1)-v)), find(A(1:S+1)==0)]);
s = ind(1) - 1;  % first # = safe level, but it's zero indexed
fprintf('s/S = (%d, %d)\n', s, S);

% Webwork version
fprintf('# ----\n');

fprintf('  $max_state = %d;\n', maxI);
fprintf('  $mean_demand = %.1f;\n', demand_mean);

fprintf('  $unmet_demand = %d;\n', unmet_cost);
fprintf('  $order_fixed = %d;\n', order_fixed_cost);
fprintf('  $order_per_unit = %d;\n', order_unit_cost);
fprintf('  $inventory = %d;\n', inventory_cost);

fprintf('  @A = ');
ww_arr(A, '%d');
fprintf('  $opt_cost = %.2f;\n', best_cost);
fprintf('  $opt_s = %d;\n', s);
fprintf('  $opt_S = %d;\n', S);



