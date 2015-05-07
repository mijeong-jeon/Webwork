% Compute the implied volatility
close all;
% clc;
clear all;

risk_free_r = 0.02;
N = 50;
ver = 4;

if (ver == 1)
    stock = 'Google';
    expiry = 'Jan 19, 2013';
    S0 = 687.65;
    T = 2.5/12;
    X = [670, 675, 680, 685, 690, 695];
    D0 = [36.6, 31.5, 28.7, 25.8, 23.4, 20.9];
elseif (ver == 2)
    stock = 'Microsoft';
    expiry = 'Jan 19, 2013';
    S0 = 26.78;
    T = 2.5/12;
    X = [25, 26, 27, 28, 29];
    D0 = [2.07, 1.24, 0.71, 0.32, 0.15];
elseif (ver == 3)
    stock = 'Apple';
    expiry = 'Feb 16, 2013';
    S0 = 587.04;
    T = 2.5/12;
    X = [575, 580, 585, 590, 595, 600, 605];
    D0 = [42.45, 39.75, 37.55, 34.75, 32.20, 30.25, 28.35];
elseif (ver == 4)
    stock = 'Orace (Database)';
    expiry = 'Mar 19, 2013';
    S0 = 31.89;
    T = 3.5/12;
    X = [30, 31, 32, 33, 34, 35];
    D0 = [2.71, 2.00, 1.46, 1.04, 0.69, 0.46];
end

% To extract just the option value from the whole tree, this 'subindex'
% function saves us from writing a separate MATLAB file.
subindex = @(M, r, c) M(r, c);

s_start = 0.2;
for (i = 1:length(X))
    x = X(i);
    d = D0(i);
    f = @(s) subindex(CallOptionTreeAmerican(risk_free_r, s, T, N, S0, x), 1, 1);
    
    diff = @(s) (f(s) - d)^2;
    [vol(i), val] = fminsearch(diff, s_start);
%     fprintf('x = %.2f, vol = %.3f, err = %.4f\n', x, vol(i), val);
    
end
fprintf('# ----\n');
fprintf('elsif ($ver == %d) {\n', ver);
fprintf('  $N = %d;\n', N);
fprintf('  $risk_free_r = %.02f;\n', risk_free_r);
fprintf('  $stock_name = "%s";\n', stock);
fprintf('  $S0 = %.2f;\n', S0);
fprintf('  $expiry = "%s";\n', expiry);
fprintf('  $months = %.1f;\n', T*12);
fprintf('  $image_name = "CallOptions%d.png";\n', ver);



fprintf('  @X = ');
ww_arr(X, '%.1f');
fprintf('  @D0 = ');
ww_arr(D0, '%.2f');
fprintf('  @vol = ');
ww_arr(vol, '%.3f');
fprintf('}\n');