% Generate P matrix for the truck model
P = zeros(6, 6);

p_rep = 0.8; % probability of repair on a given day
mu = 0.3; % mean number of breakdowns
for (i = 1:5)
    for (j = 2:i+1)
        bw_rep = i+1-j;
        bwout_rep = i-j;
        pw_rep = poisspdf(bw_rep, mu);
        pwout_rep = poisspdf(bwout_rep, mu);
        P(i, j) = p_rep * pw_rep + (1-p_rep)*pwout_rep;
    end
    P(i, 1) = 1 - sum(P(i,2:end));
end
% last row, no repairs just breakage
i = 6
for (j = 2:i)
    bwout_rep = i-j;
    pwout_rep = poisspdf(bwout_rep, mu);
    P(i, j) = pwout_rep;
end
P(i, 1) = 1 - sum(P(i,2:end));
format long
ww(P)
