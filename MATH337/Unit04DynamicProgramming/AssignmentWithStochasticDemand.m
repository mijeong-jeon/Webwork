%  AssignmentWithStochasticDemand
clear all;
clc;

ver = 1; %

if (ver == 1)
    D = [10 12 8 8 15];
    sold_profit = 22;
    unsold_profit = -6;  % Note the negatives
    unmet_profit = -3;
elseif (ver == 2)
    D = [8 10 10 20 7];
    sold_profit = 15;
    unsold_profit = -3;  % Note the negatives
    unmet_profit = -6;
elseif (ver == 3)
    D = [14 7 7 18 10];
    sold_profit = 21;
    unsold_profit = -5;  % Note the negatives
    unmet_profit = -2;
elseif (ver == 4)
    D = [7 10 15 14 8];
    sold_profit = 21;
    unsold_profit = -6;  % Note the negatives
    unmet_profit = -8;
    
else
    error('Only 4 versions created');
end

num_stores = length(D);
max_supply = 100;
Dmax = 200;
Dvals = 0:Dmax;

% Allocate the f array, by referencing the last corner value.
f(num_stores, max_supply+1, max_supply+1) = 0;
f_star(num_stores, max_supply+1) = 0;
x_star(num_stores, max_supply+1) = 0;

% Loop backwards over stores
for (store = num_stores:-1:1)
    mean_D = D(store);
    % Loop over remaining # of cases
    for (s = 0:max_supply)
        % Loop over decision of how many to supply to current store
        for (x = 0:max_supply)
            
            if (x <= s)  % only relevant case
                sold = min(Dvals, x);
                unsold = max(x - Dvals, 0);
                unmet = max(Dvals - x, 0);
                profit = sold * sold_profit + ...
                    unsold * unsold_profit + ...
                    unmet * unmet_profit;
            end
            
            if (store == num_stores)  % Must assign all remaining cases
                if (x == s)  %only valid option
                    f(store, s+1, x+1) = sum( poisspdf(Dvals, mean_D) .* profit);
                else
                    f(store, s+1, x+1) = NaN;
                end
            else  % NOT the last store: can assign up to s cases
                if (x <= s)
                    f(store, s+1, x+1) = sum( poisspdf(Dvals, mean_D) .* profit) + f_star(store+1, (s-x)+1);
                else
                    f(store, s+1, x+1) = NaN;
                end
                
            end
            % Compute optimal score and decision
            [f_star(store, s+1),x_star(store, s+1)]  = max(f(store, s+1, :));
            x_star(store, s+1) = x_star(store, s+1) - 1;  % find in 1st spot => 0 is optimal x
        end
    end
end

% General info
fprintf('@D = ');
ww_arr(D, '%d');
fprintf('$num_stores = %d;\n', num_stores);

fprintf('$sold_profit = %.2f;\n', sold_profit);
fprintf('$unsold_profit = %.2f;\n', unsold_profit);
fprintf('$unmet_profit = %.2f;\n', unmet_profit);

fprintf('\n');
fprintf('$total_demand = %d;\n', sum(D));
fprintf('$max_supply = %d;\n', max_supply);


% Info on last store
fprintf('@f_star_last = ');
ww_arr(f_star(end, :), '%.2f');
[v, i] = max(f_star(end, :));
fprintf('$last_opt_s = %d;\n', i-1);
fprintf('$last_opt_f = %.2f;\n', v);

% Info on second-last store
fprintf('@f_star_sec_last = ');
ww_arr(f_star(end-1, :), '%.2f');
[v, i] = max(f_star(end-1, :));
fprintf('$sec_last_opt_s = %d;\n', i-1);
fprintf('$sec_last_opt_f = %.2f;\n', v);

% Get the optimal sequences
fprintf('$x_star = ');
ww(x_star, '%d');

% Find the optimal value
fprintf('@f_star_store_1 = ');
ww_arr(f_star(1, :), '%.2f');
[v, i] = max(f_star(1, :));
fprintf('$first_opt_s = %d;\n', i-1);
fprintf('$first_opt_f = %.2f;\n', v);







