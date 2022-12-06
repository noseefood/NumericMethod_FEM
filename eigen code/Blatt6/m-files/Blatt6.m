clc
clear all;
close all;

addpath('../../m-files/');
format long;

% 求解常微分方程
Aufgabe();
% Aufgabe_test();
function output = exakt_answer(x)
    output = exp(-5 .* x) .* (x .^ 2 - 2 .* x + 2) - 2 .* exp(-6 .* x);
end


function Aufgabe()
    initial_value = 0;
    timestep = 0.1;
    % t value in different steps
    input = 0 : timestep : 2; % step:0.1 
    % Vorwaerts-Euler-Verfahren
    output_1(1) = initial_value;
    % Rueckwaerts-Euler-Verfahren
    output_2(1) = initial_value;
    % Trapezregel
    output_3(1) = initial_value;
       
    %t = 0; % t也可以这么写
    for i = 1 : numel(input)-1 % 1-20 注意这里的序号问题,别忘了减去一个,最后一步不需要算
        t = input(i); % 当前步的t(n)
        t_next = input(i + 1); % 下一步的t(n+1)
         output_1(i+1) = output_1(i) + timestep * (t .^ 2 * exp(-5 * t) - 6 * output_1(i));
         output_2(i+1) = (output_1(i) + timestep * (t_next .^ 2 * exp(-5 * t_next))) / (1 + 6 * timestep);
         output_3(i+1) = (output_1(i) + 1/2 * timestep * (t_next .^ 2 * exp(-5 * t_next) + t .^ 2 * exp(-5 * t) - 6 * output_1(i)))/ (1 + 3 * timestep);
         %t = t + timestep; % 这一句需要放在这里, 因为Vorwaerts-Euler-Verfahren使用的是上一时刻的导数
    end
    
    % Aufgabe2
    % OST
    output_4(1) = initial_value;
    % AB2
    output_5(1) = initial_value;
    % AM3
    output_6(1) = initial_value;
    % BDF2
    output_7(1) = initial_value;
    
    % M, B, C
    M_initial = 1; % const
    B_initial = -6; % const
    function out = C_func(t)  
        % C not const
        out = t ^ 2 * exp(-5 * t);
    end
    % OST
    for i = 1 : numel(input)-1 % 1-20 注意这里的序号问题,别忘了减去一个
        t = input(i); % 当前步的t(n)
        t_next = input(i + 1); % 下一步的t(n+1)
        M = M_initial;
        B = [B_initial, B_initial];
        C = [C_func(t_next), C_func(t)];
        sol = output_4(i);
        theta = 1;
        [LHS, RHS] = OST(theta, timestep, M, B, C,sol);
        output_4(i+1) = RHS / LHS;
    end
    
    %AB2
    output_5(2) = exakt_answer(input(2)); % 这里需要特别指定,因为需要前一步和当前步的信息
    for i = 2 : numel(input)-1 % 2-21 注意这里的序号问题
        t = input(i); % 当前步的t(n)
        t_last = input(i - 1); % 下一步的t(n+1)
        M = M_initial;
        B = [B_initial, B_initial];
        C = [C_func(t), C_func(t_last)];
        sol = [output_5(i), output_5(i - 1)];
        [LHS, RHS] = AB2(timestep, M, B, C,sol);
        output_5(i+1) = RHS / LHS;
    end
    
    %AM3
    output_6(2) = exakt_answer(input(2)); % 这里需要特别指定,因为需要前一步和当前步的信息
    for i = 2 : numel(input)-1 % 2-21 注意这里的序号问题, i始终代表n
        t = input(i); % 当前步的t(n)
        t_last = input(i - 1); % 下一步的t(n+1)
        t_next = input(i + 1); % 下一步的t(n+1)
        M = M_initial;
        B = [B_initial, B_initial, B_initial];
        C = [C_func(t_next), C_func(t), C_func(t_last)];
        sol = [output_6(i), output_6(i - 1)];
        [LHS, RHS] = AM3(timestep, M, B, C,sol);
        output_6(i+1) = RHS / LHS;
    end
    
    %BDF2
    output_7(2) = exakt_answer(input(2)); % 这里需要特别指定,因为需要前一步和当前步的信息
    for i = 2 : numel(input)-1 % 2-21 注意这里的序号问题
        t = input(i); % 当前步的t(n)
        t_last = input(i - 1); % 下一步的t(n+1)
        t_next = input(i + 1); % 下一步的t(n+1)
        M = M_initial;
        B = [B_initial];
        C = [C_func(t_next)];
        sol = [output_7(i), output_7(i - 1)];
        [LHS, RHS] = BDF2(timestep, M, B, C,sol);
        output_7(i+1) = RHS / LHS;
    end
    
    % real value
    output_8(1) = 0; 
    for i = 1 : numel(input) % 1-20 注意这里的序号问题,别忘了减去一个
        t = input(i); % 当前步的t(n)
        output_8(i) = exakt_answer(t);
    end
    
    % Visualization
    plot(input, output_1, 'b')
    hold on
    plot(input, output_2, 'Color',[0.9290 0.6940 0.1250])
    hold on
    plot(input, output_3, 'r')
    hold on
    plot(input, output_4, 'c')  % 蓝紫色
    hold on
    plot(input, output_5, 'g')  
    hold on
    plot(input, output_6, 'k') 
    hold on
    plot(input, output_7, 'y') 
    hold on
    plot(input, output_8, '--m') 
    
    xlabel('t')
    ylabel('function value')
    legend({'Euler vorwaerts','Euler Rueckwaerts', 'Trapezregel', 'OST', 'AB2', 'AM3', 'BDF2', 'real value'}, 'Location','northeast') % 会与已存在的线一一对应
    axis([0,2,0,4 * 10^-3]) % 设置range')
       
    
end

function Aufgabe_test()
    % 测试 Fkt.IX-XII
    % OST
    theta = 0.5;
    timestep = 0.2;
    M = [1.1];
    B = [1.4, 1.5];
    C = [1.7, 1.8];
    sol = [2.0];
    [LHS, RHS] = OST(theta, timestep, M, B, C, sol);
    disp(LHS) 
    disp(RHS)
    % AB2
    timestep = 0.2;
    M = [1.1];
    B = [1.5, 1.6];
    C = [1.8, 1.9];
    sol = [2.0, 2.1];
    [LHS, RHS] = AB2(timestep, M, B, C, sol);
    disp(LHS) 
    disp(RHS)  
    % AM3
    timestep = 0.2;
    M = [1.1];
    B = [1.4, 1.5, 1.6];
    C = [1.7, 1.8, 1.9];
    sol = [2.0, 2.1];
    [LHS, RHS] = AM3(timestep, M, B, C, sol);
    disp(LHS) 
    disp(RHS)     
    % BDF2
    timestep = 0.2;
    M = 1.1;
    B = 1.4;
    C = 1.7;
    sol = [2.0, 2.1];
    [LHS, RHS] = BDF2(timestep, M, B, C, sol);
    disp('right BDF2')
    disp(LHS) 
    disp(RHS)
end


