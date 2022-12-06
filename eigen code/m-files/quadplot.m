function  quadplot(nodes,elements,sol)  %没有返回值
%UNTITLED3 此处显示有关此函数的摘要
    tri_index = [];
    for i = 1:size(elements,1)  %jeder Element:4
        index_element = elements(i,:); %每个element中各点在nodes和sol中的索引
        tri1_index = index_element;
        tri2_index = index_element;
        tri1_index(3) = [];  % 124
        tri2_index(1) = [];  % 254
        %tri1_index = index_element(1:3);  %1 2 5
        %tri2_index = index_element(;);   %1 5 4
        tri_index = [tri_index;tri1_index;tri2_index]; %每个四边形包含的两个三角形的索引 逐行增加            
    end
    tri_index
    C = nodes(:,1);%颜色矩阵
    trisurf(tri_index,nodes(:,1),nodes(:,2),sol,C)
    xlabel('x'),ylabel('y'),zlabel('f(x,y)')
    xlim([-1 1]);
    ylim([-1 1]);
    zlim([0 2.5]);
    ax = gca;    %包括下面两行用来反转xy轴
    ax.XDir = 'reverse';
    ax.YDir = 'reverse';
    
end

