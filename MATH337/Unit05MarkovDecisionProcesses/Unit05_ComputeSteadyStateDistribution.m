function vP = Unit05_ComputeSteadyStateDistribution(P)
[vec, val] = eig(P');
val = diag(val);  % only keep the diagonal elements: makes searching for lambda = 1 work
val_one_index = find( abs(val - 1) < 1e-5);
vP = vec(:, val_one_index);
vP = vP/sum(vP);

