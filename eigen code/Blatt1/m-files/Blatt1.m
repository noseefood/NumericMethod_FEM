clc
clear all;
close all;

addpath('../../m-files/');
format long;

%Aufgabe1();
%Aufgabe2();
Aufgabe3();
mtest();

function Aufgabe1()
    A = [3 0 0 0;0 3 0 0;0 0 3 0;0 0 0 3];  % A = diag([3 3 3 3])
    v = [1;2;3;4];
    a = dot(v,v)
    B = v * v'
    C = A * B
    Lambda = eig(C)  %Eigenwert
    x = (C - A)\(a * v)
    C(:,2) = v
    b = C(3 ,:)
    c = [10:0.5:100]  %行向量
    f = c.*(5+c)+ 1./c +2.^c   %2.^c = power(2,c)
    lf = size(f,2)  %直接size(f)会输出1 181
end

function Aufgabe2()
    a = rand(1000,1);
    if a(1) >= 0.5; %别忘了加上；符号来抑制if输出布尔值
        disp('a1 >= 0.5')
    else
        disp('a1 < 0.5')
    end
    
    n05 = 0;
    for i = 1:length(a)
        if a(i)>=0.5
           n05 = n05+1;
        end       
    end
    n05
    
    j = 1;
    i = 0;
    ai = 0;
    while j<=1000
        if a(j)>=0.499 && a(j)<=0.501
            ai = a(j);
            i = j;
            break;        
        end
        j=j+1;
    end
    
    if ai ~= 0
        fprintf('Der erste Eintrag ist %6.4f,Nummer ist %d',ai,i)
    else   %说明ai没有被赋值，即数组中没有满足条件的值
        disp('Kein Element 0.499<=a_i<=0.501')
    end

    Faktorielle = facultaet(5)
    Faktorielle = facultaet(0)
end

function Aufgabe3()
    x = linspace(-pi,pi,20);
    y = sin(x);
    plot(x,y);
end

function mtest()
    nodes = [-1,-1;0,-1;1,-1;-1, 0;0, 0; 1, 0;-1, 1; 0, 1; 1, 1];
    elements = [1, 2, 5, 4; 2, 3, 6, 5; 4, 5, 8, 7; 5, 6, 9, 8];
    sol = [2; 1; 2; 1; 0; 1; 2; 1; 2];   
    quadplot(nodes,elements,sol)
end