function P = HockeyP(num_states, pv)
P = zeros(num_states, num_states);
P(1,1) = sum(pv(1:2));
P(1, 2) = pv(3);
P(end, end) = sum(pv(2:3));
P(end, end-1) = pv(1);
for (i = 2:num_states-1)
   P(i, (i-1):(i+1)) = pv; 
end