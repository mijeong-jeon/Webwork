% Graphs for this unit
clc
close all;

pntlist = {'A', 'B', 'C', 'D', 'E', 'F'};
% q_001 -
x1 = [1, 3, 4, 6, 8, 10;
    -5, -4, -2, -1, 1, 2;
    -2, -1, 1, 2, 3, 5;
    -4, -2, -1, 1, 2, 4];
y1 = [1, 4, 3, 2, 8, 1;
    -5, -3, -2, -3, -3.5, 0.5;
    4, 2, 1.8, 3, 5, 1;
    2, -1, 1, 1, -1, -0.8];
for (vers = 1:size(x1,1))
    close all;
    xaxis = [min(x1(vers,:))-1, max(x1(vers,:))+1];
    yaxis = [min(y1(vers,:))-1, max(y1(vers,:))+1];
    xx = linspace(min(x1(vers,:))-0.5, max(x1(vers,:))+0.5);
    yy = spline(x1(vers,:), y1(vers,:), xx);
    plot(xx, yy);
    hold on;
    % Move some points to the nearest max
    fmin = @(x) spline(x1(vers,:), y1(vers,:), x);
    fmax = @(x) -1 * fmin(x);
    
    if (vers == 1)
        f = @(x) -1 * spline(x1(vers,:), y1(vers,:), x);
        [xm, ym] = fminbnd(fmax, 1, 3);
        x1(vers, 2) = xm;
        y1(vers,2) = -ym;
        [xm, ym] = fminbnd(fmax, 6, 10);
        x1(vers,5) = xm;
        y1(vers,5) = -ym;
    elseif (vers == 2)
        [xm, ym] = fminbnd(fmax, -4, -1);
        x1(vers, 3) = xm;
        y1(vers, 3) = -ym;
        [xm, ym] = fminbnd(fmin, -1, 2);
        x1(vers, 5) = xm;
        y1(vers, 5) = ym;
    elseif (vers == 3)
        [xm, ym] = fminbnd(fmax, 2, 5);
        x1(vers, 5) = xm;
        y1(vers, 5) = -ym;
    elseif (vers == 4)
        [xm, ym] = fminbnd(fmin, -4, -1);
        x1(vers, 2) = xm;
        y1(vers, 2) = ym;
        
    end
    
    plot(x1(vers, :), y1(vers, :), '.', 'Markersize', 15);
    for (i = 1:size(x1, 2))
        text(x1(vers, i), y1(vers, i)+0.5, pntlist{1,i}, 'fontsize', 18);
    end
    axis off;
    plot(xaxis, [0, 0], 'k', 'linewidth', 2);
    plot([0, 0], yaxis, 'k', 'linewidth', 2);
    print('-dpng', '-r60', sprintf('q_001_%d.png', vers));
end

% q_002 - secant and slopes
for (vers = 1:4)
    close all;
    x = linspace(0, 6);
    if (vers == 1)
        y = 6-(x-4).^2*(5/16);        
    elseif (vers == 2)
        y = 3+(x-2).^2*(5/16);
    elseif (vers == 3)
        y = 6-(x-2).^2*(5/16);
    else 
        y = 3+(x-4).^2*(5/16);
    end
    plot(x, y);
    xlabel('t', 'Fontsize', 18);
    ylabel('Dist', 'Fontsize', 18);
    grid on;
    axis equal;
    print('-dpng', '-r60', sprintf('q_002_%d.png', vers));
end


