function Draw_Base2()
    %d1 = 4;
    Xmin = -400;
    Xmax = 400;
    Ymin = -400;
    Ymax = 400;
    Zmin = -100;
    Zmax = 500;
    %[X,Y,Z] = cylinder(1.5);
    %Z = Z * d1+1.5;

% Kích thước của hình chữ nhật lớn
    rectWidth = 180;
    rectLength = 130;
    rectHeight = 155;

    % Kích thước của hình chữ nhật nhỏ (đế trụ)
    smallRectWidth = 190;
    smallRectLength = 140;
    smallRectHeight = 20;

    % Tạo các đỉnh của hình chữ nhật lớn
    vertices = [-rectWidth/2-50, -rectLength/2, 20;
                rectWidth/2-50, -rectLength/2, 20;
                rectWidth/2-50, rectLength/2, 20;
                -rectWidth/2-50, rectLength/2, 20;
                -rectWidth/2-50, -rectLength/2, rectHeight;
                rectWidth/2-50, -rectLength/2, rectHeight;
                rectWidth/2-50, rectLength/2, rectHeight;
                -rectWidth/2-50, rectLength/2, rectHeight];

    % Tạo các đỉnh của hình chữ nhật nhỏ (đế trụ)
    verticesSmall = [-smallRectWidth/2-50, -smallRectLength/2, 0;
                     smallRectWidth/2-50, -smallRectLength/2, 0;
                     smallRectWidth/2-50, smallRectLength/2, 0;
                     -smallRectWidth/2-50, smallRectLength/2, 0;
                     -smallRectWidth/2-50, -smallRectLength/2, smallRectHeight;
                     smallRectWidth/2-50, -smallRectLength/2, smallRectHeight;
                     smallRectWidth/2-50, smallRectLength/2, smallRectHeight;
                     -smallRectWidth/2-50, smallRectLength/2, smallRectHeight];

    % Liệt kê các đỉnh cho từng mặt của hình chữ nhật lớn
    vertices1 = vertices(1:4, :); % Mặt dưới
    vertices2 = vertices(5:8, :); % Mặt trên
    vertices3 = [vertices(1, :); vertices(2, :); vertices(6, :); vertices(5, :)]; % Mặt bên trái
    vertices4 = [vertices(2, :); vertices(3, :); vertices(7, :); vertices(6, :)]; % Mặt bên phải
    vertices5 = [vertices(3, :); vertices(4, :); vertices(8, :); vertices(7, :)]; % Mặt sau
    vertices6 = [vertices(4, :); vertices(1, :); vertices(5, :); vertices(8, :)]; % Mặt trước

    % Liệt kê các đỉnh cho từng mặt của hình chữ nhật nhỏ (đế trụ)
    verticesSmall1 = verticesSmall(1:4, :); % Mặt dưới của hình chữ nhật nhỏ
    verticesSmall2 = verticesSmall(5:8, :); % Mặt trên của hình chữ nhật nhỏ
    verticesSmall3 = [verticesSmall(1, :); verticesSmall(2, :); verticesSmall(6, :); verticesSmall(5, :)]; % Mặt bên trái của hình chữ nhật nhỏ
    verticesSmall4 = [verticesSmall(2, :); verticesSmall(3, :); verticesSmall(7, :); verticesSmall(6, :)]; % Mặt bên phải của hình chữ nhật nhỏ
    verticesSmall5 = [verticesSmall(3, :); verticesSmall(4, :); verticesSmall(8, :); verticesSmall(7, :)]; % Mặt sau của hình chữ nhật nhỏ
    verticesSmall6 = [verticesSmall(4, :); verticesSmall(1, :); verticesSmall(5, :); verticesSmall(8, :)]; % Mặt trước của hình chữ nhật nhỏ

    % Vẽ tất cả 6 mặt của hình chữ nhật lớn và đặt màu
    fill3(vertices1(:,1), vertices1(:,2), vertices1(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt dưới
    hold on
    fill3(vertices2(:,1), vertices2(:,2), vertices2(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt trên
    fill3(vertices3(:,1), vertices3(:,2), vertices3(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt bên trái
    fill3(vertices4(:,1), vertices4(:,2), vertices4(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt bên phải
    fill3(vertices5(:,1), vertices5(:,2), vertices5(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt sau
    fill3(vertices6(:,1), vertices6(:,2), vertices6(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt trước

    % Vẽ tất cả 6 mặt của hình chữ nhật nhỏ (đế trụ) và đặt màu
    fill3(verticesSmall1(:,1), verticesSmall1(:,2), verticesSmall1(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt dưới của hình chữ nhật nhỏ
    fill3(verticesSmall2(:,1), verticesSmall2(:,2), verticesSmall2(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt trên của hình chữ nhật nhỏ
    fill3(verticesSmall3(:,1), verticesSmall3(:,2), verticesSmall3(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt bên trái của hình chữ nhật nhỏ
    fill3(verticesSmall4(:,1), verticesSmall4(:,2), verticesSmall4(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt bên phải của hình chữ nhật nhỏ
    fill3(verticesSmall5(:,1), verticesSmall5(:,2), verticesSmall5(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt sau của hình chữ nhật nhỏ
    fill3(verticesSmall6(:,1), verticesSmall6(:,2), verticesSmall6(:,3), [0, 0, 0]/255,'FaceAlpha',0.3); % Mặt trước của hình chữ nhật nhỏ


    % Tạo thông số cho hình trụ lớn
    %bigCylinderRadius = 2.5;
    %bigCylinderHeight = 1.5;
    %bigCylinderColor = [0, 0, 255]/255; % Màu xanh lam

    % Tạo hình trụ lớn
    %[bigX, bigY, bigZ] = cylinder(bigCylinderRadius);
    %bigZ = bigZ * bigCylinderHeight;

    % Vẽ hình trụ lớn và đặt màu
    %fill3(bigX(2,:), bigY(2,:), bigZ, 'b');
    %hold on
    %surf(bigX, bigY, bigZ, 'FaceColor', bigCylinderColor);
    
    %hold on

    % Vẽ hình trụ nhỏ
    %surf(X, Y, Z, 'FaceColor', [0, 0, 255]/255);
    
    % Tô màu mặt trên cùng của hình trụ nhỏ
    %fill3(X(2,:), Y(2,:), Z, 'b');
    path = [];
    Xmin_limit = -250;
    Xmax_limit = 0;
    Ymin_limit = -80;
    Ymax_limit = 80;
    Zmin_limit = -50;
    Zmax_limit = 300;

    for d3 = -155:10:20
        for theta1 = -deg2rad(125):deg2rad(125)/30:deg2rad(125)
            for theta2 = -deg2rad(145):deg2rad(145)/45:deg2rad(145)
                for theta4 = deg2rad(0):deg2rad(360):deg2rad(360)

                    % Calculate the forward kinematics
                    T0_1 = T(155, theta1, 125, 0);
                    T1_2 = T(0, theta2, 175, 0);
                    T2_3 = T(d3, 0, 0, 0);
                    T3_4 = T(-10, theta4, 0, pi);

                    T0_2 = T0_1 * T1_2;
                    T0_3 = T0_2 * T2_3;
                    T0_4 = T0_3 * T3_4;

                    joint4 = [T0_4(1, 4), T0_4(2, 4), T0_4(3, 4)];

                    % Append the end effector position to the path
                    [~, n] = size(path);
                    
                    circle_radius = 30;

                    % Kiểm tra xem mỗi điểm có nằm trong hình tròn không
                    if sqrt(joint4(1).^2 + joint4(2).^2 + joint4(3).^2) <= circle_radius
                            joint4(1) =0;                        
                            joint4(2) =0;                                                                                                                   
                            joint4(3) =0;
                    end

                    % append path
                        if (joint4(1) >= Xmin_limit) && (joint4(1) <= Xmax_limit)&& (joint4(2) >= Ymin_limit) && (joint4(2) <= Ymax_limit) && (joint4(3) >= Zmin_limit) && (joint4(3) <= Zmax_limit)
                            joint4(1) =0;                        
                            joint4(2) =0;                                                                                                                   
                            joint4(3) =0;
                        else
                            path(1,n+1) = joint4(1);
                            path(2,n+1) = joint4(2);
                            path(3,n+1) = joint4(3);
                        end
                            

                    
                end
            end
        end
    end

    % draw path
    x = path(1,:);

    y = path(2,:);

    z = path(3,:);

    pre_x = x;
    pre_y = y;
    pre_z = z;


    % Plot the path point
    scatter3(x, y, z, 10, 'filled', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
    
    axis([Xmin, Xmax, Ymin, Ymax, Zmin, Zmax]);
    
end
