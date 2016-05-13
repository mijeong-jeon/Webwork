% approximations to e^(2x)
% f' = 2 e^(2x)
% f'' =  4 e^(2x)
% at x=-2, -1, 1, 2
% Degree 2
close all;
f = @(x) cos(3*x);
fp1 = @(x) -3 * sin(3*x);
fp2 = @(x) -9*cos(3*x);

x_points = [-2*pi, -pi, pi, 2*pi];
x_width = [pi/4, pi/4, pi/4, pi/4];

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
    print('-dpng', sprintf('q_003_%d_1.png', i));
    
    % Version B - swapped
    clf;
    plot(xx, P2(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_003_%d_2.png', i));
    
    % Version C - Tangent line
    clf;
    plot(xx, f(xx));
    hold on;
    plot(xx, P1(xx));
    print('-dpng', sprintf('q_003_%d_3.png', i));
    
    % Version D - Tangent line swapped
    clf;
    plot(xx, P1(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_003_%d_4.png', i));
    
    
    
end


