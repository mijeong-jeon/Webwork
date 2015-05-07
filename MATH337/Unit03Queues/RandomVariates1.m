
% Random variates: compute inverses for gamma:
p = 0.1:0.1:0.9;
avg = [0.6, 0.9, 1.5, 4.2];
[P, A] = meshgrid(p, avg);

k = 3;
M = gaminv(P, k, A/k);
ww(M)

