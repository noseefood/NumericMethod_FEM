clc
clear all;
close all;

addpath('../../m-files/');
format long;

Aufgabe1();
Aufgabe2();


function Aufgabe1()
    lineintersection()

end


function Aufgabe2()
    prompt = 'Was ist Grad? ';
    grad = input(prompt);
    %x_node = linspace(0.0,grad,grad+1);   % for task(a,b) grad为n，共有n+1个数据点 根据题意一阶时x点坐标分别为0,1, 以此类推
    x_node = linspace(0.0,4.0,grad+1);  % for task(c)
    f_node = (x_node./(1+x_node)).^5;  % 
    x = 0.6; % 测试点
    fL1 = LagrangePolynom(x, grad, x_node, f_node);  % Lagrange-Polynoms
    fL1_deriv = LagrangeDerivPolynom(x, grad, x_node, f_node); % Ableitung des Lagrange-Polynoms
    disp(fL1)
    disp(fL1_deriv)

end
