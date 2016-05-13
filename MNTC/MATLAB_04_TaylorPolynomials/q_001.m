% approximations to sqrt(1 + x)
% f' = (1/2) (1+x)^(-1/2)
% f' = (1/2)(-1/2) (1+x)^(-3/2)
% at x=3, 7, 15
% Degree 2 or 3
close all;
f = @(x) sqrt(1 + x);
fp1 = @(x) (1/2)*(1+x).^(-1/2);
fp2 = @(x) (-1/4)*(1+x).^(-3/2);

x_points = [3, 8, 15];
x_width = [3.7, 6, 8];

for (i = 1:length(x_points))
    xp = x_points(i);
    xw = x_width(i);
    xx = linspace(xp-xw, xp+xw);
    P1 = @(x) f(xp) + fp1(xp)*(x-xp);
    P2 = @(x) f(xp) + fp1(xp)*(x-xp) + fp2(xp)/2*(x-xp).^2;
    
    % Version A - correct
    clf;
    plot(xx, f(xx));
    hold on;
    P2 = @(x) f(xp) + fp1(xp)*(x-xp) + fp2(xp)/2*(x-xp).^2;
    plot(xx, P2(xx));
    print('-dpng', sprintf('q_001_%d_1.png', i));
    
    % Version B - swapped
    clf;
    plot(xx, P2(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_001_%d_2.png', i));
    
    % Version C - Tangent line
    clf;
    plot(xx, f(xx));
    hold on;
    plot(xx, P1(xx));
    print('-dpng', sprintf('q_001_%d_3.png', i));
    
    % Version D - Tangent line swapped
    clf;
    plot(xx, P1(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_001_%d_4.png', i));
    
    
    
end


