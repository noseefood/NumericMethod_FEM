clc
clear all;
close all;

addpath('../../m-files/');
format long;

%Aufgabe1();
Aufgabe2();


function Aufgabe1()
% for task 1/2
    xi = 0;
    eta = 0;
    disp(linquadref(xi,eta))
    f_value = [0.0, 1.0, 3.0, 1.0];
    f_est = 0;
    N = linquadref(xi,eta);
    for i = 1 : numel(f_value)
        f_est = f_est + N(i) * f_value(i);
    end
    disp(f_est)
end


function Aufgabe2()
% for task 3/4
    xi = 0.577;
    eta = -0.577;
    disp(linquadref(xi,eta))
    f_value = [0.0, 1.0, 3.0, 1.0];
    f_est = 0;
    deriv = linquadderivref(xi,eta);
    
    f_deriv_xi = 0;
    f_deriv_eta = 0;    
    for i = 1 : 4
        f_deriv_xi = f_deriv_xi + deriv(i, 1) * f_value(i);
        f_deriv_eta = f_deriv_eta + deriv(i, 2) * f_value(i);
    end
    
    disp("deriv: ")
    disp(deriv)
    disp("f_deriv_xi: ")
    disp(f_deriv_xi)
    disp("f_deriv_eta: ")
    disp(f_deriv_eta)
end
