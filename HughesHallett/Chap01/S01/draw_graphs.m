close all
formulas = {'y^2  = 2*x', 'y^2-8*x=0', 'x=-8*y^2',   'x^2+6*y=0',    'x^2=16*y', '4*x+y^2=0'};

for (i = 1:6)
    h = ezplot(formulas{i}, [-6, 6, -6, 6]);
    set(h,'LineWidth',2);  %# Sets the line width to 2
    colormap([1, 0, 0])
    title('')
    axis off
    hold on;
    plot([-6, 6], [0 ,0], 'k', 'linewidth', 2);
    plot([0 ,0], [-6, 6], 'k', 'linewidth', 2);
    for (x = -6:1:6)
        text(x, -0.5, sprintf('%d', x));
    end
    for (y = -6:1:6)
        if (y ~= 0)
            text( -0.5, y, sprintf('%d', y));
        end
    end
    hold off
    print('-dpng', sprintf('parab_graph_%d', i));
end