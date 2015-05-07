% Hockey pull the goalie problem
clc;
clear all;

ver = 2;

N = 6;  % # of decision time points, so not including end time point
num_states = 7;  % -3+, -2, -1, 0, 1, 2, 3+
num_actions = 2;

if (ver == 1)
    pOff = [0.15, 0, 0.04];  % Action = 1
    pOn = [0.02, 0, 0.02];  % Action = 2
    % Time intervals in seconds
    dt = 15;
    total_length = N*dt; % Total time to consider before end of game
elseif (ver == 2)
    pOff = [0.15, 0, 0.03];  % Action = 1
    pOn = [0.03, 0, 0.02];  % Action = 2
    % Time intervals in seconds
    dt = 20;
    total_length = N*dt; % Total time to consider before end of game
elseif (ver == 3)
    pOff = [0.5, 0, 0.03];  % Action = 1
    pOn = [0.01, 0, 0.01];  % Action = 2
    % Time intervals in seconds
    dt = 20;
    total_length = N*dt; % Total time to consider before end of game
elseif (ver == 4)
    pOff = [0.04, 0, 0.04];  % Action = 1
    pOn = [0.015, 0, 0.02];  % Action = 2
    % Time intervals in seconds
    dt = 15;
    total_length = N*dt; % Total time to consider before end of game
elseif (ver == 5)
    pOff = [0.2, 0, 0.07];  % Action = 1
    pOn = [0.03, 0, 0.03];  % Action = 2
    % Time intervals in seconds
    dt = 20;
    total_length = N*dt; % Total time to consider before end of game
elseif (ver == 6)
    pOff = [0.3, 0, 0.07];  % Action = 1
    pOn = [0.04, 0, 0.03];  % Action = 2
    % Time intervals in seconds
    dt = 15;
    total_length = N*dt; % Total time to consider before end of game
else
    error('Unrecognized version');
end


% Calculate separately for safety/avoiding typos
    pOn(2) = 1 - sum(pOn);
    pOff(2) = 1 - sum(pOff);



% Allocate
T = zeros(N, num_states, num_actions);
f_star = zeros(N+1, num_states);
x_star = zeros(N+1, num_states);

% Last time point
f_star(N+1, :) = [0, 0, 0, 1, 1, 1, 1];

for (n = N:-1:1)
    % for n = N
    % Action = goalie off
    P = HockeyP(num_states, pOff);
    T(n, :, 1) = P * f_star(n+1, :)';
    % Action = goalie on
    P = HockeyP(num_states, pOn);
    T(n, :, 2) = P * f_star(n+1, :)';
    % Find the optimal scores/actions
    m = reshape(T(n, :, :), num_states, num_actions);
    [v, i] = max(m');
    f_star(n, :) = v';
    x_star(n, :) = i';
end

% Compute two-step probabilities
P = HockeyP(num_states, pOff);
P2 = P^2;
Off_2step = sum(P2(3, 4:end));
P = HockeyP(num_states, pOn);
P2 = P^2;
On_2step = sum(P2(3, 4:end));

disp(x_star)
fprintf('---\n');
fprintf('elsif ($ver == %d) {\n', ver);
fprintf('  @pOff = ');
ww_arr(pOff, '%.2f');
fprintf('  @pOn = ');
ww_arr(pOn, '%.2f');
fprintf('  $dt = %d;\n', dt);
fprintf('  $T = %d;\n', total_length);
fprintf('  $Off_2step = %.4f;\n', Off_2step);
fprintf('  $On_2step = %.4f;\n', On_2step);
A = x_star(1:end-1, 3);
fprintf('  @A = ');
ww_arr(A, '%d');
fprintf('  @p_tie_down_by_one = ');
ww_arr(f_star(1:end-1, 3), '%.5f');
OnOffCell = {'Off', 'On'};
for (i = 1:N)
    fprintf('  $A_%d = Compute("%s");\n', i, OnOffCell{A(i)});
end
fprintf('}\n\n');

