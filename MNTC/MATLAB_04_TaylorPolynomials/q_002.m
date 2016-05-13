% approximations to e^(2x)
% f' = 2 e^(2x)
% f'' =  4 e^(2x)
% at x=-2, -1, 1, 2
% Degree 2
close all;
f = @(x) exp(2*x);
fp1 = @(x) 2 * exp(2*x);
fp2 = @(x) 4*exp(2*x);

x_points = [-2, -1, 1, 2];
x_width = [0.8, 0.8, 0.8, 0.8];

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
    print('-dpng', sprintf('q_002_%d_1.png', i));
    
    % Version B - swapped
    clf;
    plot(xx, P2(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_002_%d_2.png', i));
    
    % Version C - Tangent line
    clf;
    plot(xx, f(xx));
    hold on;
    plot(xx, P1(xx));
    print('-dpng', sprintf('q_002_%d_3.png', i));
    
    % Version D - Tangent line swapped
    clf;
    plot(xx, P1(xx));
    hold on;
    plot(xx, f(xx));
    print('-dpng', sprintf('q_002_%d_4.png', i));
    
    
    
end


