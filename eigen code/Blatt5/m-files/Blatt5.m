clc
clear all;
close all;

addpath('../../m-files/');
format long;

Aufgabe1();
Aufgabe2();

function output = func(x)
    output = (x ./(1 + x)).^5;   % 千万不要忘了所有涉及数组乘除乘方都应该加上.(为了保险)
end

function output = func_abl(x)
    output = (5 .* x.^4)./(x + 1).^5 - (5 .* x.^5)./(x + 1).^6;   % diff(f(x))自动算出来的
end

function Aufgabe1()
    a = 0;
    b = 4;
    % Mittelpunktregel
    output_1 = (b - a) * func((a + b) / 2);
    value_1 = ['Mittelpunktregel :' num2str(output_1)] ;
    disp(value_1)
    % Trapezregel
    output_2 = (b - a) * (func(a) + func(b)) / 2;
    value_2 = ['Mittelpunktregel :' num2str(output_2)];
    disp(value_2)  
    % Gauß-Quadratur mit einer Stützstelle
    output_3 = (b - a) / 2 * sum(gw(1) .* func((b-a) / 2 .* gx(1) + (a+b) / 2)); % (b - a) / 2 是dx/dμ, 此时gx(1) = 0
    value_3 = ['Gauß-Quadratur(0NE) :' num2str(output_3)];
    disp(value_3) 
    % Gauß-Quadratur mit zwei Stützstellen
    output_3 = (b - a) / 2 * sum(gw(2) .* func((b-a) / 2 .* gx(2) + (a+b) / 2)); % (b - a) / 2 是dx/dμ
    value_3 = ['Gauß-Quadratur(TWO) :' num2str(output_3)];
    disp(value_3)   
    % Gauß-Quadratur mit drei Stützstellen
    output_3 = (b - a) / 2 * sum(gw(3) .* func((b-a) / 2 .* gx(3) + (a+b) / 2)); % (b - a) / 2 是dx/dμ
    value_3 = ['Gauß-Quadratur(THREE) :' num2str(output_3)];
    disp(value_3)   
end


function Aufgabe2()
    a = 0;
    b = 4;
    % test Fkt.III
    disp(gx(3))
    % test Fkt.IV
    disp(gw(3))
    % test Fkt.V
    disp(gx2dref(3))
    % test Fkt.VI
    disp(gw2dref(3))
    % test Fkt.VII
    nodes = [2,1;4,1;4,3;2,2];
    xi = 0.577;
    eta = -0.577;
    out_1 = getxPos(nodes, xi, eta); % 通过xi, eta得到对应的x-y坐标
    disp(out_1)
    % test Fkt.VIII
    [J, detJ, invJ] = getJacobian(nodes, xi, eta);
    disp(J)
    disp(detJ)
    disp(invJ)
    
    % test integration
    inte_value = 0;
    n = 2;
    w = gw2dref(n); % 4 * 1 w
    input = gx2dref(n); % 4 * 2 xi eta   
    for i = 1 : n^2
        xi = input(i,1);
        eta = input(i,2);
        x_points = getxPos(nodes, xi, eta); % 2 * 1 
        detJ = det(getJacobian(nodes, xi, eta));
        inte_value = inte_value + (2 * x_points(1) + x_points(2)) * detJ * w(i);
    end
    disp(inte_value)
end
