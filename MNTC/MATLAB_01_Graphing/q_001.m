% q_001 graphs
x = linspace(-2*pi, 2*pi);

y = x .* sin(x);
plot(x, y, 'linewidth', 2);
print('-dpng', 'q_001_1.png');

y = x.^2 .* sin(x);
plot(x, y, 'linewidth', 2);
print('-dpng', 'q_001_2.png');

y = x .* cos(x);
plot(x, y, 'linewidth', 2);
print('-dpng', 'q_001_3.png');
y = x.^2 .* cos(x);
plot(x, y, 'linewidth', 2);
print('-dpng', 'q_001_4.png');
