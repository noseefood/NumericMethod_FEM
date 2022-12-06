clc
clear all;
close all;

addpath('../../m-files/');
format long;

%Aufgabe1();
Aufgabe2();

function output = func(x)
    output = (x ./(1 + x)).^5;   % 千万不要忘了所有涉及数组乘除乘方都应该加上.(为了保险)
end

function output = func_abl(x)
    output = (5 .* x.^4)./(x + 1).^5 - (5 .* x.^5)./(x + 1).^6;   % diff(f(x))自动算出来的
end

function Aufgabe1()
  % Finite–Differenzen–Approximation
  h = 0.1;
  x_0 = 0.6;
  % Zweipunkte
  abl_1 = (func(x_0) - func(x_0 - h)) / h;
  disp(abl_1)
  % Dreipunkte
  abl_2 = (-3 * func(x_0) + 4 * func(x_0 + h) - func(x_0 + 2 * h)) / (2 * h);
  disp(abl_2)
  % Dreipunkte-Mittelpunkt
  abl_3 = (func(x_0 + h) - func(x_0 - h)) / (2 * h);
  disp(abl_3) 
  % Fuenfpunkte FDM5
  abl_4 = (func(x_0 - 2 * h) - 8 * func(x_0 - h) + 8 * func(x_0 + h) - func(x_0 + 2 * h)) / (12 * h);
  disp(abl_4)

end


function Aufgabe2()
% Konvergenz der Finite-Differenzen-Approximation
    x_0 = 0.6;
    h = logspace(-5, 0, 100); % 10-5 bis 1.0
    g_3 = h .^ 4;
    % Fuenfpunkte FDM5
    abl_4 = (func(x_0 - 2 .* h) - 8 .* func(x_0 - h) + 8 .* func(x_0 + h) - func(x_0 + 2 .* h)) ./ (12 * h);
    abl_true = func_abl(x_0);
    error = abs(abl_4 - abl_true);
    loglog(h, error, 'b', h, g_3, 'k--'),hold on   % log图
    xlabel('h')
    ylabel('error')
    axis([10^-5,1,10^-20,10^10]) % 设置range
    legend({'FDM5','h^4'}, 'Location','northwest') % 会与已存在的线一一对应
    grid on
        
end
