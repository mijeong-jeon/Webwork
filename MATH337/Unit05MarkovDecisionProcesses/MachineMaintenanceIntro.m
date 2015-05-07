% Machine Maintenance Intro
clear all;
clc

states = [1, 2, 3, 4];
actions = {'Nothing', 'Maint', 'Replace'};
action_short = {'A', 'B', 'C'};
% 4 states,  3 possible decisions
% The row in the P matrix depends on (state x decision), and gives a vector
% back, so the P information requires a 3D array
% P(s, d, p(s_n+1))
num_states = 4;
num_actions = 3;
% Initialize
PAll(num_states, num_actions, num_states) = 0;
A = dlmread('MachineMaintenanceIntro.txt', '\t', 1, 2);  % Read in from the Excel source
for (i = 1:num_states)
    is = 3*(i-1) + 1; % index start
    ie = is + 2; % index end
    PAll(i, :, :) = A(is:ie, :);
end

% Read in the costs
% c(s, d) = Cost/day of state/decision
C = dlmread('MachineMaintenanceIntro_Costs.txt', '\t', 1, 1);

% Set the decisions as a vector
D = [2, 1, 1, 3];

% Build the P matrix
for (s = 1:num_states)
    P(s, :) = PAll(s, D(s), :);
end

% Compute steady-state distribution
[vec, val] = eig(P');
val = diag(val);  % only keep the diagonal elements: makes searching for lambda = 1 work
val_one_index = find( abs(val - 1) < 1e-5);
vP = vec(:, val_one_index);
vP = vP/sum(vP);

% Construct the vector of costs/state
vC = zeros(num_states, 1);
for (s = 1:num_states)
    vC(s) = C(s, D(s));
end
expected_cost = dot(vP, vC);

% Output for webwork
fprintf('@actions = ');
ww_cell(actions);

for (s = 1:num_states)
    fprintf('@C%d = ', s);
    ww_arr(C(s, :), '%d');
end

for (s = 1:num_states)
    for (a = 1:num_actions)
        fprintf('@P%d%s = ', s, action_short{a});
        v = PAll(s, a, :);
        v = reshape(v, length(v), 1);
        ww_arr(v,  '%.2f');
    end
end

% Output PAll in more accessible form for Webwork
for (s = 1:num_states)
    v = PAll(s, :, :);
    v = reshape(v, num_actions, num_states);
    fprintf('$P%d = ', s);
    ww(v, '%.2f');
end




fprintf('Expected cost is $%.2f/day\n', expected_cost);











