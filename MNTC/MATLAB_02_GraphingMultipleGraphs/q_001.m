% q_001
close all
xpoints = [-1.5, -0.5, 0.5, 1.5];
for (i = 1:length(xpoints))
    clf
    xpoint = xpoints(i);
    
    x = linspace(xpoint-0.3, xpoint+0.3);
    
    fun = 1;
    y = 1./x;
    plot(x, y, 'linewidth', 2);
    hold on;
    y2 = -1/xpoint^2*(x - xpoint) + 1/xpoint;
    plot(x, y2, 'r', 'linewidth', 2);
    print('-dpng', sprintf('q_001_%d_%d.png', fun, i));
    
    fun = 2;
    clf
    y = 1./x.^2;
    plot(x, y, 'linewidth', 2);
    hold on;
    y2 = -2/xpoint^3*(x - xpoint) + 1/xpoint.^2;
    plot(x, y2, 'r', 'linewidth', 2);
    print('-dpng', sprintf('q_001_%d_%d.png', fun, i));
    
    fun = 3;
    clf
    y = -1./x;
    plot(x, y, 'linewidth', 2);
    hold on;
    y2 = +1/xpoint^2*(x - xpoint) - 1/xpoint;
    plot(x, y2, 'r', 'linewidth', 2);
    print('-dpng', sprintf('q_001_%d_%d.png', fun, i));
    
    fun = 4;
    clf
    y = -1./x.^2;
    plot(x, y, 'linewidth', 2);
    hold on;
    y2 = 2/xpoint^3*(x - xpoint) - 1/xpoint.^2;
    plot(x, y2, 'r', 'linewidth', 2);
    print('-dpng', sprintf('q_001_%d_%d.png', fun, i));
    
    
    %     pause(2);
end